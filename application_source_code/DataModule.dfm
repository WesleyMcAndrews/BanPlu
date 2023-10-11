object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 235
  Top = 227
  Height = 362
  Width = 519
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=termopilas;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=DataPlanta;Data Source=dataplanta'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object Query1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 32
    Top = 80
  end
  object Sumario: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = SumarioCalcFields
    Parameters = <>
    SQL.Strings = (
      
        'SELECT IDEstacao,CodigoEstacao,UF,NomeEstacao,Altitude,LatG,LatM' +
        ',LatS,LongG,LongM,LongS,'
      
        'Arquivo,DiaIni,DiaFim,Anos,Limite, CodigoMunicipio, NomeMunicipi' +
        'o, UFMun, CodigoFonte, NomeFonte'
      'FROM SumarioEstacoes'
      'Where UF='#39'GO'#39
      'ORDER BY NomeEstacao')
    Left = 312
    Top = 16
    object SumarioNro: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Nro'
      DisplayFormat = '00'
      Calculated = True
    end
    object SumarioIDEstacao: TAutoIncField
      FieldName = 'IDEstacao'
      ReadOnly = True
    end
    object SumarioCodigoEstacao: TWideStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CodigoEstacao'
      Size = 10
    end
    object SumarioUF: TWideStringField
      FieldName = 'UF'
      Size = 2
    end
    object SumarioNomeEstacao: TWideStringField
      DisplayLabel = 'Nome da Estacao'
      FieldName = 'NomeEstacao'
      Size = 50
    end
    object SumarioLatitude: TStringField
      FieldKind = fkCalculated
      FieldName = 'Latitude'
      Size = 10
      Calculated = True
    end
    object SumarioLongitude: TStringField
      FieldKind = fkCalculated
      FieldName = 'Longitude'
      Size = 10
      Calculated = True
    end
    object SumarioAltitude: TFloatField
      FieldName = 'Altitude'
      DisplayFormat = ',0.0'
    end
    object SumarioPeriodo: TStringField
      DisplayLabel = 'Per'#237'odo'
      FieldKind = fkCalculated
      FieldName = 'Periodo'
      Size = 25
      Calculated = True
    end
    object SumarioAnos: TIntegerField
      FieldName = 'Anos'
    end
    object SumarioMediaAnual: TFloatField
      DisplayLabel = 'M'#233'dia'
      FieldKind = fkCalculated
      FieldName = 'MediaAnual'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object SumarioArquivo: TWideStringField
      FieldName = 'Arquivo'
      Size = 50
    end
    object SumarioLatG: TWideStringField
      FieldName = 'LatG'
      Visible = False
      Size = 3
    end
    object SumarioLatM: TWideStringField
      FieldName = 'LatM'
      Visible = False
      Size = 3
    end
    object SumarioLatS: TWideStringField
      FieldName = 'LatS'
      Visible = False
      Size = 3
    end
    object SumarioLongG: TWideStringField
      FieldName = 'LongG'
      Visible = False
      Size = 3
    end
    object SumarioLongM: TWideStringField
      FieldName = 'LongM'
      Visible = False
      Size = 3
    end
    object SumarioLongS: TWideStringField
      FieldName = 'LongS'
      Visible = False
      Size = 3
    end
    object SumarioDiaIni: TDateTimeField
      FieldName = 'DiaIni'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object SumarioDiaFim: TDateTimeField
      FieldName = 'DiaFim'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object SumarioLimite: TFloatField
      FieldName = 'Limite'
      ReadOnly = True
    end
    object SumarioCodigoMunicipio: TStringField
      FieldName = 'CodigoMunicipio'
      Size = 7
    end
    object SumarioNomeMunicipio: TStringField
      FieldName = 'NomeMunicipio'
      Size = 100
    end
    object SumarioUFMun: TStringField
      FieldName = 'UFMun'
      Size = 2
    end
    object SumarioCodigoFonte: TIntegerField
      FieldName = 'CodigoFonte'
    end
    object SumarioNomeFonte: TStringField
      FieldName = 'NomeFonte'
      Size = 50
    end
  end
  object SumarioSrc: TDataSource
    DataSet = Sumario
    Left = 312
    Top = 72
  end
  object Detalhe: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = DetalheCalcFields
    DataSource = SumarioSrc
    Parameters = <
      item
        Name = 'Limite'
        Attributes = [paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 255
        Value = 60.0173483650637
      end
      item
        Name = 'IDEstacao'
        DataType = ftInteger
        Value = 611
      end>
    SQL.Strings = (
      'SELECT C.IDEstacao, Year(C.Data) as Ano, Count(*) as Obs,'
      'Sum(Case when C.Chuva>:Limite then 1 else 0 end) as Erros'
      'FROM ClimaDia AS C'
      'Where C.IDEstacao=:IDEstacao'
      'And C.Data is not null'
      'Group by C.IDEstacao, Year(C.Data)'
      'Order by  C.IDEstacao, Year(C.Data)')
    Left = 376
    Top = 16
    object DetalheAno: TSmallintField
      FieldName = 'Ano'
    end
    object DetalheCompletude: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Completude'
      DisplayFormat = '0.00%'
      Calculated = True
    end
    object DetalheAusenciaErros: TFloatField
      DisplayLabel = 'Aus'#234'ncia de Erros'
      FieldKind = fkCalculated
      FieldName = 'AusenciaErros'
      DisplayFormat = '0.00%'
      Calculated = True
    end
    object DetalheAprovado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Aprovado'
      DisplayValues = 'Sim;N'#227'o'
      Calculated = True
    end
    object DetalheObs: TIntegerField
      FieldName = 'Obs'
      Visible = False
    end
    object DetalheIDEstacao: TIntegerField
      FieldName = 'IDEstacao'
    end
    object DetalheErros: TIntegerField
      FieldName = 'Erros'
      ReadOnly = True
      DisplayFormat = '00'
    end
  end
  object DetalheSrc: TDataSource
    DataSet = Detalhe
    Left = 376
    Top = 72
  end
  object Analise: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = DetalheCalcFields
    DataSource = PeriodosSrc
    Parameters = <
      item
        Name = 'DiaIni'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'MesIni'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'DiaFim'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'MesFim'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'Select C.Data, Sum(C.Chuva) as Chuva,Year(C.Data) as Ano'
      'From ClimaDia C'
      
        'where C.Data between Str(:DiaIni)+'#39'/'#39'+Str(:MesIni)+'#39'/'#39'+Str(Year(' +
        'C.Data)) and Str(:DiaFim)+'#39'/'#39'+Str(:MesFim)+'#39'/'#39'+Str(Year(C.Data))'
      'And C.IDEstacao=2'
      'Group by C.Data'
      'Order by C.Data')
    Left = 456
    Top = 112
    object AnaliseData: TDateTimeField
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object AnaliseChuva: TFloatField
      FieldName = 'Chuva'
    end
    object AnaliseAno: TSmallintField
      FieldName = 'Ano'
      ReadOnly = True
    end
  end
  object Periodos: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filter = 'Mensal'
    OnCalcFields = PeriodosCalcFields
    Parameters = <>
    SQL.Strings = (
      
        'Select Distinct Year(C.Data) as Ordem, 01 as DiaIni, 01 as MesIn' +
        'i, 31 as DiaFim, 12 as MesFim, 1 as Freq'
      'FROM ClimaDia C'
      'Where C.IDEstacao=1234'
      'Order by Year(C.Data)')
    Left = 456
    Top = 16
    object PeriodosOrdem: TSmallintField
      FieldName = 'Ordem'
    end
    object PeriodosDiaIni: TIntegerField
      FieldName = 'DiaIni'
    end
    object PeriodosMesIni: TIntegerField
      FieldName = 'MesIni'
    end
    object PeriodosDiaFim: TIntegerField
      FieldName = 'DiaFim'
    end
    object PeriodosMesFim: TIntegerField
      FieldName = 'MesFim'
    end
    object PeriodosRotulo: TStringField
      FieldKind = fkCalculated
      FieldName = 'Rotulo'
      Calculated = True
    end
    object PeriodosFreq: TIntegerField
      FieldName = 'Freq'
    end
  end
  object PeriodosSrc: TDataSource
    DataSet = Periodos
    Left = 456
    Top = 64
  end
  object Separatrizes: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = PeriodosSrc
    Parameters = <
      item
        Name = 'DiaIni'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DiaFim'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'MesIni'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select Year(C.Data) as Periodo, Sum(C.Chuva) as Chuva'
      'From ClimaDia C'
      
        'where (Day(C.Data) between :DiaIni and :DiaFim and Month(C.Data)' +
        '=:MesIni)'
      'And C.IDEstacao=123'
      'And C.Chuva>0'
      'Group by Year(C.Data)'
      'Order by Sum(C.Chuva)')
    Left = 456
    Top = 160
    object SeparatrizesPeriodo: TSmallintField
      FieldName = 'Periodo'
    end
    object SeparatrizesChuva: TFloatField
      FieldName = 'Chuva'
    end
  end
  object Fontes: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select CodigoFonte, NomeFonte,Sigla,Endereco,Cidade,UF,CEP,Conta' +
        'to,'
      
        'Fone,email,Url,Tipo,DtCadastro,UsuarioCadastro,DtEdicao,UsuarioE' +
        'dicao,'
      'Sigla+'#39'-'#39'+NomeFonte SiglaENome'
      'from Fontes'
      'Order by NomeFonte')
    Left = 112
    Top = 16
    object FontesCodigoFonte: TAutoIncField
      FieldName = 'CodigoFonte'
      ReadOnly = True
    end
    object FontesNomeFonte: TStringField
      FieldName = 'NomeFonte'
      Size = 50
    end
    object FontesSigla: TStringField
      FieldName = 'Sigla'
      Size = 10
    end
    object FontesEndereco: TStringField
      FieldName = 'Endereco'
      Size = 200
    end
    object FontesCidade: TStringField
      FieldName = 'Cidade'
    end
    object FontesUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object FontesCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object FontesContato: TStringField
      FieldName = 'Contato'
      Size = 100
    end
    object FontesFone: TStringField
      FieldName = 'Fone'
      Size = 50
    end
    object Fontesemail: TStringField
      FieldName = 'email'
      Size = 50
    end
    object FontesUrl: TStringField
      FieldName = 'Url'
      Size = 50
    end
    object FontesTipo: TStringField
      FieldName = 'Tipo'
    end
    object FontesDtCadastro: TDateTimeField
      FieldName = 'DtCadastro'
      DisplayFormat = 'dd/mm/yy'
    end
    object FontesUsuarioCadastro: TStringField
      FieldName = 'UsuarioCadastro'
      Size = 18
    end
    object FontesDtEdicao: TDateTimeField
      FieldName = 'DtEdicao'
      DisplayFormat = 'dd/mm/yy'
    end
    object FontesUsuarioEdicao: TStringField
      FieldName = 'UsuarioEdicao'
      Size = 18
    end
    object FontesSiglaENome: TStringField
      FieldName = 'SiglaENome'
      ReadOnly = True
      Size = 61
    end
  end
  object FontesSrc: TDataSource
    DataSet = Fontes
    Left = 112
    Top = 72
  end
  object Ano: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = AnoCalcFields
    DataSource = DetalheSrc
    Parameters = <
      item
        Name = 'Ano'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 10
        Value = 1980
      end
      item
        Name = 'IDEstacao'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 611
      end>
    SQL.Strings = (
      'Select Month(Data) Mes,'
      'Sum(Case when Day(Data)=01 then Chuva end) '#39'01'#39','
      'Sum(Case when Day(Data)=02 then Chuva end) '#39'02'#39','
      'Sum(Case when Day(Data)=03 then Chuva end) '#39'03'#39','
      'Sum(Case when Day(Data)=04 then Chuva end) '#39'04'#39','
      'Sum(Case when Day(Data)=05 then Chuva end) '#39'05'#39','
      'Sum(Case when Day(Data)=06 then Chuva end) '#39'06'#39','
      'Sum(Case when Day(Data)=07 then Chuva end) '#39'07'#39','
      'Sum(Case when Day(Data)=08 then Chuva end) '#39'08'#39','
      'Sum(Case when Day(Data)=09 then Chuva end) '#39'09'#39','
      'Sum(Case when Day(Data)=10 then Chuva end) '#39'10'#39','
      'Sum(Case when Day(Data)=11 then Chuva end) '#39'11'#39','
      'Sum(Case when Day(Data)=12 then Chuva end) '#39'12'#39','
      'Sum(Case when Day(Data)=13 then Chuva end) '#39'13'#39','
      'Sum(Case when Day(Data)=14 then Chuva end) '#39'14'#39','
      'Sum(Case when Day(Data)=15 then Chuva end) '#39'15'#39','
      'Sum(Case when Day(Data)=16 then Chuva end) '#39'16'#39','
      'Sum(Case when Day(Data)=17 then Chuva end) '#39'17'#39','
      'Sum(Case when Day(Data)=18 then Chuva end) '#39'18'#39','
      'Sum(Case when Day(Data)=19 then Chuva end) '#39'19'#39','
      'Sum(Case when Day(Data)=20 then Chuva end) '#39'20'#39','
      'Sum(Case when Day(Data)=21 then Chuva end) '#39'21'#39','
      'Sum(Case when Day(Data)=22 then Chuva end) '#39'22'#39','
      'Sum(Case when Day(Data)=23 then Chuva end) '#39'23'#39','
      'Sum(Case when Day(Data)=24 then Chuva end) '#39'24'#39','
      'Sum(Case when Day(Data)=25 then Chuva end) '#39'25'#39','
      'Sum(Case when Day(Data)=26 then Chuva end) '#39'26'#39','
      'Sum(Case when Day(Data)=27 then Chuva end) '#39'27'#39','
      'Sum(Case when Day(Data)=28 then Chuva end) '#39'28'#39','
      'Sum(Case when Day(Data)=29 then Chuva end) '#39'29'#39','
      'Sum(Case when Day(Data)=30 then Chuva end) '#39'30'#39','
      'Sum(Case when Day(Data)=31 then Chuva end) '#39'31'#39','
      'Sum(Chuva) '#39'Total'#39','
      'Avg(Chuva) '#39'M'#233'dia'#39
      'From Climadia'
      'Where Year(Data)=:Ano'
      'And IDEstacao=:IDEstacao'
      'Group by MONTH(Data)'
      'order by 1')
    Left = 376
    Top = 128
    object AnoMes: TIntegerField
      DisplayLabel = 'M'#234's'
      FieldName = 'Mes'
      ReadOnly = True
    end
    object AnoNomeMes: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeMes'
      Size = 3
      Calculated = True
    end
    object AnoDSDesigner01: TFloatField
      FieldName = '01'
      ReadOnly = True
    end
    object AnoDSDesigner02: TFloatField
      FieldName = '02'
      ReadOnly = True
    end
    object AnoDSDesigner03: TFloatField
      FieldName = '03'
      ReadOnly = True
    end
    object AnoDSDesigner04: TFloatField
      FieldName = '04'
      ReadOnly = True
    end
    object AnoDSDesigner05: TFloatField
      FieldName = '05'
      ReadOnly = True
    end
    object AnoDSDesigner06: TFloatField
      FieldName = '06'
      ReadOnly = True
    end
    object AnoDSDesigner07: TFloatField
      FieldName = '07'
      ReadOnly = True
    end
    object AnoDSDesigner08: TFloatField
      FieldName = '08'
      ReadOnly = True
    end
    object AnoDSDesigner09: TFloatField
      FieldName = '09'
      ReadOnly = True
    end
    object AnoDSDesigner10: TFloatField
      FieldName = '10'
      ReadOnly = True
    end
    object AnoDSDesigner11: TFloatField
      FieldName = '11'
      ReadOnly = True
    end
    object AnoDSDesigner12: TFloatField
      FieldName = '12'
      ReadOnly = True
    end
    object AnoDSDesigner13: TFloatField
      FieldName = '13'
      ReadOnly = True
    end
    object AnoDSDesigner14: TFloatField
      FieldName = '14'
      ReadOnly = True
    end
    object AnoDSDesigner15: TFloatField
      FieldName = '15'
      ReadOnly = True
    end
    object AnoDSDesigner16: TFloatField
      FieldName = '16'
      ReadOnly = True
    end
    object AnoDSDesigner17: TFloatField
      FieldName = '17'
      ReadOnly = True
    end
    object AnoDSDesigner18: TFloatField
      FieldName = '18'
      ReadOnly = True
    end
    object AnoDSDesigner19: TFloatField
      FieldName = '19'
      ReadOnly = True
    end
    object AnoDSDesigner20: TFloatField
      FieldName = '20'
      ReadOnly = True
    end
    object AnoDSDesigner21: TFloatField
      FieldName = '21'
      ReadOnly = True
    end
    object AnoDSDesigner22: TFloatField
      FieldName = '22'
      ReadOnly = True
    end
    object AnoDSDesigner23: TFloatField
      FieldName = '23'
      ReadOnly = True
    end
    object AnoDSDesigner24: TFloatField
      FieldName = '24'
      ReadOnly = True
    end
    object AnoDSDesigner25: TFloatField
      FieldName = '25'
      ReadOnly = True
    end
    object AnoDSDesigner26: TFloatField
      FieldName = '26'
      ReadOnly = True
    end
    object AnoDSDesigner27: TFloatField
      FieldName = '27'
      ReadOnly = True
    end
    object AnoDSDesigner28: TFloatField
      FieldName = '28'
      ReadOnly = True
    end
    object AnoDSDesigner29: TFloatField
      FieldName = '29'
      ReadOnly = True
    end
    object AnoDSDesigner30: TFloatField
      FieldName = '30'
      ReadOnly = True
    end
    object AnoDSDesigner31: TFloatField
      FieldName = '31'
      ReadOnly = True
    end
    object AnoTotal: TFloatField
      FieldName = 'Total'
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object AnoMdia: TFloatField
      FieldName = 'M'#233'dia'
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
  end
  object AnoSrc: TDataSource
    DataSet = Ano
    Left = 376
    Top = 176
  end
  object Municipios: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      
        'Select CodigoMunicipio, UF, NomeMunicipio+'#39'-'#39'+UF as NomeMunicipi' +
        'o'
      'from MunicipiosIBGE'
      'order by NomeMunicipio+'#39'-'#39'+UF')
    Left = 192
    Top = 16
    object MunicipiosCodigoMunicipio: TStringField
      FieldName = 'CodigoMunicipio'
      Size = 7
    end
    object MunicipiosUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object MunicipiosNomeMunicipio: TStringField
      DisplayLabel = 'Nome Munic'#237'pio'
      FieldName = 'NomeMunicipio'
      ReadOnly = True
      Size = 103
    end
  end
  object MunicipiosSrc: TDataSource
    DataSet = Municipios
    Left = 192
    Top = 72
  end
end
