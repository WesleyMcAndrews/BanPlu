unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB, DateUtils;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    Query1: TADOQuery;
    Sumario: TADOQuery;
    SumarioSrc: TDataSource;
    SumarioCodigoEstacao: TWideStringField;
    SumarioNomeEstacao: TWideStringField;
    SumarioAltitude: TFloatField;
    SumarioLatG: TWideStringField;
    SumarioLatM: TWideStringField;
    SumarioLatS: TWideStringField;
    SumarioLongG: TWideStringField;
    SumarioLongM: TWideStringField;
    SumarioLongS: TWideStringField;
    SumarioAnos: TIntegerField;
    Detalhe: TADOQuery;
    DetalheSrc: TDataSource;
    SumarioLatitude: TStringField;
    SumarioLongitude: TStringField;
    SumarioPeriodo: TStringField;
    Analise: TADOQuery;
    SumarioDiaIni: TDateTimeField;
    SumarioDiaFim: TDateTimeField;
    Periodos: TADOQuery;
    PeriodosSrc: TDataSource;
    PeriodosRotulo: TStringField;
    PeriodosOrdem: TSmallintField;
    PeriodosDiaIni: TIntegerField;
    PeriodosMesIni: TIntegerField;
    PeriodosDiaFim: TIntegerField;
    PeriodosMesFim: TIntegerField;
    PeriodosFreq: TIntegerField;
    SumarioUF: TWideStringField;
    SumarioArquivo: TWideStringField;
    Separatrizes: TADOQuery;
    SumarioMediaAnual: TFloatField;
    SeparatrizesPeriodo: TSmallintField;
    SeparatrizesChuva: TFloatField;
    DetalheAno: TSmallintField;
    DetalheObs: TIntegerField;
    DetalheCompletude: TFloatField;
    DetalheAprovado: TBooleanField;
    DetalheAusenciaErros: TFloatField;
    AnaliseData: TDateTimeField;
    AnaliseChuva: TFloatField;
    AnaliseAno: TSmallintField;
    SumarioNro: TIntegerField;
    SumarioIDEstacao: TAutoIncField;
    SumarioLimite: TFloatField;
    DetalheIDEstacao: TIntegerField;
    DetalheErros: TIntegerField;
    Fontes: TADOQuery;
    FontesSrc: TDataSource;
    Ano: TADOQuery;
    AnoSrc: TDataSource;
    AnoMes: TIntegerField;
    AnoDSDesigner01: TFloatField;
    AnoDSDesigner02: TFloatField;
    AnoDSDesigner03: TFloatField;
    AnoDSDesigner04: TFloatField;
    AnoDSDesigner05: TFloatField;
    AnoDSDesigner06: TFloatField;
    AnoDSDesigner07: TFloatField;
    AnoDSDesigner08: TFloatField;
    AnoDSDesigner09: TFloatField;
    AnoDSDesigner10: TFloatField;
    AnoDSDesigner11: TFloatField;
    AnoDSDesigner12: TFloatField;
    AnoDSDesigner13: TFloatField;
    AnoDSDesigner14: TFloatField;
    AnoDSDesigner15: TFloatField;
    AnoDSDesigner16: TFloatField;
    AnoDSDesigner17: TFloatField;
    AnoDSDesigner18: TFloatField;
    AnoDSDesigner19: TFloatField;
    AnoDSDesigner20: TFloatField;
    AnoDSDesigner21: TFloatField;
    AnoDSDesigner22: TFloatField;
    AnoDSDesigner23: TFloatField;
    AnoDSDesigner24: TFloatField;
    AnoDSDesigner25: TFloatField;
    AnoDSDesigner26: TFloatField;
    AnoDSDesigner27: TFloatField;
    AnoDSDesigner28: TFloatField;
    AnoDSDesigner29: TFloatField;
    AnoDSDesigner30: TFloatField;
    AnoDSDesigner31: TFloatField;
    AnoTotal: TFloatField;
    AnoMdia: TFloatField;
    AnoNomeMes: TStringField;
    SumarioNomeMunicipio: TStringField;
    SumarioUFMun: TStringField;
    Municipios: TADOQuery;
    MunicipiosCodigoMunicipio: TStringField;
    MunicipiosUF: TStringField;
    MunicipiosNomeMunicipio: TStringField;
    MunicipiosSrc: TDataSource;
    SumarioCodigoMunicipio: TStringField;
    SumarioCodigoFonte: TIntegerField;
    SumarioNomeFonte: TStringField;
    FontesCodigoFonte: TAutoIncField;
    FontesNomeFonte: TStringField;
    FontesSigla: TStringField;
    FontesEndereco: TStringField;
    FontesCidade: TStringField;
    FontesUF: TStringField;
    FontesCEP: TStringField;
    FontesContato: TStringField;
    FontesFone: TStringField;
    Fontesemail: TStringField;
    FontesUrl: TStringField;
    FontesTipo: TStringField;
    FontesDtCadastro: TDateTimeField;
    FontesUsuarioCadastro: TStringField;
    FontesDtEdicao: TDateTimeField;
    FontesUsuarioEdicao: TStringField;
    FontesSiglaENome: TStringField;
    procedure SumarioCalcFields(DataSet: TDataSet);
    procedure DetalheCalcFields(DataSet: TDataSet);
    procedure PeriodosCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure AnoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    CPF:String;
    function VirgulaPorPonto(S:String):String;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

function TDM.VirgulaPorPonto(S:String):String;
begin
 If Pos('.',S)<>0 then{Retirar o ponto}
  S:=Copy(S,1,pos('.',S)-1)+Copy(S,pos('.',S)+1,Length(S)-Pos('.',S)+1);
 If Pos(',',S)<>0 then{Substituir a v�rgula pelo ponto}
  S:=Copy(S,1,pos(',',S)-1)+'.'+Copy(S,pos(',',S)+1,Length(S)-Pos(',',S)+1);
 If S='' then
  S:='0';
 Result:=S;
end;

procedure TDM.SumarioCalcFields(DataSet: TDataSet);
begin
 SumarioLatitude.AsString:=SumarioLatG.AsString+'�'+SumarioLatM.AsString+''''+SumarioLatS.AsString+'"';
 SumarioLongitude.AsString:=SumarioLongG.AsString+'�'+SumarioLongM.AsString+''''+SumarioLongS.AsString+'"';
 SumarioPeriodo.AsString:=SumarioDiaIni.AsString+' a '+SumarioDiaFim.AsString;
 //SumarioMediaAnual.Value:=SumarioTotalChuva.Value/SumarioAnos.Value;
 SumarioNro.Value:=Abs(Sumario.RecNo);
end;

procedure TDM.DetalheCalcFields(DataSet: TDataSet);
begin
 DetalheCompletude.Value:=(DetalheObs.Value*100)/DaysInAYear(DetalheAno.Value);
 DetalheAusenciaErros.Value:=((DetalheObs.Value-DetalheErros.Value)*100)/DetalheObs.Value;
 DetalheAprovado.AsBoolean:=(DetalheCompletude.Value>90)and(DetalheAusenciaErros.Value>90);
end;

procedure TDM.PeriodosCalcFields(DataSet: TDataSet);
begin
 //R�tulo
 If Periodos.Filter='Anual' then
  PeriodosRotulo.AsString:=PeriodosOrdem.AsString;
 If Periodos.Filter='Mensal' then
  PeriodosRotulo.asString:=FormatDateTime('mmm',StrToDate('01/'+PeriodosMesIni.AsString+'/2006'));
 If Periodos.Filter='Quinzenal' then
 begin
  If Odd(PeriodosOrdem.Value) then
   PeriodosRotulo.asString:='1� de '+FormatDateTime('mmm',StrToDate('01/'+PeriodosMesIni.AsString+'/2006'))
  else
   PeriodosRotulo.asString:='2� de '+FormatDateTime('mmm',StrToDate('01/'+PeriodosMesIni.AsString+'/2006'));
 end;
 If Periodos.Filter='Decendial' then
  //PeriodosRotulo.asString:=PeriodosOrdem.AsString;
  If PeriodosDiaIni.Value=1  then
   PeriodosRotulo.asString:='1� de '+FormatDateTime('mmm',StrToDate('01/'+PeriodosMesIni.AsString+'/2006'))
  else If PeriodosDiaIni.Value=11 then
   PeriodosRotulo.asString:='2� de '+FormatDateTime('mmm',StrToDate('01/'+PeriodosMesIni.AsString+'/2006'))
  else
   PeriodosRotulo.asString:='3� de '+FormatDateTime('mmm',StrToDate('01/'+PeriodosMesIni.AsString+'/2006'));
 If Periodos.Filter='Pentadal' then
  PeriodosRotulo.asString:=PeriodosOrdem.AsString;
end;



procedure TDM.DataModuleCreate(Sender: TObject);
begin
 DecimalSeparator:=',';
 ShortDateFormat:='dd/mm/yyyy';
 ThousandSeparator:='.';
 CPF:='781.915.641-49'
end;

procedure TDM.AnoCalcFields(DataSet: TDataSet);
begin
 AnoNomeMes.AsString:=ShortMonthNames[AnoMes.Value];
end;

end.
