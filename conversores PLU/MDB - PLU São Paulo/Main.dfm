object Form1: TForm1
  Left = 196
  Top = 110
  Width = 870
  Height = 500
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 48
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Carregar!'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 192
    Width = 729
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 1
  end
  object C: TADOTable
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Sistemas Delphi\' +
      'Agroconsult\Arquivos PLU\S'#227'o Paulo\SP.mdb;Persist Security Info=' +
      'False'
    TableName = 'Chuva'
    Left = 56
    Top = 32
    object CCodigoEstacao: TWideStringField
      FieldName = 'CodigoEstacao'
      Size = 50
    end
    object CData: TDateTimeField
      FieldName = 'Data'
    end
    object CChuva: TFloatField
      FieldName = 'Chuva'
    end
  end
  object S: TTable
    DatabaseName = 'C:\Sistemas Delphi\Agroconsult\Arquivos PLU\S'#227'o Paulo\'
    TableName = 'Plu2004-3_2006.dbf'
    Left = 16
    Top = 32
    object SESTACAO: TStringField
      FieldName = 'ESTACAO'
      Size = 7
    end
    object SMS: TFloatField
      FieldName = 'M'#210'S'
    end
    object SANO: TFloatField
      FieldName = 'ANO'
    end
    object SN4: TFloatField
      FieldName = 'N4'
    end
    object SN5: TFloatField
      FieldName = 'N5'
    end
    object SN6: TFloatField
      FieldName = 'N6'
    end
    object SN7: TFloatField
      FieldName = 'N7'
    end
    object SN8: TFloatField
      FieldName = 'N8'
    end
    object SN9: TFloatField
      FieldName = 'N9'
    end
    object SN10: TFloatField
      FieldName = 'N10'
    end
    object SN11: TFloatField
      FieldName = 'N11'
    end
    object SN12: TFloatField
      FieldName = 'N12'
    end
    object SN13: TFloatField
      FieldName = 'N13'
    end
    object SN14: TFloatField
      FieldName = 'N14'
    end
    object SN15: TFloatField
      FieldName = 'N15'
    end
    object SN16: TFloatField
      FieldName = 'N16'
    end
    object SN17: TFloatField
      FieldName = 'N17'
    end
    object SN18: TFloatField
      FieldName = 'N18'
    end
    object SN19: TFloatField
      FieldName = 'N19'
    end
    object SN20: TFloatField
      FieldName = 'N20'
    end
    object SN21: TFloatField
      FieldName = 'N21'
    end
    object SN22: TFloatField
      FieldName = 'N22'
    end
    object SN23: TFloatField
      FieldName = 'N23'
    end
    object SN24: TFloatField
      FieldName = 'N24'
    end
    object SN25: TFloatField
      FieldName = 'N25'
    end
    object SN26: TFloatField
      FieldName = 'N26'
    end
    object SN27: TFloatField
      FieldName = 'N27'
    end
    object SN28: TFloatField
      FieldName = 'N28'
    end
    object SN29: TFloatField
      FieldName = 'N29'
    end
    object SN30: TFloatField
      FieldName = 'N30'
    end
    object SN31: TFloatField
      FieldName = 'N31'
    end
    object SN32: TFloatField
      FieldName = 'N32'
    end
    object SN33: TFloatField
      FieldName = 'N33'
    end
    object SN34: TFloatField
      FieldName = 'N34'
    end
    object STOTAL_: TFloatField
      FieldName = 'TOTAL_'
    end
    object SMAX: TFloatField
      FieldName = 'MAX'
    end
    object SNDC: TSmallintField
      FieldName = 'NDC'
    end
  end
end
