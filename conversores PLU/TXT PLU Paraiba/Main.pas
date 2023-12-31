unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ComCtrls;

type
  TMainForm = class(TForm)
    BitBtn1: TBitBtn;
    ADOConnection1: TADOConnection;
    E: TADOQuery;
    ECodest: TWideStringField;
    EEstacao: TWideStringField;
    ELat: TWideStringField;
    ELong: TWideStringField;
    EAltitude: TFloatField;
    ESrc: TDataSource;
    Ano: TADOQuery;
    ProgressBar1: TProgressBar;
    Anoano: TIntegerField;
    AnoSrc: TDataSource;
    C: TADOQuery;
    AnoCodest: TWideStringField;
    Cmes: TIntegerField;
    Cd1: TFloatField;
    Cd2: TFloatField;
    Cd3: TFloatField;
    Cd4: TFloatField;
    Cd5: TFloatField;
    Cd6: TFloatField;
    Cd7: TFloatField;
    Cd8: TFloatField;
    Cd9: TFloatField;
    Cd10: TFloatField;
    Cd11: TFloatField;
    Cd12: TFloatField;
    Cd13: TFloatField;
    Cd14: TFloatField;
    Cd15: TFloatField;
    Cd16: TFloatField;
    Cd17: TFloatField;
    Cd18: TFloatField;
    Cd19: TFloatField;
    Cd20: TFloatField;
    Cd21: TFloatField;
    Cd22: TFloatField;
    Cd23: TFloatField;
    Cd24: TFloatField;
    Cd25: TFloatField;
    Cd26: TFloatField;
    Cd27: TFloatField;
    Cd28: TFloatField;
    Cd29: TFloatField;
    Cd30: TFloatField;
    Cd31: TFloatField;
    Ctotal: TFloatField;
    Cnumdias: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.BitBtn1Click(Sender: TObject);
var
 I, J: integer;
 S:TStringList;
 Str,Dado:String;
begin
 try
  S:=TStringList.Create;
  E.Open;
  Ano.Open;
  C.Open;
  ProgressBar1.Max:=E.RecordCount;
  Screen.Cursor:=crHourGlass;
  While not E.eof do
  begin
   S.Clear;
   //Primeira Linha
   Str:=AnsiUpperCase(EEstacao.AsString);
   While length(Str)<>29 do
    Str:=Str+' ';
   Str:=Str+'0'+Copy(ELat.AsString,2,3)+'00';
   While length(Str)<>43 do
    Str:=Str+' ';
   Str:=Str+Copy(ELong.AsString,2,4)+'00';
   While length(Str)<>60 do
    Str:=Str+' ';
   Str:=Str+EAltitude.AsString;
   S.Add(Str);
   //Anos
   While not Ano.Eof do
   begin
    S.Add(ECodest.AsString+','+AnoAno.AsString);
    For I:=1 to 12 do //Meses
    begin
     If C.Locate('Mes',I,[]) then
     begin
      //Primeiros 15 dias
      Str:='             ';
      For J:=1 to 15 do
      begin
       Dado:=C.Fields[J].AsString;
       While length(Dado)<>4 do Dado:=' '+Dado;
       Str:=Str+Dado;
      end;
      S.Add(Str+'   0');
      //�ltimos 15 dias
      Str:='             ';
      For J:=16 to 31 do
      begin
       If C.Fields[J].AsString<>'-99' then
        Dado:=C.Fields[J].AsString
       else
        Dado:='   0';
       While length(Dado)<>4 do Dado:=' '+Dado;
       Str:=Str+Dado;
      end;
      S.Add(Str);
     end
     else //Mes n�o existe
     begin
      S.Add('                                                                             ');
      S.Add('                                                                             ');
     end;
    end;
    //Pr�ximo Ano
    Ano.Next;
   end;
   S.Add('000000');
   S.SaveToFile(ExtractFilePath(ParamStr(0))+AnsiUpperCase(EEstacao.AsString)+'.PLU');
   ProgressBar1.Position:=ProgressBar1.Position+1;
   Application.ProcessMessages;
   E.Next;
  end;
  C.Close;
  Ano.Close;
  E.Close;
  Screen.Cursor:=crDefault;
  ShowMessage('Fim');
 except
  Screen.Cursor:=crDefault;
  S.SaveToFile(ExtractFilePath(ParamStr(0))+EEstacao.AsString+'.PLU');
  MessageDlg('Erro ao processar dados.',mtInformation,[mbOk],0);
 end;
end;

end.
