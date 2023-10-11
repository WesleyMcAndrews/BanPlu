object FormMain: TFormMain
  Left = 310
  Top = 186
  BorderStyle = bsDialog
  Caption = 'Conversor XLS PLU Par'#225
  ClientHeight = 346
  ClientWidth = 313
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
    Width = 98
    Height = 13
    Caption = 'C:\...\Par'#225' XLS-PLU'
  end
  object SpeedButton1: TSpeedButton
    Left = 192
    Top = 288
    Width = 89
    Height = 25
    Caption = 'Converter!'
    OnClick = SpeedButton1Click
  end
  object FileListBox1: TFileListBox
    Left = 160
    Top = 48
    Width = 145
    Height = 233
    ItemHeight = 13
    Mask = '*.xls'
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
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 96
    Top = 168
  end
end
