unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, ADODB, FileCtrl, DateUtils,
  DBTables;

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
    EstacoesLatMin: TFloatField;
    EstacoesLatDec: TFloatField;
    EstacoesLatG: TWideStringField;
    EstacoesLatM: TWideStringField;
    EstacoesLatS: TWideStringField;
    EstacoesLongMin: TFloatField;
    EstacoesLongDec: TFloatField;
    EstacoesLongG: TWideStringField;
    EstacoesLongM: TWideStringField;
    EstacoesLongS: TWideStringField;
    EstacoesLocal: TWideStringField;
    T: TQuery;
    TA_CODG: TStringField;
    TA_TMAX: TFloatField;
    TA_TMIN: TFloatField;
    TA_PREC: TFloatField;
    TA_DATT: TDateField;
    TA_TMSC: TFloatField;
    TA_TMUD: TFloatField;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
Var
 Plu:TStringList;
 F:Integer;
 Str,UltimoAno,Chuva:String;
 Data:TDateTime;
begin
 Screen.Cursor:=crHourGlass;
 //Arquivo
 Plu:=TStringList.Create;
 ProgressBar1.Max:=FileListBox1.Items.Count;
 Estacoes.Open;
 For F:=0 to FileListBox1.Items.Count-1 do
 begin
  Application.ProcessMessages;
  Plu.Clear;
  T.Close;
  T.SQL[1]:=FileListBox1.Items[F];
  T.Open;
  //Primeira Linha
  Str:=Copy(FileListBox1.Items[F],1,pos('.',FileListBox1.Items[F])-1);
  While length(Str)<29 do
   Str:=Str+' ';
  //Lat e Long
  {If Estacoes.Locate('Local',Copy(A.Strings[0],8,50),[]) then
  begin
   Str:=Str+EstacoesLatG.AsString+EstacoesLatM.AsString+EstacoesLatS.AsString;
   While length(Str)<44 do
    Str:=Str+' ';
   Str:=Str+EstacoesLongG.AsString+EstacoesLongM.AsString+EstacoesLongS.AsString;
   While length(Str)<60 do
    Str:=Str+' ';
   Str:=Str+'0';
   Codigo:=EstacoesLatG.AsString+EstacoesLatM.AsString+EstacoesLongG.AsString+EstacoesLongM.AsString;
  end;}
  Plu.Add(Str);
  //Anos
  Data:=StartOfTheYear(TA_DATT.AsDateTime);
  UltimoAno:='';
  While not T.eof do
  begin
   If TA_DATT.AsString='' then
   begin
    T.Next;
    Continue;
   end;
   //Verificar se é novo ano
   If UltimoAno<>IntToStr(YearOf(Data)) then
   begin
    Plu.Add(TA_CODG.AsString+','+IntToStr(YearOf(TA_DATT.AsDateTime)));
    UltimoAno:=IntToStr(YearOf(TA_DATT.AsDateTime));
    Data:=StartOfTheYear(TA_DATT.AsDateTime);
    Str:='             ';
   end;
   //Retirar Virgulas
   If Data=TA_DATT.AsDateTime then
   begin
    Chuva:=FloatToStr(TA_TMIN.Value*10);
    While length(Chuva)<4 do Chuva:=' '+Chuva;
     Str:=Str+Chuva;
    T.Next;
   end
   else //Data Diferente do Arquivo
    Str:=Str+'   0';//Dia ausente
   If DayOfTheMonth(Data)=15 then //Escrever 1a Linha do Mês
   begin
    Plu.Add(Str+'   0');
    Str:='             ';
   end
   else If DayOfTheMonth(Data)=DaysInMonth(Data) then //Escrever 2a Linha do Mês
   begin
    While Length(Str)<74 do//Completar mês com zero
     Str:=Str+'   0';
    Plu.Add(Str);
    Str:='             ';
   end;
   Data:=Data+1;
  end;
  //Fim do Arquivo. Completar ano ausente
  While Data<EndOfTheYear(TA_DATT.AsDateTime) do
  begin
   Str:=Str+'   0';//Dia ausente
   If DayOfTheMonth(Data)=15 then //Escrever 1a Linha do Mês
   begin
    Plu.Add(Str+'   0');
    Str:='             ';
   end
   else If DayOfTheMonth(Data)=DaysInMonth(Data) then //Escrever 2a Linha do Mês
   begin
    While Length(Str)<74 do//Completar mês com zero
     Str:=Str+'   0';
    Plu.Add(Str);
    Str:='             ';
   end;
   Data:=Data+1;
  end;
  Plu.Add('000000');
  Plu.SaveToFile(ExtractFilePath(ParamStr(0))+TA_CODG.AsString+'-'+Copy(FileListBox1.Items[F],1,pos('.',FileListBox1.Items[F])-1)+'.TMIN');
  ProgressBar1.Position:=ProgressBar1.Position+1;
 end;
 Screen.cursor:=crDefault;
 ShowMessage('Arquivos Carregados');
end;

end.
