object FormExportarDados: TFormExportarDados
  Left = 304
  Top = 167
  BorderStyle = bsDialog
  Caption = 'Exportar Dados'
  ClientHeight = 200
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 297
    Height = 153
    Caption = 'Exportar para:'
    TabOrder = 0
    object DocRadio: TRadioButton
      Left = 16
      Top = 24
      Width = 265
      Height = 17
      Caption = 'DOC - Word (Nota T'#233'cnica + Per'#237'odos de Plantio)'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object XMLRadio: TRadioButton
      Left = 16
      Top = 96
      Width = 249
      Height = 17
      Caption = 'XML (Per'#237'odos de Plantio)'
      TabOrder = 1
    end
    object PDFRadio: TRadioButton
      Left = 16
      Top = 48
      Width = 249
      Height = 17
      Caption = 'PDF (Nota T'#233'cnica + Per'#237'odos de Plantio)'
      Enabled = False
      TabOrder = 2
    end
    object XLSRadio: TRadioButton
      Left = 16
      Top = 72
      Width = 249
      Height = 17
      Caption = 'XLS - Excel (Per'#237'odos de Plantio)'
      TabOrder = 3
    end
    object CSVRadio: TRadioButton
      Left = 16
      Top = 120
      Width = 265
      Height = 17
      Caption = 'CSV (Per'#237'odos de Plantio) - Interc'#226'mbio de Dados'
      TabOrder = 4
    end
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 168
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
    Left = 160
    Top = 168
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Salvar em'
    Left = 240
    Top = 8
  end
  object WordFont: TWordFont
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 96
    Top = 8
  end
  object WordDocument: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 128
    Top = 8
  end
  object WordApplication: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 160
    Top = 8
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 200
    Top = 8
  end
  object Periodos: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Safra'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'UF'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'Cultura'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'Ciclo'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'Solo'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM tbPeriodos P'
      'WHERE P.Safra=:Safra'
      'AND P.UF=:UF'
      'AND P.Cultura=:Cultura'
      'AND P.Ciclo=:Ciclo')
    Left = 272
    Top = 8
    object PeriodosSafra: TWideStringField
      FieldName = 'Safra'
      Size = 9
    end
    object PeriodosUF: TWideStringField
      FieldName = 'UF'
      Size = 2
    end
    object PeriodosMunic: TIntegerField
      FieldName = 'Munic'
    end
    object PeriodosCultura: TIntegerField
      FieldName = 'Cultura'
    end
    object PeriodosCiclo: TIntegerField
      FieldName = 'Ciclo'
    end
    object PeriodosSolo: TIntegerField
      FieldName = 'Solo'
    end
    object PeriodosDecendioIni: TIntegerField
      FieldName = 'DecendioIni'
    end
    object PeriodosDecendioFim: TIntegerField
      FieldName = 'DecendioFim'
    end
    object PeriodosRegiao: TIntegerField
      FieldName = 'Regiao'
    end
    object PeriodosAltitude: TIntegerField
      FieldName = 'Altitude'
    end
  end
end
