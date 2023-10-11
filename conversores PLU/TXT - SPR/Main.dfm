object Form1: TForm1
  Left = 216
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Conversor TXT SPR'
  ClientHeight = 344
  ClientWidth = 555
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
    Width = 132
    Height = 13
    Caption = 'C:\...\Conversor TXT - SPR'
  end
  object SpeedButton1: TSpeedButton
    Left = 456
    Top = 288
    Width = 89
    Height = 25
    Caption = 'Converter!'
    OnClick = SpeedButton1Click
  end
  object Label2: TLabel
    Left = 192
    Top = 16
    Width = 22
    Height = 13
    Caption = 'DAS'
  end
  object FileListBox1: TFileListBox
    Left = 160
    Top = 48
    Width = 385
    Height = 233
    ItemHeight = 13
    Mask = '*.txt'
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
    Width = 537
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 3
  end
  object DasEdit: TEdit
    Left = 216
    Top = 12
    Width = 33
    Height = 21
    TabOrder = 4
    Text = '75'
  end
end
