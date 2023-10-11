object MainForm: TMainForm
  Left = 332
  Top = 158
  Width = 394
  Height = 247
  Caption = 'Conversor XLS PLU Paran'#225
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 59
    Height = 13
    Caption = 'Arquivo XLS'
  end
  object Button1: TButton
    Left = 280
    Top = 31
    Width = 75
    Height = 25
    Caption = 'Converter!'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 32
    Width = 257
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object ProgressBar1: TProgressBar
    Left = 24
    Top = 136
    Width = 337
    Height = 17
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
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Sistemas Delphi\' +
      'Agroconsult\Arquivos PLU\chuva_PR\estacoes.mdb;Persist Security ' +
      'Info=False'
    CursorType = ctStatic
    TableName = 'Estacoes'
    Left = 168
    Top = 72
    object EstacoesCDIGO: TFloatField
      FieldName = 'C'#211'DIGO'
    end
    object EstacoesMUNICPIO: TWideStringField
      FieldName = 'MUNIC'#205'PIO'
      Size = 255
    end
    object EstacoesLATITUDE: TFloatField
      FieldName = 'LATITUDE'
    end
    object EstacoesLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
    end
    object EstacoesALTITUDE: TFloatField
      FieldName = 'ALTITUDE'
    end
    object EstacoesLatG: TSmallintField
      FieldName = 'LatG'
      DisplayFormat = '00'
    end
    object EstacoesLatM: TSmallintField
      FieldName = 'LatM'
      DisplayFormat = '00'
    end
    object EstacoesLatS: TSmallintField
      FieldName = 'LatS'
      DisplayFormat = '00'
    end
    object EstacoesLonG: TSmallintField
      FieldName = 'LonG'
      DisplayFormat = '00'
    end
    object EstacoesLonM: TSmallintField
      FieldName = 'LonM'
      DisplayFormat = '00'
    end
    object EstacoesLonS: TSmallintField
      FieldName = 'LonS'
      DisplayFormat = '00'
    end
  end
end
