object Form1: TForm1
  Left = 264
  Top = 135
  Width = 569
  Height = 382
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 105
    Height = 13
    Caption = 'C:\...\Cear'#225' TXT-PLU'
  end
  object SpeedButton1: TSpeedButton
    Left = 464
    Top = 288
    Width = 89
    Height = 25
    Caption = 'Converter'
    OnClick = SpeedButton1Click
  end
  object DriveComboBox1: TDriveComboBox
    Left = 8
    Top = 8
    Width = 145
    Height = 19
    DirList = DirectoryListBox1
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
  object FileListBox1: TFileListBox
    Left = 160
    Top = 48
    Width = 145
    Height = 233
    ItemHeight = 13
    Mask = '*.txt'
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 320
    Top = 48
    Width = 233
    Height = 233
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 320
    Width = 545
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 4
  end
  object T: TADOTable
    ConnectionString = 
      'Driver={Microsoft Text Driver (*.txt; *.csv)};Dbq=C:\Sistemas De' +
      'lphi\Agroconsult\Conversores PLU\Cear'#225' TXT-PLU\2010;Extensions=a' +
      'sc,csv,tab,txt;Persist Security Info=False;'
    CursorType = ctStatic
    TableName = '1.csv'
    Left = 232
    Top = 32
    object TMunicipios: TStringField
      FieldName = 'Municipios'
      Size = 255
    end
    object TPostos: TStringField
      FieldName = 'Postos'
      Size = 255
    end
    object TLatitude: TIntegerField
      FieldName = 'Latitude'
    end
    object TLongitude: TIntegerField
      FieldName = 'Longitude'
    end
    object TAnos: TIntegerField
      FieldName = 'Anos'
    end
    object TMeses: TIntegerField
      FieldName = 'Meses'
    end
    object TTotal: TFloatField
      FieldName = 'Total'
    end
    object TDia1: TFloatField
      FieldName = 'Dia1'
    end
    object TDia2: TFloatField
      FieldName = 'Dia2'
    end
    object TDia3: TFloatField
      FieldName = 'Dia3'
    end
    object TDia4: TFloatField
      FieldName = 'Dia4'
    end
    object TDia5: TFloatField
      FieldName = 'Dia5'
    end
    object TDia6: TFloatField
      FieldName = 'Dia6'
    end
    object TDia7: TFloatField
      FieldName = 'Dia7'
    end
    object TDia8: TFloatField
      FieldName = 'Dia8'
    end
    object TDia9: TFloatField
      FieldName = 'Dia9'
    end
    object TDia10: TFloatField
      FieldName = 'Dia10'
    end
    object TDia11: TFloatField
      FieldName = 'Dia11'
    end
    object TDia12: TFloatField
      FieldName = 'Dia12'
    end
    object TDia13: TFloatField
      FieldName = 'Dia13'
    end
    object TDia14: TFloatField
      FieldName = 'Dia14'
    end
    object TDia15: TFloatField
      FieldName = 'Dia15'
    end
    object TDia16: TFloatField
      FieldName = 'Dia16'
    end
    object TDia17: TFloatField
      FieldName = 'Dia17'
    end
    object TDia18: TFloatField
      FieldName = 'Dia18'
    end
    object TDia19: TFloatField
      FieldName = 'Dia19'
    end
    object TDia20: TFloatField
      FieldName = 'Dia20'
    end
    object TDia21: TFloatField
      FieldName = 'Dia21'
    end
    object TDia22: TFloatField
      FieldName = 'Dia22'
    end
    object TDia23: TFloatField
      FieldName = 'Dia23'
    end
    object TDia24: TFloatField
      FieldName = 'Dia24'
    end
    object TDia25: TFloatField
      FieldName = 'Dia25'
    end
    object TDia26: TFloatField
      FieldName = 'Dia26'
    end
    object TDia27: TFloatField
      FieldName = 'Dia27'
    end
    object TDia28: TFloatField
      FieldName = 'Dia28'
    end
    object TDia29: TFloatField
      FieldName = 'Dia29'
    end
    object TDia30: TFloatField
      FieldName = 'Dia30'
    end
    object TDia31: TFloatField
      FieldName = 'Dia31'
    end
  end
end
