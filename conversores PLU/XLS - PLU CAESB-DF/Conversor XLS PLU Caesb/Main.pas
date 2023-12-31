unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, FileCtrl, OleServer, Excel2000, ComCtrls, Math, DateUtils;

type
  TFormMain = class(TForm)
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    ExcelApplication1: TExcelApplication;
    ProgressBar1: TProgressBar;
    Button1: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.SpeedButton1Click(Sender: TObject);
var
   Planilha    : olevariant;
   Lin, Col, W, F : integer;
   S:TStringList;
   Str,Dado:String;
begin
 try
  ExcelApplication1 := TExcelApplication.Create(nil);
  ExcelApplication1.Visible[0] := false;
  ProgressBar1.Max:=FileListBox1.Count;
  Screen.Cursor:=crHourGlass;
  S:=TStringList.Create;
  For F:=0 to FileListBox1.Items.Count-1 do
  begin
   ExcelApplication1.Workbooks.Open(DirectoryListBox1.Directory+'\'+FileListBox1.Items[F],EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,0);
   S.Clear;
   For W:=1 to ExcelApplication1.Workbooks[1].Worksheets.Count-3 do
   begin
    Planilha := ExcelApplication1.Workbooks[1].Worksheets[W];
    If W=1 then //In�cio do PLU
    begin
    //Primeira Linha
     Str:=Copy(Planilha.Cells[3,1],10,15);
     While length(Str)<29 do
      Str:=Str+' ';
     Dado:=Copy(Planilha.Cells[3,9],11,11);
     Str:=Str+Copy(Dado,1,2)+Copy(Dado,5,2)+Copy(Dado,9,2);
     While length(Str)<43 do
      Str:=Str+' ';
     Dado:=Copy(Planilha.Cells[3,9],50,11);
     Str:=Str+Copy(Dado,1,2)+Copy(Dado,5,2)+Copy(Dado,9,2);
     While length(Str)<60 do
      Str:=Str+' ';
     Str:=Str+Copy(Planilha.Cells[3,7],11,7);
     S.Add(Str);
    end;
    S.Add(Copy(Planilha.Cells[3,5],9,8)+','+Planilha.Name);
    For Col:=2 to 13 do
    begin
     Str:='             ';
     For Lin:=5 to 35 do
     begin
      //Dado:=Planilha.Cells[Lin,Col];
      //If Dado<>'-' then
      try
       Dado:=FloatToStr(RoundTo(Planilha.Cells[Lin,Col].value,-1)*10);
      //else
      except
       Dado:='    ';
      end; 
      While length(Dado)<4 do Dado:=' '+Dado;                      
       Str:=Str+Dado;
      If Lin=19 then
      begin
       S.Add(Str+'   0');
       Str:='             ';
      end;
     end;
     S.Add(Str);
    end;//Fim do Ano
    Application.ProcessMessages;
    S.SaveToFile(DirectoryListBox1.Directory+'\'+ExtractFileName(FileListBox1.Items[F])+'.PLU');
   end;//fim dos anos
   S.Add('00000');
   S.SaveToFile(DirectoryListBox1.Directory+'\'+ExtractFileName(FileListBox1.Items[F])+'.PLU');
   ProgressBar1.Position:=ProgressBar1.Position+1;
   ExcelApplication1.Workbooks.Close(0);
  end;
  ExcelApplication1.Free;
  Screen.Cursor:=crDefault;
  ShowMessage('Fim');
 except
  Screen.Cursor:=crDefault;
  S.SaveToFile(DirectoryListBox1.Directory+'\'+ExtractFileName(FileListBox1.Items[F])+'.PLU');
  MessageDlg('Feche o Excel e tente novamente.',mtInformation,[mbOk],0);
 end;
end;

procedure TFormMain.Button1Click(Sender: TObject);
var
   Planilha    : olevariant;
   Lin, Col, W, F : integer;
   S:TStringList;
   Dado:String;
   Data:TDateTime;
begin
 try
  ExcelApplication1 := TExcelApplication.Create(nil);
  ExcelApplication1.Visible[0] := false;
  ProgressBar1.Max:=FileListBox1.Count;
  Screen.Cursor:=crHourGlass;
  S:=TStringList.Create;
  For F:=0 to FileListBox1.Items.Count-1 do
  begin
   ExcelApplication1.Workbooks.Open(DirectoryListBox1.Directory+'\'+FileListBox1.Items[F],EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,0);
   S.Clear;
   S.Add('Data;Chuva');
   For W:=1 to ExcelApplication1.Workbooks[1].Worksheets.Count-3 do
   begin
    Planilha := ExcelApplication1.Workbooks[1].Worksheets[W];
    For Col:=2 to 13 do
    begin
     Data:=StrToDate('01/'+IntToStr(Col-1)+'/'+Planilha.Name);
     For Lin:=5 to 35 do
     begin
      try
       Dado:=FloatToStr(RoundTo(Planilha.Cells[Lin,Col].value,-1));
      //else
      except
       Dado:='';
      end;
      S.Add(FormatDateTime('dd/mm/yyyy',Data)+';'+Dado);
      If DayOfThemonth(EndOfTheMonth(Data))=DayOfTheMonth(Data) then
       Break;
      Data:=Data+1;
     end;
    end;//Fim do Ano
    Application.ProcessMessages;
    S.SaveToFile(DirectoryListBox1.Directory+'\'+ExtractFileName(FileListBox1.Items[F])+'.CSV');
   end;//fim dos anos
   S.SaveToFile(DirectoryListBox1.Directory+'\'+ExtractFileName(FileListBox1.Items[F])+'.CSV');
   ProgressBar1.Position:=ProgressBar1.Position+1;
   ExcelApplication1.Workbooks.Close(0);
  end;
  ExcelApplication1.Free;
  Screen.Cursor:=crDefault;
  ShowMessage('Fim');
 except
  Screen.Cursor:=crDefault;
  S.SaveToFile(DirectoryListBox1.Directory+'\'+ExtractFileName(FileListBox1.Items[F])+'.PLU');
  MessageDlg('Feche o Excel e tente novamente.',mtInformation,[mbOk],0);
 end;
end;

end.
