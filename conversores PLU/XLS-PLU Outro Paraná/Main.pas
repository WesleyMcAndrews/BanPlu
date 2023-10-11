unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, FileCtrl, Buttons, OleServer, Excel2000, DateUtils;

type
  TMainForm = class(TForm)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    ProgressBar1: TProgressBar;
    ExcelApplication1: TExcelApplication;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.SpeedButton1Click(Sender: TObject);
var
   Planilha    : olevariant;
   I,F : integer;
   Plu:TStringList;
   Str,UltimoAno,Chuva:String;
   Valor,Dado:Real;
   Data:TDateTime;
begin
 try
  ProgressBar1.Max:=FileListBox1.Count;
  Screen.Cursor:=crHourGlass;
  Plu:=TStringList.Create;
  ExcelApplication1 := TExcelApplication.Create(nil);
  ExcelApplication1.Visible[0] := false;
  For F:=0 to FileListBox1.Items.Count-1 do
  begin
   ExcelApplication1.Workbooks.Open(DirectoryListBox1.Directory+'\'+FileListBox1.Items[F],EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,0);
   Plu.Clear;
   Planilha := ExcelApplication1.Workbooks[1].Worksheets[1];
   //Primeira Linha
   Str:=Copy(Planilha.Cells[2,2],1,29);
   While length(Str)<29 do
    Str:=Str+' ';
   //Lat
   Valor:=Abs(StrToFloat(Planilha.Cells[2,3]));
   Str:=Str+FormatFloat('00',Int(Valor));
   Valor:=(Valor-Int(Valor))*60;
   Str:=Str+FormatFloat('00',Int(Valor));
   Valor:=(Valor-Int(Valor))*60;
   Str:=Str+FormatFloat('00',Int(Valor));
   While length(Str)<43 do
    Str:=Str+' ';
   //Long
   Valor:=Abs(StrToFloat(Planilha.Cells[2,4]));
   Str:=Str+FormatFloat('00',Int(Valor));
   Valor:=(Valor-Int(Valor))*60;
   Str:=Str+FormatFloat('00',Int(Valor));
   Valor:=(Valor-Int(Valor))*60;
   Str:=Str+FormatFloat('00',Int(Valor));
   While length(Str)<60 do
    Str:=Str+' ';
   Str:=Str+IntToStr(Planilha.Cells[2,5]);
   Plu.Add(Str);

   //Anos
   I:=2;
   Data:=StrToDate('01/01/'+IntToStr(Planilha.Cells[I,8]));
   UltimoAno:='';
   While Length(Planilha.Cells[I,2])>0 do
   begin
    //Verificar se é novo ano
    If UltimoAno<>IntToStr(Planilha.Cells[I,8]) then
    begin
     Plu.Add(IntToStr(Planilha.Cells[I,1])+','+IntToStr(Planilha.Cells[I,8]));
     UltimoAno:=Planilha.Cells[I,8];
     Data:=StrToDate('01/01/'+IntToStr(Planilha.Cells[I,8]));
     Str:='             ';
    end;
    If Data=StrToDate(IntToStr(Planilha.Cells[I,6])+'/'+IntToStr(Planilha.Cells[I,7])+'/'+IntToStr(Planilha.Cells[I,8])) then
    begin
     Dado:=Planilha.Cells[I,9];
     Dado:=Dado*10;
     Chuva:=FloatToStr(Dado);
     If (Chuva='77777')or(Chuva='7777') then Chuva:='0';
     While length(Chuva)<4 do Chuva:=' '+Chuva;
      Str:=Str+Chuva;
     I:=I+1;
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
   While Data<StrToDate('31/12/'+IntToStr(Planilha.Cells[I-1,8])) do
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
   Plu.SaveToFile(ExtractFilePath(ParamStr(0))+Copy(FileListBox1.Items[F],1,pos('.',FileListBox1.Items[F])-1)+'.PLU');
   ProgressBar1.Position:=ProgressBar1.Position+1;
   ExcelApplication1.Workbooks.Close(0);
  end;
  ExcelApplication1.Free;
  Screen.Cursor:=crDefault;
  ShowMessage('Fim');
 except
  ExcelApplication1.Free;
  Screen.Cursor:=crDefault;
  Plu.SaveToFile(DirectoryListBox1.Directory+'\'+ExtractFileName(FileListBox1.Items[F])+'.PLU');
  MessageDlg('Feche o Excel e tente novamente.',mtInformation,[mbOk],0);
 end;
end;

end.
