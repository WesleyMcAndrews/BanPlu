object Form1: TForm1
  Left = 368
  Top = 182
  Width = 696
  Height = 480
  Caption = 'Conversor XLS - PLU Para'#237'ba'
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
end
