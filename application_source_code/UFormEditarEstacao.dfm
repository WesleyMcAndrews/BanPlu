object FormEditarEstacao: TFormEditarEstacao
  Left = 448
  Top = 187
  ActiveControl = NomeEdit
  BorderStyle = bsDialog
  Caption = 'Editar Esta'#231#227'o'
  ClientHeight = 332
  ClientWidth = 400
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
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 385
    Height = 281
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 85
    Height = 13
    Caption = 'Nome da Esta'#231#227'o'
  end
  object Label3: TLabel
    Left = 232
    Top = 96
    Width = 52
    Height = 13
    Caption = 'Altitude (m)'
  end
  object Label4: TLabel
    Left = 64
    Top = 96
    Width = 28
    Height = 13
    Caption = 'Graus'
  end
  object Label5: TLabel
    Left = 104
    Top = 96
    Width = 17
    Height = 13
    Caption = 'Min'
  end
  object Label6: TLabel
    Left = 144
    Top = 96
    Width = 19
    Height = 13
    Caption = 'Seg'
  end
  object Label7: TLabel
    Left = 64
    Top = 136
    Width = 28
    Height = 13
    Caption = 'Graus'
  end
  object Label8: TLabel
    Left = 104
    Top = 136
    Width = 17
    Height = 13
    Caption = 'Min'
  end
  object Label9: TLabel
    Left = 144
    Top = 136
    Width = 19
    Height = 13
    Caption = 'Seg'
  end
  object Label1: TLabel
    Left = 22
    Top = 115
    Width = 38
    Height = 13
    Caption = 'Latitude'
  end
  object Label10: TLabel
    Left = 13
    Top = 154
    Width = 47
    Height = 13
    Caption = 'Longitude'
  end
  object Label13: TLabel
    Left = 16
    Top = 16
    Width = 56
    Height = 13
    Caption = 'UF Esta'#231#227'o'
  end
  object Label11: TLabel
    Left = 16
    Top = 184
    Width = 27
    Height = 13
    Caption = 'Fonte'
  end
  object Label12: TLabel
    Left = 16
    Top = 224
    Width = 104
    Height = 13
    Caption = 'Munic'#237'pio da Esta'#231#227'o'
  end
  object NomeEdit: TEdit
    Left = 16
    Top = 72
    Width = 369
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 50
    TabOrder = 0
    Text = 'NOMEEDIT'
    OnChange = NomeEditChange
  end
  object AltitudeEdit: TEdit
    Left = 232
    Top = 112
    Width = 65
    Height = 21
    TabOrder = 7
    Text = 'Edit1'
    OnChange = NomeEditChange
    OnKeyPress = AltitudeEditKeyPress
  end
  object LatGEdit: TEdit
    Left = 64
    Top = 112
    Width = 33
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    OnChange = NomeEditChange
    OnKeyPress = LatGEditKeyPress
  end
  object LatMEdit: TEdit
    Left = 104
    Top = 112
    Width = 33
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
    OnChange = NomeEditChange
    OnKeyPress = LatGEditKeyPress
  end
  object LatSEdit: TEdit
    Left = 144
    Top = 112
    Width = 33
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
    OnChange = NomeEditChange
    OnKeyPress = LatGEditKeyPress
  end
  object LongGEdit: TEdit
    Left = 64
    Top = 152
    Width = 33
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
    OnChange = NomeEditChange
    OnKeyPress = LatGEditKeyPress
  end
  object LongMEdit: TEdit
    Left = 104
    Top = 152
    Width = 33
    Height = 21
    TabOrder = 5
    Text = 'Edit1'
    OnChange = NomeEditChange
    OnKeyPress = LatGEditKeyPress
  end
  object LongSEdit: TEdit
    Left = 144
    Top = 152
    Width = 33
    Height = 21
    TabOrder = 6
    Text = 'Edit1'
    OnChange = NomeEditChange
    OnKeyPress = LatGEditKeyPress
  end
  object BitBtn1: TBitBtn
    Left = 120
    Top = 296
    Width = 75
    Height = 25
    Caption = 'OK'
    Enabled = False
    ModalResult = 1
    TabOrder = 8
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 296
    Width = 75
    Height = 25
    TabOrder = 9
    Kind = bkCancel
  end
  object UFsCombo: TComboBox
    Left = 16
    Top = 32
    Width = 41
    Height = 21
    Style = csDropDownList
    DropDownCount = 15
    ItemHeight = 13
    TabOrder = 10
    OnChange = NomeEditChange
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
  end
  object FonteCombo: TDBLookupComboBox
    Left = 16
    Top = 200
    Width = 361
    Height = 21
    KeyField = 'CodigoFonte'
    ListField = 'SiglaENome'
    ListSource = DM.FontesSrc
    TabOrder = 11
    OnClick = NomeEditChange
  end
  object MunicCombo: TDBLookupComboBox
    Left = 16
    Top = 240
    Width = 361
    Height = 21
    DropDownRows = 15
    KeyField = 'CodigoMunicipio'
    ListField = 'NomeMunicipio'
    ListSource = DM.MunicipiosSrc
    TabOrder = 12
    OnClick = NomeEditChange
  end
end
