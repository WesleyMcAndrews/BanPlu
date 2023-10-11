object FormMain: TFormMain
  Left = 311
  Top = 187
  BorderStyle = bsDialog
  Caption = 'Conversor XLS PLU Caesb-DF'
  ClientHeight = 426
  ClientWidth = 385
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
    Width = 174
    Height = 16
    Caption = '...\Conversor XLS PLU Caesb'
  end
  object SpeedButton1: TSpeedButton
    Left = 236
    Top = 354
    Width = 110
    Height = 31
    Caption = 'Converter PLU! '
    OnClick = SpeedButton1Click
  end
  object FileListBox1: TFileListBox
    Left = 197
    Top = 59
    Width = 178
    Height = 287
    ItemHeight = 16
    Mask = '*.xls'
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
    Width = 365
    Height = 21
    Min = 0
    Max = 100
    TabOrder = 3
  end
  object Button1: TButton
    Left = 40
    Top = 360
    Width = 107
    Height = 25
    Caption = 'Converter CSV!'
    TabOrder = 4
    OnClick = Button1Click
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 96
    Top = 168
  end
end
