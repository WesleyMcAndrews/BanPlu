object FormDetalheEstacao: TFormDetalheEstacao
  Left = 369
  Top = 190
  BorderStyle = bsDialog
  Caption = 'Detalhe da Esta'#231#227'o Pluviom'#233'trica'
  ClientHeight = 491
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 375
    Height = 81
    Align = alTop
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 336
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Voltar...'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object DBText1: TDBText
      Left = 49
      Top = 4
      Width = 216
      Height = 13
      DataField = 'NomeEstacao'
      DataSource = DM.SumarioSrc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 4
      Top = 4
      Width = 42
      Height = 13
      Caption = 'Esta'#231#227'o:'
    end
    object Label2: TLabel
      Left = 4
      Top = 20
      Width = 21
      Height = 13
      Caption = 'Lat.:'
    end
    object DBText2: TDBText
      Left = 25
      Top = 20
      Width = 3
      Height = 13
      AutoSize = True
      DataField = 'Latitude'
      DataSource = DM.SumarioSrc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 116
      Top = 20
      Width = 30
      Height = 13
      Caption = 'Long.:'
    end
    object DBText3: TDBText
      Left = 146
      Top = 20
      Width = 3
      Height = 13
      AutoSize = True
      DataField = 'Longitude'
      DataSource = DM.SumarioSrc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 276
      Top = 4
      Width = 17
      Height = 13
      Caption = 'UF:'
    end
    object DBText4: TDBText
      Left = 297
      Top = 4
      Width = 16
      Height = 13
      AutoSize = True
      DataField = 'UF'
      DataSource = DM.SumarioSrc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 236
      Top = 20
      Width = 18
      Height = 13
      Caption = 'Alt.:'
    end
    object DBText5: TDBText
      Left = 257
      Top = 20
      Width = 27
      Height = 13
      AutoSize = True
      DataField = 'Altitude'
      DataSource = DM.SumarioSrc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton2: TSpeedButton
      Left = 120
      Top = 40
      Width = 113
      Height = 25
      Caption = 'Detalhar Ano...'
      OnClick = SpeedButton2Click
    end
    object DBNavigator1: TDBNavigator
      Left = 5
      Top = 40
      Width = 108
      Height = 25
      DataSource = DM.SumarioSrc
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 81
    Width = 375
    Height = 410
    Align = alClient
    DataSource = DM.DetalheSrc
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Ano'
        Title.Alignment = taCenter
        Width = 78
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Completude'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AusenciaErros'
        Title.Alignment = taCenter
        Title.Caption = 'Ausencia de Erros'
        Width = 107
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Aprovado'
        Title.Alignment = taCenter
        Width = 60
        Visible = True
      end>
  end
end
