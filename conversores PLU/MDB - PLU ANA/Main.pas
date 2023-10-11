unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ADODB, DateUtils, ComCtrls, Math, Grids,
  DBGrids;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    OpenDialog1: TOpenDialog;
    QChuva: TADOQuery;
    QChuvaSrc: TDataSource;
    Chuva: TADOQuery;
    ChuvaRegistroID: TFloatField;
    ChuvaImportado: TWordField;
    ChuvaTemporario: TWordField;
    ChuvaRemovido: TWordField;
    ChuvaImportadoRepetido: TWordField;
    ChuvaEstacaoCodigo: TIntegerField;
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
    QChuvaEstacaoCodigo: TIntegerField;
    ProgressBar1: TProgressBar;
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
    ChuvaNivelConsistencia: TWordField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure EstacoesCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure QChuvaSrcDataChange(Sender: TObject; Field: TField);
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
begin
 If OpenDialog1.Execute then
 begin
  Edit1.Text:=OpenDialog1.FileName;
  Chuva.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+OpenDialog1.FileName+';Persist Security Info=False';
  QChuva.ConnectionString:=Chuva.ConnectionString;
  SpeedButton2.Enabled:=true;
  ProgressBar1.Position:=0;
 end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
Var
 P:TStringList;
 Str, Dado:String;
 Mes,UltimoAno,I:Integer;
begin
 Screen.cursor:=CrHourGlass;
 SpeedButton2.Enabled:=false;
 QChuva.Open;
 Chuva.Open;
 ProgressBar1.Max:=QChuva.RecordCount;
 P:=TStringList.Create;
 While not QChuva.Eof do
 begin
  P.Clear;
  Application.ProcessMessages;
  //Primeira Linha
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
  P.Add(Str);
  UltimoAno:=YearOf(ChuvaData.Value);
  Mes:=1;
  While not Chuva.Eof do
  begin
   If Mes=1 then
    P.Add(EstacoesCodigo.AsString+','+IntToStr(UltimoAno));
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
  P.SaveToFile(ExtractFilePath(OpenDialog1.FileName)+ChuvaEstacaoCodigo.AsString+'-'+EstacoesNome.asstring+'.PLU');
  QChuva.Next;
  ProgressBar1.Position:=ProgressBar1.Position+1;
 end;
 Chuva.Close;
 QChuva.Close;
 Estacoes.Close;
 Screen.cursor:=CrDefault;
 ShowMessage('Dados Convertidos com sucesso!');
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

procedure TForm1.FormCreate(Sender: TObject);
begin
 UF[11]:='RO';
 UF[12]:='AC';
 UF[13]:='AM';
 UF[14]:='RR';
 UF[15]:='PA';
 UF[16]:='AP';
 UF[17]:='TO';
 UF[21]:='MA';
 UF[22]:='PI';
 UF[23]:='CE';
 UF[24]:='RN';
 UF[25]:='PB';
 UF[26]:='PE';
 UF[27]:='AL';
 UF[28]:='SE';
 UF[29]:='BA';
 UF[31]:='MG';
 UF[32]:='ES';
 UF[33]:='RJ';
 UF[35]:='SP';
 UF[41]:='PR';
 UF[42]:='SC';
 UF[43]:='RS';
 UF[50]:='MS';
 UF[51]:='MT';
 UF[52]:='GO';
 UF[53]:='DF';
 try
  Estacoes.open;
 except
  ShowMessage('Não foi possível abrir o arquivo Estacoes.mdb');
  Halt;
 end;
end;

procedure TForm1.QChuvaSrcDataChange(Sender: TObject; Field: TField);
begin
 Chuva.Close;
 Chuva.SQL[2]:='and EstacaoCodigo='+QChuvaEstacaoCodigo.AsString;
 Chuva.SQL[6]:='and EstacaoCodigo='+QChuvaEstacaoCodigo.AsString;
 Chuva.SQL[10]:='and EstacaoCodigo='+QChuvaEstacaoCodigo.AsString+')';
 Chuva.Open;
end;

end.
