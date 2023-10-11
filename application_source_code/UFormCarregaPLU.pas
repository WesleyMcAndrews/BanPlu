unit UFormCarregaPLU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, ComCtrls, FileCtrl, ComObj, Buttons, DBCtrls,
  ADODB;

type
  TFormCarregaPLU = class(TForm)
    Button1: TButton;
    FileList: TFileListBox;
    Directory: TDirectoryListBox;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    DriveComboBox1: TDriveComboBox;
    Label3: TLabel;
    UFCombo: TComboBox;
    Memo2: TMemo;
    Label4: TLabel;
    FonteCombo: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    Query2: TADOQuery;
    Label2: TLabel;
    ProgressBar2: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FileListChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private
    Procedure CarregaChuva(Codigo:String; Ano:Integer; Linha:String; Arquivo:String);
    { Private declarations }
  public
    { Public declarations }
    Erros:Integer;
  end;

var
  FormCarregaPLU: TFormCarregaPLU;

implementation

 Uses DataModule, UFormCadastroFontes;

{$R *.DFM}

Procedure TFormCarregaPLU.CarregaChuva(Codigo:String; Ano:Integer; Linha:String; Arquivo:String);
Var
 K:Integer;
 Data:TDate;
 Dado:Real;
begin
 Data:=StrToDate('01/01/'+IntToStr(Ano));
 K:=1;
 DM.Query1.SQl.Clear;
 DM.Query1.SQl.Add('Insert Into Climadia (IDEstacao, Data, UF, Chuva)');
 DM.Query1.SQl.Add(' ');
 Label2.Caption:='Ano: '+IntToStr(Ano);
 Application.ProcessMessages;
 While (Data<=StrToDate('31/12/'+IntToStr(Ano)))and(K+4<Length(Linha)) do
 begin
  //testar se o valor da chuva � v�lido
  try
   Dado:=StrToFloat(Copy(Linha,K,4))/10;
  except
   Memo1.Lines.Add('Erro ao converter chuva para decimal: '+Arquivo+', Data: '+DateToStr(Data));
   Erros:=Erros+1;
   K:=K+4;
   Data:=Data+1;
   Continue;
  end;
  DM.Query1.SQl.Strings[1]:='Values('+Codigo+','+QuotedStr(FormatDateTime('mm/dd/yyyy',Data))+','+QuotedStr(UFCombo.Text)+','+FloatToStr(Dado)+')';
  try
   DM.Query1.ExecSql;
  except
   With Query2 do
   begin
    SQl.Clear;
    Sql.Add('Update Climadia');
    SQl.Add('Set Chuva='+FloatToStr(StrToFloat(Copy(Linha,K,4))/10));
    SQl.Add('Where IDEstacao='+Codigo);
    SQl.Add('And Data='+QuotedStr(FormatDateTime('mm/dd/yyyy',Data)));
    try
     ExecSQL;
    except
     Memo1.Lines.Add('N�o foi poss�vel incluir nem atualizar: '+Arquivo+', Data: '+DateToStr(Data));
     Erros:=Erros+1;
    end;
   end;
  end;
  K:=K+4;
  Data:=Data+1;
 end;
 ProgressBar2.Position:=ProgressBar2.Position+1;
end;

procedure TFormCarregaPLU.Button1Click(Sender: TObject);
 Var
 I,J,L,Ano:Integer;
 Arq:TStringList;
 LatG,LatM,LatS,LongG,LongM,LongS,Linha,S,CodigoEstacao,IDEstacao:String;
 NovaEstacao:Boolean;
begin
 Arq:=TStringList.Create;
 ShortDateFormat:='dd/mm/yyyy';
 DecimalSeparator:='.';
 Screen.Cursor:=crhourglass;
 ProgressBar1.Max:=FileList.Items.Count;
 ProgressBar1.Position:=0;
 Button1.Enabled:=false;
 //Criar diret�rio 'Carregados'
 if not DirectoryExists(Directory.Directory+'\Carregados') then
  ForceDirectories(Directory.Directory+'\Carregados');
 For I:=0 to FileList.Items.Count-1 do
 begin
  Erros:=0;
  Arq.Clear;
  Arq.LoadFromFile(Directory.Directory+'\'+FileList.Items[I]);
  Label1.Caption:='Arquivo: '+FileList.Items[I];
  ProgressBar2.Position:=0;
  ProgressBar2.Max:=trunc(Arq.Count/25.07);
  Application.ProcessMessages;
  L:=1;
  //Cadastrar Estacao
  If pos(',',Arq.Strings[1])<>0 then
   CodigoEstacao:=Copy(Arq.Strings[1],1,pos(',',Arq.Strings[1])-1)
  else
   CodigoEstacao:=Copy(Arq.Strings[1],1,pos(' ',Arq.Strings[1])-1);
  //If not DM.Sumario.Locate('CodigoEstacao',CodigoEstacao,[]) then
  LatG:=Copy(Arq.Strings[0],30,2);
  LatM:=Copy(Arq.Strings[0],32,2);
  LatS:=Copy(Arq.Strings[0],34,2);
  LongG:=Copy(Arq.Strings[0],45,2);
  LongM:=Copy(Arq.Strings[0],47,2);
  LongS:=Copy(Arq.Strings[0],49,2);
  With DM.Query1 do
  begin
   SQL.Clear;
   SQL.Add('Insert into Estacoes (CodigoEstacao,UF,NomeEstacao,LatG,LatM,LatS,');
   SQl.Add('LongG,LongM,LongS,Altitude,Arquivo,CodigoFonte,UsuarioEdicao,UsuarioCadastro)');
   SQl.Add('Values('+QuotedStr(CodigoEstacao)+','+QuotedStr(UFCombo.Text)+',');
   SQl.Add(QuotedStr(Trim(Copy(Arq.Strings[0],1,29)))+','+QuotedStr(LatG)+','+QuotedStr(LatM)+',');
   SQL.Add(QuotedStr(LatS)+','+QuotedStr(LongG)+','+QuotedStr(LongM)+','+QuotedStr(LongS)+',');
   SQl.Add(trim(Copy(Arq.Strings[0],61,6))+','+QuotedStr(FileList.Items[I])+',');
   SQl.Add(IntToStr(FonteCombo.KeyValue)+','+QuotedStr(DM.CPF)+','+QuotedStr(DM.CPF)+')');
   try
    ExecSQL;
    SQl.Clear;
    SQl.Add('Select @@Identity as IDEstacao from Estacoes');
    Open;
    IDEstacao:=FieldByname('IDEstacao').AsString;
    Close;
    NovaEstacao:=true;
   except
    If (CodigoEstacao<>'')and(UFCombo.Text<>'') then
    begin
     SQl.Clear;
     SQl.Add('Select IDEstacao from Estacoes');
     SQl.Add('Where CodigoEstacao='+QuotedStr(CodigoEstacao));
     SQl.Add('And UF='+QuotedStr(UFCombo.Text));
     Open;
    end;
    If (RecordCount=0)and(LatG<>'')and(LatM<>'')and(LatS<>'')and(LongG<>'')and(LongM<>'')and(LongS<>'') then
    begin
     SQl.Clear;
     SQl.Add('Select IDEstacao, NomeEstacao, UF from Estacoes');
     SQl.Add('Where LatG='+QuotedStr(LatG));
     SQl.Add('And LatM='+QuotedStr(LatM));
     SQl.Add('And LatS='+QuotedStr(LatS));
     SQl.Add('And LongG='+QuotedStr(LongG));
     SQl.Add('And LongM='+QuotedStr(LongM));
     SQl.Add('And LongS='+QuotedStr(LongS));
     Open;
     If (RecordCount>0)and
     (MessageDlg('Esta Esta��o est� no mesmo ponto da Esta��o:'+#13+
     FieldByname('NomeEstacao').AsString+'-'+FieldByname('UF').AsString+#13+
     'Deseja usar esta Esta��o?',mtConfirmation,[mbYes,mbNo],0)<>mrYes)  then
      Continue;
    end;
    If RecordCount=0 then
    begin
     Close;
     Memo1.Lines.Add('Erro no arquivo: '+FileList.Items[I]+' - Erro ao tentar cadastrar/localizar esta��o.');
     Continue;
    end
    else
    begin
     IDEstacao:=FieldByname('IDEstacao').AsString;
     Close;
     NovaEstacao:=false;
    end;
   end;
  end;
  While (L<Arq.Count-1)and(Copy(trim(Arq.strings[L]),1,3)<>'000') do
  begin
   Linha:=Arq.Strings[L];
   If Linha='' then //Corrigir a linha em branco antes do pr�ximo ano
   begin
    L:=L+1;
    Linha:=Arq.Strings[L];
   end;
   If pos(',',linha)<>0 then//Se n�o for ',' � ' ' (espa�o)
    Ano:=StrToInt(Copy(Linha,pos(',',linha)+1,4))
   else
    Ano:=StrToInt(Copy(Linha,pos(' ',linha)+1,4));
   L:=L+1;
   Linha:='';
   For J:=1 to 12 do
   begin
    If Trim(Copy(Arq.strings[L],1,3))<>''  then
     Break;
    Linha:=Linha+Copy(Arq.Strings[L],14,60);
    If trim(Copy(Arq.strings[L+1],1,3))<>'' then
     Break;
    If J in([4,6,9,11]) then
     Linha:=Linha+Copy(Arq.Strings[L+1],14,60) //30 Dias
    else if (J=2) and (not IsLeapYear(Ano)) then
     Linha:=Linha+Copy(Arq.Strings[L+1],14,52) //28 Dias
    else if (J=2) and (IsLeapYear(Ano)) then
     Linha:=Linha+Copy(Arq.Strings[L+1],14,56) //29 Dias
    else
     Linha:=Linha+Copy(Arq.Strings[L+1],14,64); //31 Dias
    L:=L+2;
   end;
   CarregaChuva(IDEstacao, Ano, Linha, FileList.Items[I]);
  end; //processar pr�ximo ano
  ProgressBar1.Position:=ProgressBar1.Position+1;
  If Erros=0 then //Mover para 'Carregados'
  MoveFile(PChar(Directory.Directory+'\'+FileList.Items[I]),PChar(Directory.Directory+'\Carregados\'+FileList.Items[I]));
 end;{Pr�ximo arquivo}
 Arq.free;
 DecimalSeparator:='.';
 UFCombo.ItemIndex:=-1;
 Memo1.Lines.SaveToFile(ExtractFilePath(ParamStr(0))+'Log_'+UFCombo.Text+'_plu.txt');
 Screen.Cursor:=crDefault;
 ShowMessage('Arquivos Carregados!');
end;

procedure TFormCarregaPLU.FormActivate(Sender: TObject);
begin
 Directory.Drive:='C';
end;

procedure TFormCarregaPLU.FileListChange(Sender: TObject);
begin
 Button1.Enabled:=(FileList.Items.Count>0)and(UfCombo.Text<>'')and(FonteCombo.Text<>'');
end;

procedure TFormCarregaPLU.FormCreate(Sender: TObject);
begin
 DM.Fontes.Open;
end;

procedure TFormCarregaPLU.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DM.Fontes.Close;
end;

procedure TFormCarregaPLU.SpeedButton1Click(Sender: TObject);
begin
 with TFormCadastroFontes.Create(Self) do
 try
  ShowModal;
 finally
  free;
  DM.Fontes.Close;
  DM.Fontes.Open;
 end;
end;

end.
