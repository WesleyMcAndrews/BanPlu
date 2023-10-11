unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, FileCtrl, Buttons, DB, ADODB, DateUtils;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    ProgressBar1: TProgressBar;
    ADOConnection1: TADOConnection;
    Estacoes: TADOQuery;
    EstacoesCDIGO: TWideStringField;
    EstacoesCOD_DSSAT: TWideStringField;
    EstacoesNOME: TWideStringField;
    EstacoesUF_: TWideStringField;
    EstacoesLAT_G: TFloatField;
    EstacoesLAT_M: TFloatField;
    EstacoesLAT_S: TFloatField;
    EstacoesLONG_G: TFloatField;
    EstacoesLONG_M: TFloatField;
    EstacoesLONG_S: TFloatField;
    EstacoesALT_m: TFloatField;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    function JulianToDate(S:String):TDateTime;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.JulianToDate(S:String): TDateTime;
begin
 If StrToIntDef(trim(Copy(S,1,2)),0)>20 then
  Result:=StartOfAYear(1900+StrToIntDef(trim(Copy(S,1,2)),0))+StrToIntDef(trim(Copy(S,3,3)),0)-1
 else
  Result:=StartOfAYear(2000+StrToIntDef(trim(Copy(S,1,2)),0))+StrToIntDef(trim(Copy(S,3,3)),0)-1;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
 Var
  P,S:TStringList;
  F,I,Ano:Integer;
  Dia, Data:TdateTime;
  Str, UltimoAno, UltimoMes, Dado:String;
begin
 DecimalSeparator:='.';
 ProgressBar1.Max:=FileListBox1.Count;
 Screen.Cursor:=crHourGlass;
 P:=TStringList.Create;
 S:=TStringList.Create;
 Estacoes.Open;
 For F:=0 to FileListBox1.Items.Count-1 do
 begin
  P.LoadFromFile(DirectoryListBox1.Directory+'\'+FileListBox1.Items[F]);
  S.Clear;
  //Primeira Linha
  If Estacoes.Locate('COD_DSSAT',Copy(FileListBox1.Items[F],1,4),[]) then
  begin
   Str:=Copy(EstacoesNOME.AsString,1,29);
   While length(Str)<>29 do
    Str:=Str+' ';
   Str:=Str+FormatFloat('00',EstacoesLAT_G.Value)+FormatFloat('00',EstacoesLAT_M.Value)+FormatFloat('00',EstacoesLAT_S.Value);
   While length(Str)<>43 do
    Str:=Str+' ';
   Str:=Str+FormatFloat('00',EstacoesLONG_G.Value)+FormatFloat('00',EstacoesLONG_M.Value)+FormatFloat('00',EstacoesLONG_S.Value);
   While length(Str)<>60 do
    Str:=Str+' ';
   Str:=Str+EstacoesALT_m.AsString;
   S.Add(Str);
  end
  else
   S.Add(' ');
  //Percorrer arquivo
  UltimoAno:='';
  UltimoMes:='';
  I:=1;
  Dia:=StrToDate('01/01/1800');
  While I<=P.Count-1 do
  begin
   Data:=JulianToDate(P.Strings[I]);
   If Dia=StrToDate('01/01/1800') then
    Dia:=StartOfTheYear(Data);
    //Verificar se Data pulou
   If Data>Dia then
    Dado:=' '
   else
    Dado:=FloatToStr(StrToFloat(Trim(Copy(P.Strings[I],25,5)))*10);
   //Data
   If UltimoAno<>FormatDateTime('yyyy',Dia) then
   begin
    If UltimoAno<>'' then
     S.Add(Str);
    S.Add(EstacoesCDIGO.AsString+','+FormatDateTime('yyyy',Dia));
    Str:='             ';
    UltimoAno:=FormatDateTime('yyyy',Dia);
    UltimoMes:=FormatDateTime('mm',Dia);
   end
   else If UltimoMes<>FormatDateTime('mm',Dia) then
   begin
    While Length(Str)<77 do  Str:=Str+'   0';
    S.Add(Str);
    Str:='             ';
    UltimoMes:=FormatDateTime('mm',Dia)
   end;
   //Dado
   While length(Dado)<4 do Dado:=' '+Dado;
    Str:=Str+Dado;
   If FormatDateTime('dd',Dia)='15' then
   begin
    S.Add(Str+'   0');
    Str:='             ';
   end;
   If Data=Dia then //Leia a próxima linha
    I:=I+1;
   //Incrementar Dia
   Dia:=Dia+1;
  end; //EOF
  While Length(Str)<77 do  Str:=Str+'   0';
   S.Add(Str);
  S.Add('000000');
  S.SaveToFile(DirectoryListBox1.Directory+'\'+EstacoesCDIGO.AsString+'.PLU');
  ProgressBar1.Position:=ProgressBar1.Position+1;
 end;
 Screen.Cursor:=crDefault;
 ShowMessage('Fim');
end;

end.
