object Form1: TForm1
  Left = 320
  Top = 221
  Width = 800
  Height = 500
  Caption = 'Conversor TXT - PLU     Pernambuco'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 48
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Converter!'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 144
    Top = 72
    Width = 273
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 1
  end
  object Button2: TButton
    Left = 432
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Exportar!'
    TabOrder = 2
    OnClick = Button2Click
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Sistemas Delphi\' +
      'Agroconsult\Arquivos PLU\Dados_Pluvometricos_PE\PE.mdb;Persist S' +
      'ecurity Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 16
    Top = 112
  end
  object Estacoes: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    Filter = 'CodigoEstacao>'#39'489'#39
    Filtered = True
    TableName = 'Estacoes'
    Left = 96
    Top = 120
    object EstacoesCodigoEstacao: TWideStringField
      FieldName = 'CodigoEstacao'
      Size = 10
    end
    object EstacoesUF: TWideStringField
      FieldName = 'UF'
      Size = 2
    end
    object EstacoesNomeEstacao: TWideStringField
      FieldName = 'NomeEstacao'
      Size = 50
    end
    object EstacoesLatG: TWideStringField
      FieldName = 'LatG'
      Size = 3
    end
    object EstacoesLatM: TWideStringField
      FieldName = 'LatM'
      Size = 3
    end
    object EstacoesLatS: TWideStringField
      FieldName = 'LatS'
      Size = 3
    end
    object EstacoesLongG: TWideStringField
      FieldName = 'LongG'
      Size = 3
    end
    object EstacoesLongM: TWideStringField
      FieldName = 'LongM'
      Size = 3
    end
    object EstacoesLongS: TWideStringField
      FieldName = 'LongS'
      Size = 3
    end
    object EstacoesAltitude: TFloatField
      FieldName = 'Altitude'
    end
    object EstacoesArquivo: TWideStringField
      FieldName = 'Arquivo'
      Size = 50
    end
    object EstacoesDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 160
    Top = 168
  end
  object Chuva: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = DetalheSrc
    Parameters = <
      item
        Name = 'CodigoEstacao'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'Ano'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'Select * from Chuva'
      'Where CodigoEstacao=:CodigoEstacao'
      'And Year(Data)=:Ano'
      'Order by Data')
    Left = 96
    Top = 280
    object ChuvaCodigoEstacao: TWideStringField
      FieldName = 'CodigoEstacao'
      Size = 50
    end
    object ChuvaData: TDateTimeField
      FieldName = 'Data'
    end
    object ChuvaChuva: TFloatField
      FieldName = 'Chuva'
    end
  end
  object EstacoesSrc: TDataSource
    DataSet = Estacoes
    Left = 96
    Top = 160
  end
  object Detalhe: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = EstacoesSrc
    Parameters = <
      item
        Name = 'CodigoEstacao'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'Select Distinct CodigoEstacao, Year(Data) as Ano'
      'from Chuva'
      'Where CodigoEstacao=:CodigoEstacao'
      'Order by Year(Data)')
    Left = 96
    Top = 200
    object DetalheCodigoEstacao: TWideStringField
      FieldName = 'CodigoEstacao'
      Size = 50
    end
    object DetalheAno: TSmallintField
      FieldName = 'Ano'
      ReadOnly = True
    end
  end
  object DetalheSrc: TDataSource
    DataSet = Detalhe
    Left = 96
    Top = 240
  end
end
