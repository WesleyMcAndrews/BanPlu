object Form1: TForm1
  Left = 551
  Top = 203
  BorderStyle = bsDialog
  Caption = 'Conversor WTD PLU'
  ClientHeight = 423
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 10
    Top = 39
    Width = 146
    Height = 16
    Caption = 'C:\...\WTD - PLU DSSAT'
  end
  object SpeedButton1: TSpeedButton
    Left = 561
    Top = 354
    Width = 110
    Height = 31
    Caption = 'Converter!'
    OnClick = SpeedButton1Click
  end
  object FileListBox1: TFileListBox
    Left = 197
    Top = 59
    Width = 474
    Height = 287
    ItemHeight = 16
    Mask = '*.WTD'
    TabOrder = 0
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 10
    Top = 59
    Width = 178
    Height = 287
    DirLabel = Label1
    FileList = FileListBox1
    ItemHeight = 16
    TabOrder = 1
  end
  object DriveComboBox1: TDriveComboBox
    Left = 10
    Top = 10
    Width = 178
    Height = 22
    DirList = DirectoryListBox1
    TabOrder = 2
  end
  object ProgressBar1: TProgressBar
    Left = 10
    Top = 394
    Width = 661
    Height = 21
    Min = 0
    Max = 100
    TabOrder = 3
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Estacoes.mdb;Persis' +
      't Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 288
    Top = 152
  end
  object Estacoes: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from estacoes'
      'order by COD_DSSAT')
    Left = 352
    Top = 152
    object EstacoesCDIGO: TWideStringField
      FieldName = 'C'#211'DIGO'
      Size = 255
    end
    object EstacoesCOD_DSSAT: TWideStringField
      FieldName = 'COD_DSSAT'
      Size = 255
    end
    object EstacoesNOME: TWideStringField
      FieldName = 'NOME'
      Size = 255
    end
    object EstacoesUF_: TWideStringField
      FieldName = 'UF_'
      Size = 255
    end
    object EstacoesLAT_G: TFloatField
      FieldName = 'LAT_G'
    end
    object EstacoesLAT_M: TFloatField
      FieldName = 'LAT_M'
    end
    object EstacoesLAT_S: TFloatField
      FieldName = 'LAT_S'
    end
    object EstacoesLONG_G: TFloatField
      FieldName = 'LONG_G'
    end
    object EstacoesLONG_M: TFloatField
      FieldName = 'LONG_M'
    end
    object EstacoesLONG_S: TFloatField
      FieldName = 'LONG_S'
    end
    object EstacoesALT_m: TFloatField
      FieldName = 'ALT_m'
    end
  end
end
