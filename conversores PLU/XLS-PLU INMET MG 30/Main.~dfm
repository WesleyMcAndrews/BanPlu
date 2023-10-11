object MainForm: TMainForm
  Left = 332
  Top = 158
  Width = 328
  Height = 380
  Caption = 'Conversor XLS PLU INMET MG'
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
    Width = 145
    Height = 13
    Caption = 'C:\...\INMET MG 30 XLS-PLU'
  end
  object Button1: TButton
    Left = 8
    Top = 287
    Width = 75
    Height = 25
    Caption = 'Converter!'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 320
    Width = 297
    Height = 17
    Min = 0
    Max = 100
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
  object DirectoryListBox1: TDirectoryListBox
    Left = 8
    Top = 48
    Width = 145
    Height = 233
    DirLabel = Label1
    FileList = FileListBox1
    ItemHeight = 16
    TabOrder = 3
  end
  object FileListBox1: TFileListBox
    Left = 160
    Top = 48
    Width = 145
    Height = 233
    ItemHeight = 13
    Mask = '*.xls'
    TabOrder = 4
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 272
    Top = 80
  end
end
