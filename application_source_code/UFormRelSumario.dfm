object FormRelSumario: TFormRelSumario
  Left = 214
  Top = 147
  Width = 644
  Height = 480
  Caption = 'FormRelSumario'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 6
    Top = 3
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = DM.Sumario
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Values = (
      120
      2100
      100
      2970
      100
      100
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = First
    PrintIfEmpty = False
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = 8454143
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333
        2770.1875)
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 10
        Top = 1
        Width = 337
        Height = 35
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          92.6041666666667
          26.4583333333333
          2.64583333333333
          891.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sum'#225'rio das Esta'#231#245'es      UF:GO'
        Color = 8454143
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Impact'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 20
      end
      object QRSysData2: TQRSysData
        Left = 976
        Top = 20
        Width = 59
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2582.33333333333
          52.9166666666667
          156.104166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = 8454143
        Data = qrsDate
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Data: '
        Transparent = False
        FontSize = 8
      end
    end
    object ColumnHeaderBand1: TQRBand
      Left = 38
      Top = 78
      Width = 1047
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        42.3333333333333
        2770.1875)
      BandType = rbColumnHeader
      object QRLabel4: TQRLabel
        Left = 2
        Top = 0
        Width = 55
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          39.6875
          5.29166666666667
          0
          145.520833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 59
        Top = 0
        Width = 167
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          39.6875
          156.104166666667
          0
          441.854166666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Nome da Esta'#231#227'o'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 228
        Top = 0
        Width = 65
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          39.6875
          603.25
          0
          171.979166666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Latitude'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 295
        Top = 0
        Width = 65
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          39.6875
          780.520833333333
          0
          171.979166666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Longitude'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 362
        Top = 0
        Width = 45
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          957.791666666667
          0
          119.0625)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Altitude'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 409
        Top = 0
        Width = 181
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = True
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1082.14583333333
          0
          478.895833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Per'#237'odo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 592
        Top = 0
        Width = 39
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = True
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1566.33333333333
          0
          103.1875)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Anos'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 633
        Top = 0
        Width = 141
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = True
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1674.8125
          0
          373.0625)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Arquivo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object Detail: TQRBand
      Left = 38
      Top = 94
      Width = 1047
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        42.3333333333333
        2770.1875)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 2
        Top = 0
        Width = 55
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          39.6875
          5.29166666666667
          0
          145.520833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DM.Sumario
        DataField = 'CodigoEstacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 59
        Top = 0
        Width = 167
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          39.6875
          156.104166666667
          0
          441.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DM.Sumario
        DataField = 'NomeEstacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 228
        Top = 0
        Width = 65
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          39.6875
          603.25
          0
          171.979166666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DM.Sumario
        DataField = 'Latitude'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 295
        Top = 0
        Width = 65
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          39.6875
          780.520833333333
          0
          171.979166666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DM.Sumario
        DataField = 'Longitude'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 362
        Top = 0
        Width = 45
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          957.791666666667
          0
          119.0625)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DM.Sumario
        DataField = 'Altitude'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 409
        Top = 0
        Width = 181
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = True
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1082.14583333333
          0
          478.895833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DM.Sumario
        DataField = 'Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 592
        Top = 0
        Width = 39
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = True
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1566.33333333333
          0
          103.1875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DM.Sumario
        DataField = 'Anos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 633
        Top = 0
        Width = 141
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = True
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1674.8125
          0
          373.0625)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DM.Sumario
        DataField = 'Arquivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object PageFooterBand2: TQRBand
      Left = 38
      Top = 110
      Width = 1047
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.9791666666667
        2770.1875)
      BandType = rbPageFooter
      object QRLabel15: TQRLabel
        Left = 5
        Top = 1
        Width = 229
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          13.2291666666667
          2.64583333333333
          605.895833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fonte: Banco de Dados Pluviom'#233'tricos - BanPlu'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRSysData1: TQRSysData
        Left = 951
        Top = 1
        Width = 89
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2516.1875
          2.64583333333333
          235.479166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'P'#225'gina N'#186' '
        Transparent = False
        FontSize = 8
      end
    end
  end
end