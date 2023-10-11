object Form1: TForm1
  Left = 299
  Top = 182
  BorderStyle = bsDialog
  Caption = 'Conversor Hidroweb-ANA ZIP->PLU'
  ClientHeight = 344
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 131
    Height = 13
    Caption = '...\HidroWeb-ANA ZIP-PLU'
  end
  object SpeedButton1: TSpeedButton
    Left = 456
    Top = 288
    Width = 89
    Height = 25
    Caption = 'Converter!'
    OnClick = SpeedButton1Click
  end
  object FileListBox1: TFileListBox
    Left = 160
    Top = 48
    Width = 385
    Height = 233
    ItemHeight = 13
    Mask = '*.ZIP'
    TabOrder = 0
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 8
    Top = 48
    Width = 145
    Height = 233
    DirLabel = Label1
    FileList = FileListBox1
    ItemHeight = 16
    TabOrder = 1
  end
  object DriveComboBox1: TDriveComboBox
    Left = 8
    Top = 8
    Width = 145
    Height = 19
    DirList = DirectoryListBox1
    TabOrder = 2
  end
  object ProgressBar2: TProgressBar
    Left = 8
    Top = 320
    Width = 537
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 416
    Top = 16
    Width = 129
    Height = 25
    Caption = 'Corrigir 1a Linha'
    Enabled = False
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object Chuva: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Chuvas'
      'Where NivelConsistencia=2'
      'Union ALL'
      'select * from Chuvas'
      'Where NivelConsistencia=1'
      'and Data not in '
      '(Select Data from  Chuvas'
      'Where NivelConsistencia=2)'
      'order by data')
    Left = 216
    Top = 16
    object ChuvaRegistroID: TFloatField
      FieldName = 'RegistroID'
    end
    object ChuvaImportado: TWordField
      FieldName = 'Importado'
    end
    object ChuvaTemporario: TWordField
      FieldName = 'Temporario'
    end
    object ChuvaRemovido: TWordField
      FieldName = 'Removido'
    end
    object ChuvaImportadoRepetido: TWordField
      FieldName = 'ImportadoRepetido'
    end
    object ChuvaEstacaoCodigo: TIntegerField
      FieldName = 'EstacaoCodigo'
    end
    object ChuvaNivelConsistencia: TWordField
      FieldName = 'NivelConsistencia'
    end
    object ChuvaData: TDateTimeField
      FieldName = 'Data'
    end
    object ChuvaTipoMedicaoChuvas: TWordField
      FieldName = 'TipoMedicaoChuvas'
    end
    object ChuvaMaxima: TFloatField
      FieldName = 'Maxima'
    end
    object ChuvaTotal: TFloatField
      FieldName = 'Total'
    end
    object ChuvaDiaMaxima: TWordField
      FieldName = 'DiaMaxima'
    end
    object ChuvaNumDiasDeChuva: TWordField
      FieldName = 'NumDiasDeChuva'
    end
    object ChuvaMaximaStatus: TWordField
      FieldName = 'MaximaStatus'
    end
    object ChuvaTotalStatus: TWordField
      FieldName = 'TotalStatus'
    end
    object ChuvaNumDiasDeChuvaStatus: TWordField
      FieldName = 'NumDiasDeChuvaStatus'
    end
    object ChuvaTotalAnual: TFloatField
      FieldName = 'TotalAnual'
    end
    object ChuvaTotalAnualStatus: TWordField
      FieldName = 'TotalAnualStatus'
    end
    object ChuvaChuva01: TFloatField
      FieldName = 'Chuva01'
    end
    object ChuvaChuva02: TFloatField
      FieldName = 'Chuva02'
    end
    object ChuvaChuva03: TFloatField
      FieldName = 'Chuva03'
    end
    object ChuvaChuva04: TFloatField
      FieldName = 'Chuva04'
    end
    object ChuvaChuva05: TFloatField
      FieldName = 'Chuva05'
    end
    object ChuvaChuva06: TFloatField
      FieldName = 'Chuva06'
    end
    object ChuvaChuva07: TFloatField
      FieldName = 'Chuva07'
    end
    object ChuvaChuva08: TFloatField
      FieldName = 'Chuva08'
    end
    object ChuvaChuva09: TFloatField
      FieldName = 'Chuva09'
    end
    object ChuvaChuva10: TFloatField
      FieldName = 'Chuva10'
    end
    object ChuvaChuva11: TFloatField
      FieldName = 'Chuva11'
    end
    object ChuvaChuva12: TFloatField
      FieldName = 'Chuva12'
    end
    object ChuvaChuva13: TFloatField
      FieldName = 'Chuva13'
    end
    object ChuvaChuva14: TFloatField
      FieldName = 'Chuva14'
    end
    object ChuvaChuva15: TFloatField
      FieldName = 'Chuva15'
    end
    object ChuvaChuva16: TFloatField
      FieldName = 'Chuva16'
    end
    object ChuvaChuva17: TFloatField
      FieldName = 'Chuva17'
    end
    object ChuvaChuva18: TFloatField
      FieldName = 'Chuva18'
    end
    object ChuvaChuva19: TFloatField
      FieldName = 'Chuva19'
    end
    object ChuvaChuva20: TFloatField
      FieldName = 'Chuva20'
    end
    object ChuvaChuva21: TFloatField
      FieldName = 'Chuva21'
    end
    object ChuvaChuva22: TFloatField
      FieldName = 'Chuva22'
    end
    object ChuvaChuva23: TFloatField
      FieldName = 'Chuva23'
    end
    object ChuvaChuva24: TFloatField
      FieldName = 'Chuva24'
    end
    object ChuvaChuva25: TFloatField
      FieldName = 'Chuva25'
    end
    object ChuvaChuva26: TFloatField
      FieldName = 'Chuva26'
    end
    object ChuvaChuva27: TFloatField
      FieldName = 'Chuva27'
    end
    object ChuvaChuva28: TFloatField
      FieldName = 'Chuva28'
    end
    object ChuvaChuva29: TFloatField
      FieldName = 'Chuva29'
    end
    object ChuvaChuva30: TFloatField
      FieldName = 'Chuva30'
    end
    object ChuvaChuva31: TFloatField
      FieldName = 'Chuva31'
    end
    object ChuvaChuva01Status: TWordField
      FieldName = 'Chuva01Status'
    end
    object ChuvaChuva02Status: TWordField
      FieldName = 'Chuva02Status'
    end
    object ChuvaChuva03Status: TWordField
      FieldName = 'Chuva03Status'
    end
    object ChuvaChuva04Status: TWordField
      FieldName = 'Chuva04Status'
    end
    object ChuvaChuva05Status: TWordField
      FieldName = 'Chuva05Status'
    end
    object ChuvaChuva06Status: TWordField
      FieldName = 'Chuva06Status'
    end
    object ChuvaChuva07Status: TWordField
      FieldName = 'Chuva07Status'
    end
    object ChuvaChuva08Status: TWordField
      FieldName = 'Chuva08Status'
    end
    object ChuvaChuva09Status: TWordField
      FieldName = 'Chuva09Status'
    end
    object ChuvaChuva10Status: TWordField
      FieldName = 'Chuva10Status'
    end
    object ChuvaChuva11Status: TWordField
      FieldName = 'Chuva11Status'
    end
    object ChuvaChuva12Status: TWordField
      FieldName = 'Chuva12Status'
    end
    object ChuvaChuva13Status: TWordField
      FieldName = 'Chuva13Status'
    end
    object ChuvaChuva14Status: TWordField
      FieldName = 'Chuva14Status'
    end
    object ChuvaChuva15Status: TWordField
      FieldName = 'Chuva15Status'
    end
    object ChuvaChuva16Status: TWordField
      FieldName = 'Chuva16Status'
    end
    object ChuvaChuva17Status: TWordField
      FieldName = 'Chuva17Status'
    end
    object ChuvaChuva18Status: TWordField
      FieldName = 'Chuva18Status'
    end
    object ChuvaChuva19Status: TWordField
      FieldName = 'Chuva19Status'
    end
    object ChuvaChuva20Status: TWordField
      FieldName = 'Chuva20Status'
    end
    object ChuvaChuva21Status: TWordField
      FieldName = 'Chuva21Status'
    end
    object ChuvaChuva22Status: TWordField
      FieldName = 'Chuva22Status'
    end
    object ChuvaChuva23Status: TWordField
      FieldName = 'Chuva23Status'
    end
    object ChuvaChuva24Status: TWordField
      FieldName = 'Chuva24Status'
    end
    object ChuvaChuva25Status: TWordField
      FieldName = 'Chuva25Status'
    end
    object ChuvaChuva26Status: TWordField
      FieldName = 'Chuva26Status'
    end
    object ChuvaChuva27Status: TWordField
      FieldName = 'Chuva27Status'
    end
    object ChuvaChuva28Status: TWordField
      FieldName = 'Chuva28Status'
    end
    object ChuvaChuva29Status: TWordField
      FieldName = 'Chuva29Status'
    end
    object ChuvaChuva30Status: TWordField
      FieldName = 'Chuva30Status'
    end
    object ChuvaChuva31Status: TWordField
      FieldName = 'Chuva31Status'
    end
  end
  object Estacoes: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Sistemas Delphi\' +
      'Agroconsult\Conversores PLU\HidroWeb-ANA ZIP-PLU\Estacoes.mdb;Pe' +
      'rsist Security Info=False'
    CursorType = ctStatic
    OnCalcFields = EstacoesCalcFields
    Parameters = <>
    SQL.Strings = (
      'Select * from Estacao'
      'order by Codigo')
    Left = 176
    Top = 16
    object EstacoesRegistroID: TFloatField
      FieldName = 'RegistroID'
    end
    object EstacoesImportado: TWordField
      FieldName = 'Importado'
    end
    object EstacoesTemporario: TWordField
      FieldName = 'Temporario'
    end
    object EstacoesRemovido: TWordField
      FieldName = 'Removido'
    end
    object EstacoesImportadoRepetido: TWordField
      FieldName = 'ImportadoRepetido'
    end
    object EstacoesBaciaCodigo: TIntegerField
      FieldName = 'BaciaCodigo'
    end
    object EstacoesSubBaciaCodigo: TIntegerField
      FieldName = 'SubBaciaCodigo'
    end
    object EstacoesRioCodigo: TIntegerField
      FieldName = 'RioCodigo'
    end
    object EstacoesEstadoCodigo: TIntegerField
      FieldName = 'EstadoCodigo'
    end
    object EstacoesMunicipioCodigo: TIntegerField
      FieldName = 'MunicipioCodigo'
    end
    object EstacoesResponsavelCodigo: TIntegerField
      FieldName = 'ResponsavelCodigo'
    end
    object EstacoesResponsavelUnidade: TSmallintField
      FieldName = 'ResponsavelUnidade'
    end
    object EstacoesResponsavelJurisdicao: TSmallintField
      FieldName = 'ResponsavelJurisdicao'
    end
    object EstacoesOperadoraCodigo: TIntegerField
      FieldName = 'OperadoraCodigo'
    end
    object EstacoesOperadoraUnidade: TSmallintField
      FieldName = 'OperadoraUnidade'
    end
    object EstacoesOperadoraSubUnidade: TSmallintField
      FieldName = 'OperadoraSubUnidade'
    end
    object EstacoesTipoEstacao: TWordField
      FieldName = 'TipoEstacao'
    end
    object EstacoesCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object EstacoesNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object EstacoesCodigoAdicional: TWideStringField
      FieldName = 'CodigoAdicional'
      Size = 15
    end
    object EstacoesLatitude: TFloatField
      FieldName = 'Latitude'
    end
    object EstacoesLongitude: TFloatField
      FieldName = 'Longitude'
    end
    object EstacoesAltitude: TFloatField
      FieldName = 'Altitude'
    end
    object EstacoesAreaDrenagem: TFloatField
      FieldName = 'AreaDrenagem'
    end
    object EstacoesTipoEstacaoEscala: TWordField
      FieldName = 'TipoEstacaoEscala'
    end
    object EstacoesTipoEstacaoRegistradorNivel: TWordField
      FieldName = 'TipoEstacaoRegistradorNivel'
    end
    object EstacoesTipoEstacaoDescLiquida: TWordField
      FieldName = 'TipoEstacaoDescLiquida'
    end
    object EstacoesTipoEstacaoSedimentos: TWordField
      FieldName = 'TipoEstacaoSedimentos'
    end
    object EstacoesTipoEstacaoQualAgua: TWordField
      FieldName = 'TipoEstacaoQualAgua'
    end
    object EstacoesTipoEstacaoPluviometro: TWordField
      FieldName = 'TipoEstacaoPluviometro'
    end
    object EstacoesTipoEstacaoRegistradorChuva: TWordField
      FieldName = 'TipoEstacaoRegistradorChuva'
    end
    object EstacoesTipoEstacaoTanqueEvapo: TWordField
      FieldName = 'TipoEstacaoTanqueEvapo'
    end
    object EstacoesTipoEstacaoClimatologica: TWordField
      FieldName = 'TipoEstacaoClimatologica'
    end
    object EstacoesTipoEstacaoPiezometria: TWordField
      FieldName = 'TipoEstacaoPiezometria'
    end
    object EstacoesTipoEstacaoTelemetrica: TWordField
      FieldName = 'TipoEstacaoTelemetrica'
    end
    object EstacoesPeriodoEscalaInicio: TDateTimeField
      FieldName = 'PeriodoEscalaInicio'
    end
    object EstacoesPeriodoEscalaFim: TDateTimeField
      FieldName = 'PeriodoEscalaFim'
    end
    object EstacoesPeriodoRegistradorNivelInicio: TDateTimeField
      FieldName = 'PeriodoRegistradorNivelInicio'
    end
    object EstacoesPeriodoRegistradorNivelFim: TDateTimeField
      FieldName = 'PeriodoRegistradorNivelFim'
    end
    object EstacoesPeriodoDescLiquidaInicio: TDateTimeField
      FieldName = 'PeriodoDescLiquidaInicio'
    end
    object EstacoesPeriodoDescLiquidaFim: TDateTimeField
      FieldName = 'PeriodoDescLiquidaFim'
    end
    object EstacoesPeriodoSedimentosInicio: TDateTimeField
      FieldName = 'PeriodoSedimentosInicio'
    end
    object EstacoesPeriodoSedimentosFim: TDateTimeField
      FieldName = 'PeriodoSedimentosFim'
    end
    object EstacoesPeriodoQualAguaInicio: TDateTimeField
      FieldName = 'PeriodoQualAguaInicio'
    end
    object EstacoesPeriodoQualAguaFim: TDateTimeField
      FieldName = 'PeriodoQualAguaFim'
    end
    object EstacoesPeriodoPluviometroInicio: TDateTimeField
      FieldName = 'PeriodoPluviometroInicio'
    end
    object EstacoesPeriodoPluviometroFim: TDateTimeField
      FieldName = 'PeriodoPluviometroFim'
    end
    object EstacoesPeriodoRegistradorChuvaInicio: TDateTimeField
      FieldName = 'PeriodoRegistradorChuvaInicio'
    end
    object EstacoesPeriodoRegistradorChuvaFim: TDateTimeField
      FieldName = 'PeriodoRegistradorChuvaFim'
    end
    object EstacoesPeriodoTanqueEvapoInicio: TDateTimeField
      FieldName = 'PeriodoTanqueEvapoInicio'
    end
    object EstacoesPeriodoTanqueEvapoFim: TDateTimeField
      FieldName = 'PeriodoTanqueEvapoFim'
    end
    object EstacoesPeriodoClimatologicaInicio: TDateTimeField
      FieldName = 'PeriodoClimatologicaInicio'
    end
    object EstacoesPeriodoClimatologicaFim: TDateTimeField
      FieldName = 'PeriodoClimatologicaFim'
    end
    object EstacoesPeriodoPiezometriaInicio: TDateTimeField
      FieldName = 'PeriodoPiezometriaInicio'
    end
    object EstacoesPeriodoPiezometriaFim: TDateTimeField
      FieldName = 'PeriodoPiezometriaFim'
    end
    object EstacoesPeriodoTelemetricaInicio: TDateTimeField
      FieldName = 'PeriodoTelemetricaInicio'
    end
    object EstacoesPeriodoTelemetricaFim: TDateTimeField
      FieldName = 'PeriodoTelemetricaFim'
    end
    object EstacoesTipoRedeBasica: TWordField
      FieldName = 'TipoRedeBasica'
    end
    object EstacoesTipoRedeEnergetica: TWordField
      FieldName = 'TipoRedeEnergetica'
    end
    object EstacoesTipoRedeNavegacao: TWordField
      FieldName = 'TipoRedeNavegacao'
    end
    object EstacoesTipoRedeCursoDagua: TWordField
      FieldName = 'TipoRedeCursoDagua'
    end
    object EstacoesTipoRedeEstrategica: TWordField
      FieldName = 'TipoRedeEstrategica'
    end
    object EstacoesTipoRedeCaptacao: TWordField
      FieldName = 'TipoRedeCaptacao'
    end
    object EstacoesTipoRedeSedimentos: TWordField
      FieldName = 'TipoRedeSedimentos'
    end
    object EstacoesTipoRedeQualAgua: TWordField
      FieldName = 'TipoRedeQualAgua'
    end
    object EstacoesTipoRedeClasseVazao: TWordField
      FieldName = 'TipoRedeClasseVazao'
    end
    object EstacoesUltimaAtualizacao: TDateTimeField
      FieldName = 'UltimaAtualizacao'
    end
    object EstacoesOperando: TWordField
      FieldName = 'Operando'
    end
    object EstacoesDescricao: TMemoField
      FieldName = 'Descricao'
      BlobType = ftMemo
    end
    object EstacoesHistorico: TMemoField
      FieldName = 'Historico'
      BlobType = ftMemo
    end
    object EstacoesNumImagens: TIntegerField
      FieldName = 'NumImagens'
    end
    object EstacoesLat: TStringField
      FieldKind = fkCalculated
      FieldName = 'Lat'
      Size = 6
      Calculated = True
    end
    object EstacoesLong: TStringField
      FieldKind = fkCalculated
      FieldName = 'Long'
      Size = 6
      Calculated = True
    end
  end
  object E: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Sistemas Delphi\' +
      'DataPlanta\ChupaDados\Hidroweb\HidroWeb.mdb;Persist Security Inf' +
      'o=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Estacoes')
    Left = 312
    Top = 104
    object ECodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ENome: TWideStringField
      FieldName = 'Nome'
      Size = 255
    end
    object ECdigoAdicional: TWideStringField
      FieldName = 'C'#243'digo Adicional'
      Size = 50
    end
    object EBacia: TWideStringField
      FieldName = 'Bacia'
      Size = 50
    end
    object ESubbacia: TWideStringField
      FieldName = 'Sub-bacia'
      Size = 50
    end
    object ERio: TWideStringField
      FieldName = 'Rio'
      Size = 50
    end
    object EEstado: TWideStringField
      FieldName = 'Estado'
      Size = 50
    end
    object EMunicpio: TWideStringField
      FieldName = 'Munic'#237'pio'
      Size = 255
    end
    object EResponsvel: TWideStringField
      FieldName = 'Respons'#225'vel'
      Size = 255
    end
    object EOperadora: TWideStringField
      FieldName = 'Operadora'
      Size = 50
    end
    object ELatitude: TWideStringField
      FieldName = 'Latitude'
      Size = 50
    end
    object ELongitude: TWideStringField
      FieldName = 'Longitude'
      Size = 50
    end
    object EAltitudem: TWideStringField
      FieldName = 'Altitude (m)'
      Size = 50
    end
    object EreadeDrenagemkm2: TWideStringField
      FieldName = #193'rea de Drenagem (km2)'
      Size = 50
    end
    object ELat: TWideStringField
      FieldName = 'Lat'
    end
    object ELong: TWideStringField
      FieldName = 'Long'
    end
  end
end
