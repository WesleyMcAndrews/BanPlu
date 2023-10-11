unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, FileCtrl, Buttons, DB, ADODB, ZipTypes, Unzip,
  DateUtils, Math;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    Chuva: TADOQuery;
    ChuvaRegistroID: TFloatField;
    ChuvaImportado: TWordField;
    ChuvaTemporario: TWordField;
    ChuvaRemovido: TWordField;
    ChuvaImportadoRepetido: TWordField;
    ChuvaEstacaoCodigo: TIntegerField;
    ChuvaNivelConsistencia: TWordField;
    ChuvaData: TDateTimeField;
    ChuvaTipoMedicaoChuvas: TWordField;
    ChuvaMaxima: TFloatField;
    ChuvaTotal: TFloatField;
    ChuvaDiaMaxima: TWordField;
    ChuvaNumDiasDeChuva: TWordField;
    ChuvaMaximaStatus: TWordField;
    ChuvaTotalStatus: TWordField;
    ChuvaNumDiasDeChuvaStatus: TWordField;
    ChuvaTotalAnual: TFloatField;
    ChuvaTotalAnualStatus: TWordField;
    ChuvaChuva01: TFloatField;
    ChuvaChuva02: TFloatField;
    ChuvaChuva03: TFloatField;
    ChuvaChuva04: TFloatField;
    ChuvaChuva05: TFloatField;
    ChuvaChuva06: TFloatField;
    ChuvaChuva07: TFloatField;
    ChuvaChuva08: TFloatField;
    ChuvaChuva09: TFloatField;
    ChuvaChuva10: TFloatField;
    ChuvaChuva11: TFloatField;
    ChuvaChuva12: TFloatField;
    ChuvaChuva13: TFloatField;
    ChuvaChuva14: TFloatField;
    ChuvaChuva15: TFloatField;
    ChuvaChuva16: TFloatField;
    ChuvaChuva17: TFloatField;
    ChuvaChuva18: TFloatField;
    ChuvaChuva19: TFloatField;
    ChuvaChuva20: TFloatField;
    ChuvaChuva21: TFloatField;
    ChuvaChuva22: TFloatField;
    ChuvaChuva23: TFloatField;
    ChuvaChuva24: TFloatField;
    ChuvaChuva25: TFloatField;
    ChuvaChuva26: TFloatField;
    ChuvaChuva27: TFloatField;
    ChuvaChuva28: TFloatField;
    ChuvaChuva29: TFloatField;
    ChuvaChuva30: TFloatField;
    ChuvaChuva31: TFloatField;
    ChuvaChuva01Status: TWordField;
    ChuvaChuva02Status: TWordField;
    ChuvaChuva03Status: TWordField;
    ChuvaChuva04Status: TWordField;
    ChuvaChuva05Status: TWordField;
    ChuvaChuva06Status: TWordField;
    ChuvaChuva07Status: TWordField;
    ChuvaChuva08Status: TWordField;
    ChuvaChuva09Status: TWordField;
    ChuvaChuva10Status: TWordField;
    ChuvaChuva11Status: TWordField;
    ChuvaChuva12Status: TWordField;
    ChuvaChuva13Status: TWordField;
    ChuvaChuva14Status: TWordField;
    ChuvaChuva15Status: TWordField;
    ChuvaChuva16Status: TWordField;
    ChuvaChuva17Status: TWordField;
    ChuvaChuva18Status: TWordField;
    ChuvaChuva19Status: TWordField;
    ChuvaChuva20Status: TWordField;
    ChuvaChuva21Status: TWordField;
    ChuvaChuva22Status: TWordField;
    ChuvaChuva23Status: TWordField;
    ChuvaChuva24Status: TWordField;
    ChuvaChuva25Status: TWordField;
    ChuvaChuva26Status: TWordField;
    ChuvaChuva27Status: TWordField;
    ChuvaChuva28Status: TWordField;
    ChuvaChuva29Status: TWordField;
    ChuvaChuva30Status: TWordField;
    ChuvaChuva31Status: TWordField;
    Estacoes: TADOQuery;
    EstacoesRegistroID: TFloatField;
    EstacoesImportado: TWordField;
    EstacoesTemporario: TWordField;
    EstacoesRemovido: TWordField;
    EstacoesImportadoRepetido: TWordField;
    EstacoesBaciaCodigo: TIntegerField;
    EstacoesSubBaciaCodigo: TIntegerField;
    EstacoesRioCodigo: TIntegerField;
    EstacoesEstadoCodigo: TIntegerField;
    EstacoesMunicipioCodigo: TIntegerField;
    EstacoesResponsavelCodigo: TIntegerField;
    EstacoesResponsavelUnidade: TSmallintField;
    EstacoesResponsavelJurisdicao: TSmallintField;
    EstacoesOperadoraCodigo: TIntegerField;
    EstacoesOperadoraUnidade: TSmallintField;
    EstacoesOperadoraSubUnidade: TSmallintField;
    EstacoesTipoEstacao: TWordField;
    EstacoesCodigo: TIntegerField;
    EstacoesNome: TWideStringField;
    EstacoesCodigoAdicional: TWideStringField;
    EstacoesLatitude: TFloatField;
    EstacoesLongitude: TFloatField;
    EstacoesAltitude: TFloatField;
    EstacoesAreaDrenagem: TFloatField;
    EstacoesTipoEstacaoEscala: TWordField;
    EstacoesTipoEstacaoRegistradorNivel: TWordField;
    EstacoesTipoEstacaoDescLiquida: TWordField;
    EstacoesTipoEstacaoSedimentos: TWordField;
    EstacoesTipoEstacaoQualAgua: TWordField;
    EstacoesTipoEstacaoPluviometro: TWordField;
    EstacoesTipoEstacaoRegistradorChuva: TWordField;
    EstacoesTipoEstacaoTanqueEvapo: TWordField;
    EstacoesTipoEstacaoClimatologica: TWordField;
    EstacoesTipoEstacaoPiezometria: TWordField;
    EstacoesTipoEstacaoTelemetrica: TWordField;
    EstacoesPeriodoEscalaInicio: TDateTimeField;
    EstacoesPeriodoEscalaFim: TDateTimeField;
    EstacoesPeriodoRegistradorNivelInicio: TDateTimeField;
    EstacoesPeriodoRegistradorNivelFim: TDateTimeField;
    EstacoesPeriodoDescLiquidaInicio: TDateTimeField;
    EstacoesPeriodoDescLiquidaFim: TDateTimeField;
    EstacoesPeriodoSedimentosInicio: TDateTimeField;
    EstacoesPeriodoSedimentosFim: TDateTimeField;
    EstacoesPeriodoQualAguaInicio: TDateTimeField;
    EstacoesPeriodoQualAguaFim: TDateTimeField;
    EstacoesPeriodoPluviometroInicio: TDateTimeField;
    EstacoesPeriodoPluviometroFim: TDateTimeField;
    EstacoesPeriodoRegistradorChuvaInicio: TDateTimeField;
    EstacoesPeriodoRegistradorChuvaFim: TDateTimeField;
    EstacoesPeriodoTanqueEvapoInicio: TDateTimeField;
    EstacoesPeriodoTanqueEvapoFim: TDateTimeField;
    EstacoesPeriodoClimatologicaInicio: TDateTimeField;
    EstacoesPeriodoClimatologicaFim: TDateTimeField;
    EstacoesPeriodoPiezometriaInicio: TDateTimeField;
    EstacoesPeriodoPiezometriaFim: TDateTimeField;
    EstacoesPeriodoTelemetricaInicio: TDateTimeField;
    EstacoesPeriodoTelemetricaFim: TDateTimeField;
    EstacoesTipoRedeBasica: TWordField;
    EstacoesTipoRedeEnergetica: TWordField;
    EstacoesTipoRedeNavegacao: TWordField;
    EstacoesTipoRedeCursoDagua: TWordField;
    EstacoesTipoRedeEstrategica: TWordField;
    EstacoesTipoRedeCaptacao: TWordField;
    EstacoesTipoRedeSedimentos: TWordField;
    EstacoesTipoRedeQualAgua: TWordField;
    EstacoesTipoRedeClasseVazao: TWordField;
    EstacoesUltimaAtualizacao: TDateTimeField;
    EstacoesOperando: TWordField;
    EstacoesDescricao: TMemoField;
    EstacoesHistorico: TMemoField;
    EstacoesNumImagens: TIntegerField;
    EstacoesLat: TStringField;
    EstacoesLong: TStringField;
    ProgressBar2: TProgressBar;
    BitBtn1: TBitBtn;
    E: TADOQuery;
    ECodigo: TIntegerField;
    ENome: TWideStringField;
    ECdigoAdicional: TWideStringField;
    EBacia: TWideStringField;
    ESubbacia: TWideStringField;
    ERio: TWideStringField;
    EEstado: TWideStringField;
    EMunicpio: TWideStringField;
    EResponsvel: TWideStringField;
    EOperadora: TWideStringField;
    ELatitude: TWideStringField;
    ELongitude: TWideStringField;
    EAltitudem: TWideStringField;
    EreadeDrenagemkm2: TWideStringField;
    ELat: TWideStringField;
    ELong: TWideStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure EstacoesCalcFields(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  UF:array[1..53] of string;

implementation

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
 Var
  P:TStringList;
  F,I,Mes,UltimoAno:Integer;
  s,d,ss : shortstring;
  Str, Dado, Nome:String;
begin
 ProgressBar2.Position:=0;
 ProgressBar2.Max:=FileListBox1.Count;
 Screen.Cursor:=crHourGlass;
 P:=TStringList.Create;
 Estacoes.Open;
 For F:=0 to FileListBox1.Items.Count-1 do
 begin
  //Descompactar arquivo
  s := DirectoryListBox1.Directory+'\'+FileListBox1.Items[F] + #0;
  d := DirectoryListBox1.Directory+'\' + #0;
  ss:= '*.mdb' + #0;
  FileUnzip( @s[1], @d[1], @ss[1], nil, nil);
  RenameFile(DirectoryListBox1.Directory+'\'+'CHUVAS.MDB',DirectoryListBox1.Directory+'\'+Copy(FileListBox1.Items[F],1,pos('.',FileListBox1.Items[F])-1)+'.MDB');
  //Abrir Banco de Dados
  Chuva.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+DirectoryListBox1.Directory+'\'+Copy(FileListBox1.Items[F],1,pos('.',FileListBox1.Items[F])-1)+'.MDB;Persist Security Info=False';
  Chuva.Open;
  //Transformar em PLU
  P.Clear;
  Application.ProcessMessages;
  Nome:='';
  If Estacoes.Locate('Codigo',ChuvaEstacaoCodigo.AsString,[]) then
  begin
   //Primeira Linha
   Nome:=EstacoesNome.AsString;
   Str:=Copy(EstacoesNome.AsString,1,28);
   While length(Str)<29 do
    Str:=Str+' ';
   Str:=Str+EstacoesLat.AsString;
   While length(Str)<44 do
    Str:=Str+' ';
   Str:=Str+EstacoesLong.AsString;
   While length(Str)<61 do
    Str:=Str+' ';
   Str:=Str+EstacoesAltitude.AsString;
  end
  else
   Str:=ChuvaEstacaoCodigo.AsString;
  P.Add(Str);
  UltimoAno:=YearOf(ChuvaData.Value);
  Mes:=1;
  While not Chuva.Eof do
  begin
   If Mes=1 then
    P.Add(ChuvaEstacaoCodigo.AsString+','+IntToStr(UltimoAno));
   If Mes<MonthOf(ChuvaData.Value) then
   begin
    P.Add('                                                                             ');
    P.Add('                                                                             ');
    Mes:=Mes+1;
    Continue;
   end
   else
   begin
    //Primeira Linha
    Str:='             ';
    For I:=1 to 15 do
    begin
     If Chuva.FieldByName('Chuva'+FormatFloat('00',I)).AsString<>'' then
      Dado:=FloatToStr(RoundTo(Chuva.FieldByName('Chuva'+FormatFloat('00',I)).Value,-1)*10)
     else
      Dado:='    ';
     While length(Dado)<4 do Dado:=' '+Dado;
     Str:=Str+Dado;
    end;
    P.Add(Str+'   0');
    //Segunda Linha
    Str:='             ';
    For I:=16 to DaysInMonth(ChuvaData.Value) do
    begin
     If Chuva.FieldByName('Chuva'+FormatFloat('00',I)).AsString<>'' then
      Dado:=FloatToStr(RoundTo(Chuva.FieldByName('Chuva'+FormatFloat('00',I)).Value,-1)*10)
     else
      Dado:='    ';
     While length(Dado)<4 do Dado:=' '+Dado;
     Str:=Str+Dado;
    end;
    While Length(Str)<77 do
     Str:=Str+'   0';
    P.Add(Str);
    Mes:=Mes+1;
    Chuva.Next; //Próximo mês
   end;
   If (YearOf(ChuvaData.Value)<>UltimoAno)or(Chuva.eof) then
   begin
    UltimoAno:=YearOf(ChuvaData.Value);
    //Completar o ano
    While Mes<12 do
    begin
     P.Add('                                                                             ');
     P.Add('                                                                             ');
     Mes:=Mes+1;
    end;
    Mes:=1;
   end;
  end;
  P.Add('00000');
  try
   P.SaveToFile(DirectoryListBox1.Directory+'\'+ChuvaEstacaoCodigo.AsString+'-'+Nome+'.PLU');
  except
   P.SaveToFile(DirectoryListBox1.Directory+'\'+ChuvaEstacaoCodigo.AsString+'.PLU');
  end;


  Chuva.Close;
  DeleteFile(DirectoryListBox1.Directory+'\'+Copy(FileListBox1.Items[F],1,pos('.',FileListBox1.Items[F])-1)+'.ldb');
  DeleteFile(DirectoryListBox1.Directory+'\'+Copy(FileListBox1.Items[F],1,pos('.',FileListBox1.Items[F])-1)+'.mdb');
  ProgressBar2.Position:=ProgressBar2.Position+1;
 end;
 Estacoes.Close;
 Screen.Cursor:=crDefault;
 ShowMessage('Fim');
end;

procedure TForm1.EstacoesCalcFields(DataSet: TDataSet);
Var
 Lat,Long:Real;
begin
 Lat:=Abs(EstacoesLatitude.Value);
 EstacoesLat.AsString:=FormatFloat('00',Int(Lat))+FormatFloat('00',Int((Lat-Int(Lat))*60))+FormatFloat('00',Int((((Lat-Int(Lat))*60)-Int((Lat-Int(Lat))*60))*60));
 Long:=Abs(EstacoesLongitude.Value);
 EstacoesLong.AsString:=FormatFloat('00',Int(Long))+FormatFloat('00',Int((Long-Int(Long))*60))+FormatFloat('00',Int((((Long-Int(Long))*60)-Int((Long-Int(Long))*60))*60));
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
 S,Str,Lat,Long:String;
 Arq:TstringList;
 F:Integer;
begin
 E.Open;
 ProgressBar2.Max:=FileListBox1.Count;
 Arq:=TStringList.Create;
 For F:=0 to FileListBox1.Items.Count-1 do
 begin
  If E.Locate('Codigo',StrToInt(Copy(FileListBox1.Items[F],1,pos('-',FileListBox1.Items[F])-1)),[]) then
  begin
   Arq.LoadFromFile(DirectoryListBox1.Directory+'\'+FileListBox1.Items[F]);
   S:=ELatitude.AsString;
   Lat:='';
   Long:='';
   While Pos(':',S)>0 do
   begin
    Lat:=Lat+FormatFloat('00',StrToInt(Copy(S,1,pos(':',S)-1)));
    Delete(S,1,pos(':',S));
   end;
   Lat:=Lat+FormatFloat('00',StrToInt(S));
   S:=ELongitude.AsString;
   While Pos(':',S)>0 do
   begin
   Long:=Long+FormatFloat('00',StrToInt(Copy(S,1,pos(':',S)-1)));
    Delete(S,1,pos(':',S));
   end;
   Long:=Long+FormatFloat('00',StrToInt(S));
   //1a Linha
   Str:=Copy(ENome.AsString,1,28);
   While length(Str)<29 do
    Str:=Str+' ';
   Str:=Str+Lat;
   While length(Str)<44 do
    Str:=Str+' ';
   Str:=Str+Long;
   While length(Str)<61 do
    Str:=Str+' ';
   S:=EAltitudem.AsString;
   If S<>'-' then
   begin
    While pos(',',S)>0 do
     S:=Copy(S,1,pos(',',S)-1)+Copy(S,pos(',',S)+1,10);
    Str:=Str+S;
   end;
   Arq.Strings[0]:=Str;
   Arq.SaveToFile(DirectoryListBox1.Directory+'\'+FileListBox1.Items[F]);
  end;
  ProgressBar2.Position:=ProgressBar2.Position+1;
  Application.ProcessMessages;
 end;
 E.Close;
 ShowMessage('Fim');
end;

end.
