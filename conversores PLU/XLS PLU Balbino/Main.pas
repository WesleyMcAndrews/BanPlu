unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer, Excel2000, ComCtrls, StdCtrls, DB, ADODB, FileCtrl, DateUtils;

type
  TMainForm = class(TForm)
    Button1: TButton;
    ProgressBar1: TProgressBar;
    ExcelApplication1: TExcelApplication;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    Label1: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    function AADDDToDate(S:String):TDateTime;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.Button1Click(Sender: TObject);
var
   Planilha    : olevariant;
   F,Lin: integer;
   S:TStringList;
   UltimoAno,UltimoMes:String;
   Estacao,R,CodigoEstacao,Str,Dado:String;
   Dia,Data:TDateTime;
begin
  ProgressBar1.Max:=FileListBox1.Count;
  Screen.Cursor:=crHourGlass;
 try
  ExcelApplication1.Connect;
  ExcelApplication1.Visible[0] := False;
  S:=TStringList.Create;
  For F:=0 to FileListBox1.Items.Count-1 do
  begin
   ExcelApplication1.Workbooks.Open(DirectoryListBox1.Directory+'\'+FileListBox1.Items[F],EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,0);
   Planilha := ExcelApplication1.Workbooks[1].Worksheets[1];
   Estacao:=Copy(FileListBox1.Items[F],1,pos('.',FileListBox1.Items[F])-1);
   S.Clear;
   Dia:=StrToDate('01/01/1800');
   //Primeira Linha
   Str:=Copy(Estacao,1,29);
   //CodigoEstacao:=Copy(Str,1,pos('-',str)-1);
   //Str:=CodigoEstacao+','+Copy(Str,pos('-',Str)+1,29);
   While length(Str)<>29 do
    Str:=Str+' ';
   {Str:=Str+Copy(Planilha.Cells[2,2],1,2)+Copy(Planilha.Cells[2,2],4,2)+'00';
   While length(Str)<>43 do
    Str:=Str+' ';
   Str:=Str+Copy(Planilha.Cells[3,2],1,2)+Copy(Planilha.Cells[3,2],4,2)+'00';
   While length(Str)<>60 do
    Str:=Str+' ';
   Str:=Str+Copy(Planilha.Cells[4,2],1,pos('m',Planilha.Cells[4,2])-1);}
   S.Add(Str);
   Lin:=2;
   UltimoAno:='';
   UltimoMes:='';
   While Length(Planilha.Cells[Lin,1].text)>3 do
   begin
    Application.ProcessMessages;
    Data:=StrToDate(Planilha.Cells[Lin,1]);
    //Inicializar Dia
    If Dia=StrToDate('01/01/1800') then
     Dia:=StartOfTheYear(Data);
    //Verificar se Data pulou
    If Data>Dia then
     Dado:=' '
    else
    begin
     If (Planilha.Cells[Lin,2].text<>'-99,0')and(Planilha.Cells[Lin,2].text<>'-99')
     and(Planilha.Cells[Lin,2].text<>'')and(Planilha.Cells[Lin,2].text<>'NULL')  then
      Dado:=FloatToStr(StrToFloat(Planilha.Cells[Lin,2].text)*10)
     else
      Dado:=' ';
    end;
    //Data
    If UltimoAno<>FormatDateTime('yyyy',Dia) then
    begin
     If UltimoAno<>'' then
      S.Add(Str);
     S.Add(CodigoEstacao+','+FormatDateTime('yyyy',Dia));
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
    If Data=Dia then
     Lin:=Lin+1;
    //Incrementar Dia
    Dia:=Dia+1;
   end;//EOF
   While Length(Str)<77 do  Str:=Str+'   0';
   S.Add(Str);
   S.Add('000000');
   ExcelApplication1.Workbooks.Close(0);
   S.SaveToFile(ExtractFilePath(ParamStr(0))+Estacao+'.PLU');
   ProgressBar1.Position:=ProgressBar1.Position+1;
  end;
  Screen.Cursor:=crDefault;
  ShowMessage('Fim');
  ExcelApplication1.Disconnect;
  ExcelApplication1.Free;
 except
  Screen.Cursor:=crDefault;
  S.SaveToFile(ExtractFilePath(ParamStr(0))+Estacao+'.PLU');
  MessageDlg('Feche o Excel e tente novamente.',mtInformation,[mbOk],0);
 end;
end;

function TMainForm.AADDDToDate(S:String):TDateTime;
 var
  Ano,Dia:Integer;
begin
 If Length(S)<=3 then
  Ano:=2000
 else
  Ano:=StrToInt(copy(S,1,Length(S)-3));
 Dia:=StrToInt(Copy(S,Length(S)-2,3));
 If Ano<30 then
  Ano:=2000+Ano
 else If (Ano>30) and (Ano<100) then
  Ano:=1900+Ano;
 result:=dateutils.EncodeDateDay(Ano,Dia);
end;

procedure TMainForm.Button2Click(Sender: TObject);
var
   Planilha    : olevariant;
   F,Lin: integer;
   S:TStringList;
   UltimoAno,UltimoMes:String;
   Estacao,R,CodigoEstacao,Str,Dado:String;
   Dia,Data:TDateTime;
begin
  ProgressBar1.Max:=FileListBox1.Count;
  Screen.Cursor:=crHourGlass;
 try
  ExcelApplication1.Connect;
  ExcelApplication1.Visible[0] := False;
  S:=TStringList.Create;
  For F:=0 to FileListBox1.Items.Count-1 do
  begin
   ExcelApplication1.Workbooks.Open(DirectoryListBox1.Directory+'\'+FileListBox1.Items[F],EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,0);
   Planilha := ExcelApplication1.Workbooks[1].Worksheets[1];
   Estacao:=Planilha.Cells[1,1];
   S.Clear;
   Dia:=StrToDate('01/01/1800');
   //Primeira Linha
   Str:=Copy(Estacao,1,29);
   CodigoEstacao:=Planilha.Cells[2,1];
   //Str:=CodigoEstacao+','+Copy(Str,pos('-',Str)+1,29);
   While length(Str)<>29 do
    Str:=Str+' ';
   Str:=Str+IntToStr(Planilha.Cells[1,2]);
   While length(Str)<>43 do
    Str:=Str+' ';
   Str:=Str+IntToStr(Planilha.Cells[1,3]);
   While length(Str)<>60 do
    Str:=Str+' ';
   Str:=Str+IntToStr(Planilha.Cells[1,4]);
   S.Add(Str);
   Lin:=3;
   UltimoAno:='';
   UltimoMes:='';
   While Length(Planilha.Cells[Lin,1].text)<>0 do
   begin
    Application.ProcessMessages;
    Data:=AADDDToDate(Planilha.Cells[Lin,1]);
    //Inicializar Dia
    If Dia=StrToDate('01/01/1800') then
     Dia:=StartOfTheYear(Data);
    //Verificar se Data pulou
    If Data>Dia then
     Dado:=' '
    else
    begin
     If (Planilha.Cells[Lin,2].text<>'-99,0')and(Planilha.Cells[Lin,2].text<>'-99')
     and(Planilha.Cells[Lin,2].text<>'')and(Planilha.Cells[Lin,2].text<>'NULL')  then
      Dado:=FloatToStr(StrToFloat(Planilha.Cells[Lin,2].text)*10)
     else
      Dado:=' ';
    end;
    //Data
    If UltimoAno<>FormatDateTime('yyyy',Dia) then
    begin
     If UltimoAno<>'' then
      S.Add(Str);
     S.Add(CodigoEstacao+','+FormatDateTime('yyyy',Dia));
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
    If Data=Dia then
     Lin:=Lin+1;
    //Incrementar Dia
    Dia:=Dia+1;
   end;//EOF
   While Length(Str)<77 do  Str:=Str+'   0';
   S.Add(Str);
   S.Add('000000');
   ExcelApplication1.Workbooks.Close(0);
   S.SaveToFile(ExtractFilePath(ParamStr(0))+CodigoEstacao+'.PLU');
   ProgressBar1.Position:=ProgressBar1.Position+1;
  end;
  Screen.Cursor:=crDefault;
  ShowMessage('Fim');
  ExcelApplication1.Disconnect;
  ExcelApplication1.Free;
 except
  Screen.Cursor:=crDefault;
  S.SaveToFile(ExtractFilePath(ParamStr(0))+CodigoEstacao+'.PLU');
  MessageDlg('Feche o Excel e tente novamente.',mtInformation,[mbOk],0);
 end;
end;

end.
