object FormCadastroFontes: TFormCadastroFontes
  Left = 257
  Top = 195
  BorderStyle = bsDialog
  Caption = 'Cadastro de Fontes'
  ClientHeight = 378
  ClientWidth = 706
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
  object Label2: TLabel
    Left = 248
    Top = 48
    Width = 73
    Height = 13
    Caption = 'Nome da Fonte'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 560
    Top = 48
    Width = 23
    Height = 13
    Caption = 'Sigla'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 248
    Top = 88
    Width = 46
    Height = 13
    Caption = 'Endere'#231'o'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 248
    Top = 128
    Width = 33
    Height = 13
    Caption = 'Cidade'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 440
    Top = 128
    Width = 14
    Height = 13
    Caption = 'UF'
  end
  object Label7: TLabel
    Left = 496
    Top = 128
    Width = 21
    Height = 13
    Caption = 'CEP'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 248
    Top = 168
    Width = 83
    Height = 13
    Caption = 'Nome do Contato'
    FocusControl = DBEdit8
  end
  object Label9: TLabel
    Left = 248
    Top = 208
    Width = 29
    Height = 13
    Caption = 'Fones'
    FocusControl = DBEdit9
  end
  object Label10: TLabel
    Left = 480
    Top = 208
    Width = 28
    Height = 13
    Caption = 'E-mail'
    FocusControl = DBEdit10
  end
  object Label11: TLabel
    Left = 248
    Top = 248
    Width = 69
    Height = 13
    Caption = 'Endere'#231'o web'
    FocusControl = DBEdit11
  end
  object Label12: TLabel
    Left = 248
    Top = 288
    Width = 66
    Height = 13
    Caption = 'Tipo de Fonte'
  end
  object Label13: TLabel
    Left = 248
    Top = 328
    Width = 59
    Height = 13
    Caption = 'Dt. Cadastro'
    FocusControl = DBEdit13
  end
  object Label14: TLabel
    Left = 336
    Top = 328
    Width = 81
    Height = 13
    Caption = 'Usu'#225'rio Cadastro'
    FocusControl = DBEdit14
  end
  object Label15: TLabel
    Left = 472
    Top = 328
    Width = 50
    Height = 13
    Caption = 'Dt. Edi'#231#227'o'
    FocusControl = DBEdit15
  end
  object Label16: TLabel
    Left = 560
    Top = 328
    Width = 72
    Height = 13
    Caption = 'Usu'#225'rio Edicao'
    FocusControl = DBEdit16
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 706
    Height = 41
    Align = alTop
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 8
      Width = 240
      Height = 25
      DataSource = FontesSrc
      TabOrder = 0
      BeforeAction = DBNavigator1BeforeAction
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 41
    Width = 233
    Height = 337
    Align = alLeft
    Caption = 'Fontes de Dados'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 229
      Height = 320
      Align = alClient
      DataSource = FontesSrc
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NomeFonte'
          Title.Alignment = taCenter
          Title.Caption = 'Nome da Fonte'
          Width = 190
          Visible = True
        end>
    end
  end
  object DBEdit2: TDBEdit
    Left = 248
    Top = 64
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NomeFonte'
    DataSource = FontesSrc
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 560
    Top = 64
    Width = 134
    Height = 21
    CharCase = ecUpperCase
    DataField = 'Sigla'
    DataSource = FontesSrc
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 248
    Top = 104
    Width = 449
    Height = 21
    DataField = 'Endereco'
    DataSource = FontesSrc
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 248
    Top = 144
    Width = 185
    Height = 21
    DataField = 'Cidade'
    DataSource = FontesSrc
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 496
    Top = 144
    Width = 105
    Height = 21
    DataField = 'CEP'
    DataSource = FontesSrc
    TabOrder = 7
  end
  object DBEdit8: TDBEdit
    Left = 248
    Top = 184
    Width = 300
    Height = 21
    DataField = 'Contato'
    DataSource = FontesSrc
    TabOrder = 8
  end
  object DBEdit9: TDBEdit
    Left = 248
    Top = 224
    Width = 217
    Height = 21
    DataField = 'Fone'
    DataSource = FontesSrc
    TabOrder = 9
  end
  object DBEdit10: TDBEdit
    Left = 480
    Top = 224
    Width = 217
    Height = 21
    DataField = 'email'
    DataSource = FontesSrc
    TabOrder = 10
  end
  object DBEdit11: TDBEdit
    Left = 248
    Top = 264
    Width = 300
    Height = 21
    DataField = 'Url'
    DataSource = FontesSrc
    TabOrder = 11
  end
  object DBEdit13: TDBEdit
    Left = 248
    Top = 344
    Width = 81
    Height = 21
    DataField = 'DtCadastro'
    DataSource = FontesSrc
    TabOrder = 13
  end
  object DBEdit14: TDBEdit
    Left = 336
    Top = 344
    Width = 113
    Height = 21
    DataField = 'UsuarioCadastro'
    DataSource = FontesSrc
    TabOrder = 14
  end
  object DBEdit15: TDBEdit
    Left = 472
    Top = 344
    Width = 81
    Height = 21
    DataField = 'DtEdicao'
    DataSource = FontesSrc
    TabOrder = 15
  end
  object DBEdit16: TDBEdit
    Left = 560
    Top = 344
    Width = 113
    Height = 21
    DataField = 'UsuarioEdicao'
    DataSource = FontesSrc
    TabOrder = 16
  end
  object DBComboBox1: TDBComboBox
    Left = 440
    Top = 144
    Width = 44
    Height = 21
    Style = csDropDownList
    DataField = 'UF'
    DataSource = FontesSrc
    ItemHeight = 13
    Items.Strings = (
      'AC'
      'AL'
      'AM'
      'AP'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MG'
      'MS'
      'MT'
      'PA'
      'PB'
      'PE'
      'PI'
      'PR'
      'RJ'
      'RN'
      'RO'
      'RR'
      'RS'
      'SC'
      'SE'
      'SP'
      'TO')
    TabOrder = 6
  end
  object DBComboBox2: TDBComboBox
    Left = 248
    Top = 304
    Width = 217
    Height = 21
    Style = csDropDownList
    DataField = 'Tipo'
    DataSource = FontesSrc
    ItemHeight = 13
    Items.Strings = (
      'ONG'
      'Particular'
      'Particular Internacional'
      'P'#250'blico Estadual'
      'P'#250'blico Federal'
      'P'#250'blico Internacional'
      'P'#250'blico Municipal')
    Sorted = True
    TabOrder = 12
  end
  object Fontes: TADOTable
    Connection = DM.ADOConnection1
    BeforePost = FontesBeforePost
    OnNewRecord = FontesNewRecord
    TableName = 'Fontes'
    Left = 616
    Top = 8
    object FontesCodigoFonte: TAutoIncField
      FieldName = 'CodigoFonte'
      ReadOnly = True
    end
    object FontesNomeFonte: TStringField
      FieldName = 'NomeFonte'
      Size = 50
    end
    object FontesSigla: TStringField
      FieldName = 'Sigla'
      Size = 10
    end
    object FontesEndereco: TStringField
      FieldName = 'Endereco'
      Size = 200
    end
    object FontesCidade: TStringField
      FieldName = 'Cidade'
    end
    object FontesUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object FontesCEP: TStringField
      FieldName = 'CEP'
      EditMask = '00.000-000;1;_'
      Size = 10
    end
    object FontesContato: TStringField
      FieldName = 'Contato'
      Size = 100
    end
    object FontesFone: TStringField
      FieldName = 'Fone'
      Size = 50
    end
    object Fontesemail: TStringField
      FieldName = 'email'
      Size = 50
    end
    object FontesUrl: TStringField
      FieldName = 'Url'
      Size = 50
    end
    object FontesTipo: TStringField
      FieldName = 'Tipo'
    end
    object FontesDtCadastro: TDateTimeField
      FieldName = 'DtCadastro'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object FontesUsuarioCadastro: TStringField
      FieldName = 'UsuarioCadastro'
      Size = 18
    end
    object FontesDtEdicao: TDateTimeField
      FieldName = 'DtEdicao'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object FontesUsuarioEdicao: TStringField
      FieldName = 'UsuarioEdicao'
      Size = 18
    end
  end
  object FontesSrc: TDataSource
    DataSet = Fontes
    Left = 616
    Top = 48
  end
end
