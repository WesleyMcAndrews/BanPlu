unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ComCtrls, DateUtils;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ADOConnection1: TADOConnection;
    Estacoes: TADOTable;
    ProgressBar1: TProgressBar;
    EstacoesCodigoEstacao: TWideStringField;
    EstacoesUF: TWideStringField;
    EstacoesNomeEstacao: TWideStringField;
    EstacoesLatG: TWideStringField;
    EstacoesLatM: TWideStringField;
    EstacoesLatS: TWideStringField;
    EstacoesLongG: TWideStringField;
    EstacoesLongM: TWideStringField;
    EstacoesLongS: TWideStringField;
    EstacoesAltitude: TFloatField;
    EstacoesArquivo: TWideStringField;
    EstacoesDataCadastro: TDateTimeField;
    ADOQuery1: TADOQuery;
    Button2: TButton;
    Chuva: TADOQuery;
    EstacoesSrc: TDataSource;
    ChuvaCodigoEstacao: TWideStringField;
    ChuvaData: TDateTimeField;
    ChuvaChuva: TFloatField;
    Detalhe: TADOQuery;
    DetalheSrc: TDataSource;
    DetalheCodigoEstacao: TWideStringField;
    DetalheAno: TSmallintField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure CadastrarEstacao;
    procedure CadastrarDados;
    Function VirgulaPorPonto(S:String):String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Ano, Lin: Integer;
  S:TStringList;

implementation

{$R *.dfm}

function TForm1.VirgulaPorPonto(S:String):String;
begin
 If Pos('.',S)<>0 then{Retirar o ponto}
  S:=Copy(S,1,pos('.',S)-1)+Copy(S,pos('.',S)+1,Length(S)-Pos('.',S)+1);
 If Pos(',',S)<>0 then{Substituir a vírgula pelo ponto}
  S:=Copy(S,1,pos(',',S)-1)+'.'+Copy(S,pos(',',S)+1,Length(S)-Pos(',',S)+1);
 If S='' then
  S:='0';
 Result:=S;
end;

procedure TForm1.CadastrarEstacao;
Var
 Lat, Long:real;
begin
 If not Estacoes.Locate('CodigoEstacao',Trim(Copy(S[Lin],1,4)),[]) then
 begin
  try
   Estacoes.Append;
   EstacoesCodigoEstacao.AsString:=Trim(Copy(S[Lin],1,4));
   EstacoesUF.AsString:='PE';
   EstacoesNomeEstacao.AsString:=Trim(Copy(S[Lin],6,42));
   Lat:=Abs(StrToFloat(Trim(Copy(S[Lin],49,8))));
   EstacoesLatG.Value:=FormatFloat('00',Int(Lat));
   EstacoesLatM.Value:=FormatFloat('00',Int((Lat-Int(Lat))*60));
   EstacoesLatS.AsString:=FormatFloat('00',Int((((Lat-Int(Lat))*60)-Int((Lat-Int(Lat))*60))*60));
   Long:=Abs(StrToFloat(Trim(Copy(S[Lin],58,8))));
   EstacoesLongG.Value:=FormatFloat('00',Int(Long));
   EstacoesLongM.Value:=FormatFloat('00',Int((Long-Int(Long))*60));
   EstacoesLongS.Value:=FormatFloat('00',Int((((Long-Int(Long))*60)-Int((Long-Int(Long))*60))*60));;
   EstacoesAltitude.Value:=0;
   Estacoes.Post;
  except
   Estacoes.Cancel;
  end;
 end; 
end;

procedure TForm1.CadastrarDados;
Var
 L:String;
 Dado, Mes:String;
 I:Integer;
begin
 ADOQuery1.SQl.Clear;
 ADOQuery1.SQl.Add('Insert Into Chuva (CodigoEstacao, Data, Chuva)');
 ADOQuery1.SQl.Add(' ');
 L:=Copy(S[Lin],67,300);
 For I:=1 to 31 do
 begin
  Dado:=Trim(Copy(L,1+((I-1)*6),6));
  If pos('--',Dado)>0 then
   Continue;
  If Dado='' then
   Break;
  If Copy(L,length(L)-3,3)='JAN' then
   Mes:='01'
  else If Copy(L,length(L)-3,3)='FEV' then
   Mes:='02'
  else If Copy(L,length(L)-3,3)='MAR' then
   Mes:='03'
  else If Copy(L,length(L)-3,3)='ABR' then
   Mes:='04'
  else If Copy(L,length(L)-3,3)='MAI' then
   Mes:='05'
  else If Copy(L,length(L)-3,3)='JUN' then
   Mes:='06'
  else If Copy(L,length(L)-3,3)='JUL' then
   Mes:='07'
  else If Copy(L,length(L)-3,3)='AGO' then
   Mes:='08'
  else If Copy(L,length(L)-3,3)='SET' then
   Mes:='09'
  else If Copy(L,length(L)-3,3)='OUT' then
   Mes:='10'
  else If Copy(L,length(L)-3,3)='NOV' then
   Mes:='11'
  else If Copy(L,length(L)-3,3)='DEZ' then
   Mes:='12';
  ADOQuery1.SQL.Strings[1]:='Values('+QuotedStr(Trim(Copy(S[Lin],1,4)))+',#'+IntToStr(I)+'/'+Mes+'/'+IntToStr(Ano)+'#,'+VirgulaPorPonto(trim(Copy(L,1+((I-1)*6),6)))+')';
  try
   ADOQuery1.ExecSQL;
  except
  end;
 end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 S:=TStringList.Create;
 Estacoes.Open;
 //Chuva.Open;
 S.LoadFromFile('.\PDM_1912_2006.TXT');
 ProgressBar1.Max:=S.Count;
 Lin:=0;
 While Lin<S.Count-1 do
 begin
  If S[Lin]='' then
  begin
   If Lin+1>=S.Count-1 then //Fim do arquivo
    Break;
   Ano:=StrToInt(Copy(S[Lin+1],96,4));
   Lin:=Lin+4;
  end;
  While S[Lin]<>'' do
  begin
   CadastrarEstacao;
   CadastrarDados;
   Lin:=Lin+1;
  end;
  ProgressBar1.Position:=Lin;
  Application.ProcessMessages;
 end;//Fim do arquivo
 Estacoes.Close;
 //Chuva.Close;
 ShowMessage('Fim da carga do arquivo.');
end;

procedure TForm1.Button2Click(Sender: TObject);
Var
 Plu:TStringList;
 Str,Dado:String;
 Mes,Dia:Integer;
begin
 Screen.Cursor:=CrHourGlass;
 Estacoes.Open;
 ProgressBar1.Max:=Estacoes.RecordCount;
 Plu:=TStringList.Create;
 While not Estacoes.Eof do
 begin
  PLU.Clear;
  //Primeira Linha
  Str:=Copy(EstacoesNomeEstacao.AsString,1,28);
  While length(Str)<>29 do
   Str:=Str+' ';
  Str:=Str+EstacoesLatG.AsString+EstacoesLatM.AsString+EstacoesLatS.AsString;
  While length(Str)<>44 do
   Str:=Str+' ';
  Str:=Str+EstacoesLongG.AsString+EstacoesLongM.AsString+EstacoesLongS.AsString;
  While length(Str)<>60 do
   Str:=Str+' ';
  Str:=Str+EstacoesAltitude.AsString;
  Plu.Add(Str);
  //Anos
  Detalhe.Open;
  Chuva.Open;
  While not Detalhe.Eof do
  begin
   Plu.Add(FormatFloat('000000',EstacoesCodigoEstacao.AsInteger)+','+DetalheAno.AsString);
   For Mes:=1 to 12 do
   begin
    Str:='             ';
    For Dia:=1 to 31 do
    begin
     If Dia<=DaysInAMonth(DetalheAno.Value,Mes) then
     begin
      If RecodeDate(strToDate('01/01/2006'),DetalheAno.Value,Mes,Dia)=ChuvaData.Value then
      begin
       Dado:=FloatToStr(ChuvaChuva.Value*10);
       While length(Dado)<>4 do Dado:=' '+Dado;
       Str:=Str+Dado;
       Chuva.Next;
      end
      else
       Str:=Str+'   0';//Dia ausente
      If Dia=15 then
      begin
       Plu.Add(Str+'   0');
       Str:='             ';
      end;
     end
     else
      Str:=Str+'   0';
    end;
    Plu.Add(Str);
   end;
   Detalhe.Next;
  end;//EOF
  Chuva.Close;
  Detalhe.Close;
  Plu.Add('000000');
  Plu.SaveToFile(ExtractFilePath(ParamStr(0))+FormatFloat('000000',EstacoesCodigoEstacao.AsInteger)+'.PLU');
  Estacoes.Next;
  Application.ProcessMessages;
  ProgressBar1.Position:=ProgressBar1.Position+1;
 end;
 PLU.Free;
 Screen.Cursor:=CrDefault;
 ShowMessage('Fim da conversão.');
end;

end.
