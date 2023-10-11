unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FileCtrl, Grids, DB, ADODB, DateUtils,
  DBGrids;

type
  TForm1 = class(TForm)
    DriveComboBox1: TDriveComboBox;
    Label1: TLabel;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    Memo1: TMemo;
    ProgressBar1: TProgressBar;
    SpeedButton1: TSpeedButton;
    T: TADOTable;
    TMunicipios: TStringField;
    TPostos: TStringField;
    TLatitude: TIntegerField;
    TLongitude: TIntegerField;
    TAnos: TIntegerField;
    TMeses: TIntegerField;
    TTotal: TFloatField;
    TDia1: TFloatField;
    TDia2: TFloatField;
    TDia3: TFloatField;
    TDia4: TFloatField;
    TDia5: TFloatField;
    TDia6: TFloatField;
    TDia7: TFloatField;
    TDia8: TFloatField;
    TDia9: TFloatField;
    TDia10: TFloatField;
    TDia11: TFloatField;
    TDia12: TFloatField;
    TDia13: TFloatField;
    TDia14: TFloatField;
    TDia15: TFloatField;
    TDia16: TFloatField;
    TDia17: TFloatField;
    TDia18: TFloatField;
    TDia19: TFloatField;
    TDia20: TFloatField;
    TDia21: TFloatField;
    TDia22: TFloatField;
    TDia23: TFloatField;
    TDia24: TFloatField;
    TDia25: TFloatField;
    TDia26: TFloatField;
    TDia27: TFloatField;
    TDia28: TFloatField;
    TDia29: TFloatField;
    TDia30: TFloatField;
    TDia31: TFloatField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ParseRecord(sRecord: string; Row: integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  SG:TStringGrid;

implementation

{$R *.dfm}

procedure TForm1.ParseRecord(sRecord: string; Row: integer);
var
  Col, PosComma: integer;
  sField: string;
begin
  //sRecord := StringReplace(sRecord, '"', '', [rfReplaceAll]    );
  Col := 0;
  repeat
    PosComma := Pos(';', sRecord);
    if PosComma > 0 then
      sField := Copy(sRecord, 1, PosComma - 1)
    else
      sField := sRecord;
    SG.Cells[Col, Row] := sField;
    if PosComma > 0 then
    begin
      Delete(sRecord, 1, PosComma);
      Col := Col + 1;
    end;
  until PosComma = 0;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
Var
 I,Mes,Dia,UltimoAno:Integer;
 Plu:TStringList;
 Str,Dado:String;
begin
 ProgressBar1.Max:=FileListBox1.Items.Count;
 //T.ConnectionString:='Driver={Microsoft Text Driver (*.txt; *.csv)};Dbq='
 //+DirectoryListBox1.Directory+';Extensions=asc,csv,tab,txt;Persist Security Info=False;';
 Plu:=TStringList.Create;
 For I:=0 to FileListBox1.Count-1 do
 begin
  Application.ProcessMessages;
  T.TableName:=FileListBox1.Items[I];
  T.Open;
  Plu.Clear;
  //Primeira Linha
  Str:=Copy(T.FieldByName('Postos').AsString,1,28);
  While length(Str)<29 do
   Str:=Str+' ';
  If Length(T.FieldByName('Latitude').AsString)>3 then
   Str:=Str+T.FieldByName('Latitude').AsString
  else
   Str:=Str+'0'+T.FieldByName('Latitude').AsString;
  While length(Str)<44 do
   Str:=Str+' ';
  Str:=Str+T.FieldByName('Longitude').AsString;
  While length(Str)<60 do
   Str:=Str+' ';
  //Str:=Str+QChuvaAlt.AsString;
  Plu.Add(Str);
  UltimoAno:=0;
  Mes:=12;
  try
  While not T.Eof do
  begin
   If T.FieldByName('Anos').AsInteger<>UltimoAno then
   begin //Cabeçalho do Ano
    Plu.Add(Copy(FileListBox1.Items[I],1,pos('.',FileListBox1.Items[I])-1)+','+T.fieldbyName('Anos').AsString);
    While Mes<12 do //Completar meses faltantes
    begin
     Plu.Add('                                                                             ');
     Plu.Add('                                                                             ');
     Mes:=Mes+1;
    end;
    UltimoAno:=T.FieldByName('Anos').AsInteger;
    Mes:=1;
   end;
   If T.FieldByName('Meses').AsInteger=Mes then
   begin
    //Primeira Linha do Mês
    Str:='             ';
    For Dia:=1 to 15 do
    begin
     If T.FieldByName('Dia'+IntToStr(Dia)).AsString<>'999' then
     begin
      Dado:=T.FieldByName('Dia'+IntToStr(Dia)).AsString;
      If Pos(',',Dado)=1 then Dado:='0'+Dado;
      Dado:=FloatToStr(StrToFloatDef(Dado,0)*10);
     end
     else
      Dado:='    ';
     While length(Dado)<4 do Dado:=' '+Dado;
      Str:=Str+Dado;
    end;
    Plu.Add(Str+'   0');
    //Segunda Linha do Mês
    Str:='             ';
    For Dia:=16 to 31 do
    begin
     If (T.FieldByName('Dia'+IntToStr(Dia)).AsString<>'888')and(T.FieldByName('Dia'+IntToStr(Dia)).AsString<>'999') then
     begin
      Dado:=T.FieldByName('Dia'+IntToStr(Dia)).AsString;
      If Pos(',',Dado)=1 then Dado:='0'+Dado;
      Dado:=FloatToStr(StrToFloatDef(Dado,0)*10);
     end
     else
      Dado:='    ';
     While length(Dado)<>4 do Dado:=' '+Dado;
     Str:=Str+Dado;
    end;
    Plu.Add(Str);
    T.Next;
   end
   else If T.FieldByName('Meses').AsInteger>Mes then
   begin
    Plu.Add('                                                                             ');
    Plu.Add('                                                                             ');
   end;
   Mes:=Mes+1;
  end;
  //Completar ano Faltante
  While Mes<=12 do //Completar meses faltantes
  begin
   Plu.Add('                                                                             ');
   Plu.Add('                                                                             ');
   Mes:=Mes+1;
  end;
  Plu.Add('000000');
  Plu.SaveToFile(ExtractFilePath(ParamStr(0))+Copy(FileListBox1.Items[I],1,pos('.',FileListBox1.Items[I])-1)+'.PLU');
  Except
   Plu.Add('000000');
   Plu.SaveToFile(ExtractFilePath(ParamStr(0))+Copy(FileListBox1.Items[I],1,pos('.',FileListBox1.Items[I])-1)+'.PLU');
   Halt;
  end;
  ProgressBar1.Position:=ProgressBar1.Position+1;
  T.Close;
  Application.ProcessMessages;
 end;
 ShowMessage('Final da Correção.');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 DecimalSeparator:=',';
end;

end.
