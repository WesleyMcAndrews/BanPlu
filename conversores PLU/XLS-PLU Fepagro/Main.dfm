object Form1: TForm1
  Left = 368
  Top = 182
  Width = 696
  Height = 480
  Caption = 'Conversor XLS - PLU Fepagro'
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
end
