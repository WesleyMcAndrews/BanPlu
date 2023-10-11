object MainForm: TMainForm
  Left = 332
  Top = 158
  Width = 474
  Height = 256
  Caption = 'Conversor XLS PLU Roraima'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 20
    Top = 20
    Width = 73
    Height = 16
    Caption = 'Arquivo XLS'
  end
  object Button1: TButton
    Left = 345
    Top = 38
    Width = 92
    Height = 31
    Caption = 'Converter!'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 20
    Top = 39
    Width = 316
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object ProgressBar1: TProgressBar
    Left = 30
    Top = 167
    Width = 414
    Height = 21
    Min = 0
    Max = 100
    TabOrder = 2
  end
  object OpenDialog1: TOpenDialog
    Left = 80
    Top = 80
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 272
    Top = 80
  end
  object Estacoes: TADOTable
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Estacoes.mdb;Persis' +
      't Security Info=False'
    CursorType = ctStatic
    TableName = 'Estacoes'
    Left = 168
    Top = 72
    object EstacoesCodigo: TSmallintField
      FieldName = 'Codigo'
    end
    object Estacoescodigoest: TWideStringField
      FieldName = 'codigoest'
      Size = 255
    end
    object EstacoesNomeEstacao: TWideStringField
      FieldName = 'NomeEstacao'
      Size = 255
    end
    object EstacoesMunicipioCodigo: TWideStringField
      FieldName = 'MunicipioCodigo'
      Size = 255
    end
    object EstacoesMunicpio: TWideStringField
      FieldName = 'Munic'#237'pio'
      Size = 255
    end
    object EstacoesResponsvel: TWideStringField
      FieldName = 'Respons'#225'vel'
      Size = 255
    end
    object EstacoesOperadora: TWideStringField
      FieldName = 'Operadora'
      Size = 255
    end
    object EstacoesLatG: TSmallintField
      FieldName = 'LatG'
    end
    object EstacoesLatM: TSmallintField
      FieldName = 'LatM'
    end
    object EstacoesLatS: TSmallintField
      FieldName = 'LatS'
    end
    object EstacoesLongG: TSmallintField
      FieldName = 'LongG'
    end
    object EstacoesLongM: TSmallintField
      FieldName = 'LongM'
    end
    object EstacoesLongS: TSmallintField
      FieldName = 'LongS'
    end
  end
end
