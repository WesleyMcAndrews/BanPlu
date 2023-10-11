unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, ADODB, ComCtrls;

type
  TForm1 = class(TForm)
    C: TADOTable;
    CCodigoEstacao: TWideStringField;
    CData: TDateTimeField;
    CChuva: TFloatField;
    S: TTable;
    SESTACAO: TStringField;
    SMS: TFloatField;
    SANO: TFloatField;
    SN4: TFloatField;
    SN5: TFloatField;
    SN6: TFloatField;
    SN7: TFloatField;
    SN8: TFloatField;
    SN9: TFloatField;
    SN10: TFloatField;
    SN11: TFloatField;
    SN12: TFloatField;
    SN13: TFloatField;
    SN14: TFloatField;
    SN15: TFloatField;
    SN16: TFloatField;
    SN17: TFloatField;
    SN18: TFloatField;
    SN19: TFloatField;
    SN20: TFloatField;
    SN21: TFloatField;
    SN22: TFloatField;
    SN23: TFloatField;
    SN24: TFloatField;
    SN25: TFloatField;
    SN26: TFloatField;
    SN27: TFloatField;
    SN28: TFloatField;
    SN29: TFloatField;
    SN30: TFloatField;
    SN31: TFloatField;
    SN32: TFloatField;
    SN33: TFloatField;
    SN34: TFloatField;
    STOTAL_: TFloatField;
    SMAX: TFloatField;
    SNDC: TSmallintField;
    Button1: TButton;
    ProgressBar1: TProgressBar;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
Var
 I:Integer;
begin
 S.Open;
 ProgressBar1.Max:=S.RecordCount;
 C.Open;
 While not S.Eof do
 begin
  For I:=1 to 31 do
  begin
   try
    C.Append;
    CCodigoEstacao.AsString:=SESTACAO.AsString;
    CData.Value:=StrToDate(IntToStr(I)+'/'+SMS.AsString+'/'+SANO.AsString);
    CChuva.Value:=S.Fields[I+2].Value;
    C.Post;
   except
    C.Cancel;
   end;
  end;
  ProgressBar1.Position:=ProgressBar1.Position+1;
  S.Next;
  Application.ProcessMessages;
 end;
 S.Close;
 C.Close;
 ShowMessage('Fim');
end;

end.
