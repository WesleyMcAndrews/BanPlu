object MainForm: TMainForm
  Left = 220
  Top = 113
  Width = 870
  Height = 500
  Caption = 'Conversor TXT PLU Paraiba'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 80
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Converter!'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 144
    Width = 345
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 1
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=parai' +
      'ba.mdb;Mode=Share Deny None;Extended Properties="";Jet OLEDB:Sys' +
      'tem database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Pa' +
      'ssword="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mod' +
      'e=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Tr' +
      'ansactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Create' +
      ' System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLED' +
      'B:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact Without R' +
      'eplica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 24
  end
  object E: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select Distinct Codest, Estacao, Lat, Long, Altitude'
      'from Paraiba')
    Left = 216
    Top = 40
    object ECodest: TWideStringField
      FieldName = 'Codest'
      Size = 8
    end
    object EEstacao: TWideStringField
      FieldName = 'Estacao'
      Size = 26
    end
    object ELat: TWideStringField
      FieldName = 'Lat'
      Size = 4
    end
    object ELong: TWideStringField
      FieldName = 'Long'
      Size = 5
    end
    object EAltitude: TFloatField
      FieldName = 'Altitude'
    end
  end
  object ESrc: TDataSource
    DataSet = E
    Left = 216
    Top = 72
  end
  object Ano: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = ESrc
    Parameters = <
      item
        Name = 'Codest'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 8
        Value = '3822994'
      end>
    SQL.Strings = (
      'Select Distinct Codest, Ano'
      'from Paraiba'
      'Where Codest=:Codest'
      'order by Ano')
    Left = 216
    Top = 104
    object AnoCodest: TWideStringField
      FieldName = 'Codest'
      Size = 8
    end
    object Anoano: TIntegerField
      FieldName = 'ano'
    end
  end
  object AnoSrc: TDataSource
    DataSet = Ano
    Left = 216
    Top = 136
  end
  object C: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = AnoSrc
    Parameters = <
      item
        Name = 'Codest'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '3822994'
      end
      item
        Name = 'Ano'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'Select *'
      'from Paraiba'
      'Where Codest=:Codest'
      'And Ano=:Ano'
      'order by Mes')
    Left = 216
    Top = 168
    object Cmes: TIntegerField
      FieldName = 'mes'
    end
    object Cd1: TFloatField
      FieldName = 'd1'
    end
    object Cd2: TFloatField
      FieldName = 'd2'
    end
    object Cd3: TFloatField
      FieldName = 'd3'
    end
    object Cd4: TFloatField
      FieldName = 'd4'
    end
    object Cd5: TFloatField
      FieldName = 'd5'
    end
    object Cd6: TFloatField
      FieldName = 'd6'
    end
    object Cd7: TFloatField
      FieldName = 'd7'
    end
    object Cd8: TFloatField
      FieldName = 'd8'
    end
    object Cd9: TFloatField
      FieldName = 'd9'
    end
    object Cd10: TFloatField
      FieldName = 'd10'
    end
    object Cd11: TFloatField
      FieldName = 'd11'
    end
    object Cd12: TFloatField
      FieldName = 'd12'
    end
    object Cd13: TFloatField
      FieldName = 'd13'
    end
    object Cd14: TFloatField
      FieldName = 'd14'
    end
    object Cd15: TFloatField
      FieldName = 'd15'
    end
    object Cd16: TFloatField
      FieldName = 'd16'
    end
    object Cd17: TFloatField
      FieldName = 'd17'
    end
    object Cd18: TFloatField
      FieldName = 'd18'
    end
    object Cd19: TFloatField
      FieldName = 'd19'
    end
    object Cd20: TFloatField
      FieldName = 'd20'
    end
    object Cd21: TFloatField
      FieldName = 'd21'
    end
    object Cd22: TFloatField
      FieldName = 'd22'
    end
    object Cd23: TFloatField
      FieldName = 'd23'
    end
    object Cd24: TFloatField
      FieldName = 'd24'
    end
    object Cd25: TFloatField
      FieldName = 'd25'
    end
    object Cd26: TFloatField
      FieldName = 'd26'
    end
    object Cd27: TFloatField
      FieldName = 'd27'
    end
    object Cd28: TFloatField
      FieldName = 'd28'
    end
    object Cd29: TFloatField
      FieldName = 'd29'
    end
    object Cd30: TFloatField
      FieldName = 'd30'
    end
    object Cd31: TFloatField
      FieldName = 'd31'
    end
    object Ctotal: TFloatField
      FieldName = 'total'
    end
    object Cnumdias: TIntegerField
      FieldName = 'numdias'
    end
  end
end
