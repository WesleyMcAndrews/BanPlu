unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, FileCtrl, OleServer, Excel2000, ComCtrls;

type
  TFormMain = class(TForm)
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    ExcelApplication1: TExcelApplication;
    ProgressBar1: TProgressBar;
    procedure SpeedButton1Click(Sender: TObject);
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
   Lin, Col, F, L : integer;
   S:TStringList;
   Codigo,Str,Dado:String;
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
   Planilha := ExcelApplication1.Workbooks[1].Worksheets[1];
   S.Clear;
   //Primeira Linha
    Str:=Copy(Planilha.Cells[1,1],pos(':',Planilha.Cells[1,1])+1,29);
    While length(Str)<>29 do
     Str:=Str+' ';
    Dado:=Copy(Planilha.Cells[1,3],pos(':',Planilha.Cells[1,3])+2,8);
    Str:=Str+Copy(Dado,1,2)+Copy(Dado,5,2)+'00';
    Codigo:=Copy(Dado,1,2)+Copy(Dado,5,2);
    While length(Str)<>43 do
     Str:=Str+' ';
    Dado:=Copy(Planilha.Cells[1,5],pos(':',Planilha.Cells[1,5])+1,8);
    Str:=Str+Copy(Dado,1,2)+Copy(Dado,5,2)+'00';
    Codigo:=Codigo+Copy(Dado,1,2)+Copy(Dado,5,2);
    While length(Str)<>60 do
     Str:=Str+' ';
    Dado:=Copy(Planilha.Cells[1,7],pos(':',Planilha.Cells[1,7])+1,7);
    Str:=Str+Copy(Dado,1,pos('m',dado)-1);
    S.Add(Str);
   //Anos
   Lin:=3;
   While Copy(Planilha.Cells[Lin,1],1,5)='Dados' do
   begin
    S.Add(Codigo+','+Copy(Planilha.Cells[Lin,1],length(Planilha.Cells[Lin,1])-3,4));
    Lin:=Lin+1;
    For Col:=2 to 13 do
    begin
     Str:='             ';
     For L:=1 to 31 do
     begin
      Dado:=Planilha.Cells[Lin+L,Col];
      If Dado<>'-' then
      try
       Dado:=FloatToStr(StrToFloatDef(Dado,0)*10);
      except
       Dado:='0';
      end
      else
       Dado:='0';
      While length(Dado)<>4 do Dado:=' '+Dado;
       Str:=Str+Dado;
      If L=15 then
      begin
       S.Add(Str+'   0');
       Str:='             ';
      end;
     end;
     While Length(Str)<77 do Str:=Str+'   0';
     S.Add(Str);
    end;//Fim do Ano
    Application.ProcessMessages;
    Lin:=Lin+31;
    While (Copy(Planilha.Cells[Lin,1],1,5)<>'Dados') and (Copy(Planilha.Cells[Lin,1],1,5)<>'Fim') do
     Lin:=Lin+1;
    If Copy(Planilha.Cells[Lin,1],1,5)='Fim' then
     Break;
   end;//fim dos anos
   S.Add('00000');
   S.SaveToFile(DirectoryListBox1.Directory+'\'+ExtractFileName(FileListBox1.Items[F])+'.PLU');
   ProgressBar1.Position:=ProgressBar1.Position+1;
   ExcelApplication1.Workbooks.Close(0);
  end;
  Screen.Cursor:=crDefault;
  ShowMessage('Fim');
  ExcelApplication1.Free;
 except
  Screen.Cursor:=crDefault;
  S.SaveToFile(DirectoryListBox1.Directory+'\'+ExtractFileName(FileListBox1.Items[F])+'.PLU');
  MessageDlg('Feche o Excel e tente novamente.',mtInformation,[mbOk],0);
 end;
end;

end.
