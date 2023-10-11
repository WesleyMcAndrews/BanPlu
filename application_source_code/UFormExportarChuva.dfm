object FormExportarChuva: TFormExportarChuva
  Left = 304
  Top = 167
  BorderStyle = bsDialog
  Caption = 'Exportar Dados da Esta'#231#227'o'
  ClientHeight = 151
  ClientWidth = 234
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 217
    Height = 105
    Caption = 'Exportar para:'
    TabOrder = 0
    object PLURadio: TRadioButton
      Left = 16
      Top = 48
      Width = 175
      Height = 17
      Caption = 'PLU'
      TabOrder = 0
    end
    object XLSRadio: TRadioButton
      Left = 16
      Top = 24
      Width = 121
      Height = 17
      Caption = 'XLS - Excel'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object CSVRadio: TRadioButton
      Left = 16
      Top = 72
      Width = 180
      Height = 17
      Caption = 'CSV (Comma Separated Values)'
      TabOrder = 2
    end
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Exportar'
    ModalResult = 1
    TabOrder = 1
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
    Left = 120
    Top = 120
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Salvar em'
    Left = 152
    Top = 8
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 112
    Top = 8
  end
  object Chuva: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    DataSource = DM.DetalheSrc
    Parameters = <
      item
        Name = 'IDEstacao'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Ano'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT C.Data, C.Chuva'
      'from ClimaDia C'
      'Where C.IDEstacao=:IDEstacao'
      'And Year(C.Data)=:Ano'
      'Order by C.Data')
    Left = 184
    Top = 8
    object ChuvaData: TDateTimeField
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object ChuvaChuva: TFloatField
      FieldName = 'Chuva'
      DisplayFormat = '#.00'
    end
  end
end
