object Form1: TForm1
  Left = 194
  Top = 114
  Width = 322
  Height = 377
  Caption = 'Carregar Hist'#243'rico CIIAGRO'
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
    Left = 8
    Top = 32
    Width = 91
    Height = 13
    Caption = 'C:\...\DF DBF PLU'
  end
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 288
    Width = 113
    Height = 25
    Caption = 'Converter p/ PLU'
    OnClick = SpeedButton1Click
  end
  object FileListBox1: TFileListBox
    Left = 160
    Top = 48
    Width = 145
    Height = 233
    ItemHeight = 13
    Mask = '*.DBF'
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
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 320
    Width = 297
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 3
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Sistemas Delphi\' +
      'DataPlanta\ChupaDados\Ciiagro\Ciiagro.mdb;Persist Security Info=' +
      'False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 184
    Top = 24
  end
  object Estacoes: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Estacoes')
    Left = 184
    Top = 64
    object EstacoesLatMin: TFloatField
      FieldName = 'LatMin'
    end
    object EstacoesLatDec: TFloatField
      FieldName = 'LatDec'
    end
    object EstacoesLatG: TWideStringField
      FieldName = 'LatG'
      Size = 255
    end
    object EstacoesLatM: TWideStringField
      FieldName = 'LatM'
      Size = 255
    end
    object EstacoesLatS: TWideStringField
      FieldName = 'LatS'
      Size = 255
    end
    object EstacoesLongMin: TFloatField
      FieldName = 'LongMin'
    end
    object EstacoesLongDec: TFloatField
      FieldName = 'LongDec'
    end
    object EstacoesLongG: TWideStringField
      FieldName = 'LongG'
      Size = 255
    end
    object EstacoesLongM: TWideStringField
      FieldName = 'LongM'
      Size = 255
    end
    object EstacoesLongS: TWideStringField
      FieldName = 'LongS'
      Size = 255
    end
    object EstacoesLocal: TWideStringField
      FieldName = 'Local'
      Size = 255
    end
  end
  object T: TQuery
    SQL.Strings = (
      'Select Distinct * from'
      'PLAN_LAT.DBF'
      'Order by A_DATT')
    Left = 224
    Top = 104
    object TA_CODG: TStringField
      FieldName = 'A_CODG'
      Size = 5
    end
    object TA_TMAX: TFloatField
      FieldName = 'A_TMAX'
    end
    object TA_TMIN: TFloatField
      FieldName = 'A_TMIN'
    end
    object TA_PREC: TFloatField
      FieldName = 'A_PREC'
    end
    object TA_DATT: TDateField
      FieldName = 'A_DATT'
    end
    object TA_TMSC: TFloatField
      FieldName = 'A_TMSC'
    end
    object TA_TMUD: TFloatField
      FieldName = 'A_TMUD'
    end
  end
end
