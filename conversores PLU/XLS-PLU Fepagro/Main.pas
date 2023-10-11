unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer, Excel2000, StdCtrls, DateUtils, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    ExcelApplication1: TExcelApplication;
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
var
   Planilha    : olevariant;
   Lin, Col, W, I, J, K : integer;
   S:TStringList;
   UltimoAno:Integer;
   Str,Dado:String;
begin
 try
  ExcelApplication1 := TExcelApplication.Create(nil);
  If OpenDialog1.Execute then
   ExcelApplication1.Workbooks.Open(OpenDialog1.FileName,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,0);
  ExcelApplication1.Visible[0] := True;
  S:=TStringList.Create;
  ProgressBar1.Max:=ExcelApplication1.Workbooks[1].Worksheets.Count;
  Screen.Cursor:=crHourGlass;
  For W:=1 to ExcelApplication1.Workbooks[1].Worksheets.Count do
  begin
   Planilha := ExcelApplication1.Workbooks[1].Worksheets[W];
   S.Clear;
   //Primeira Linha
   S.Add(Planilha.Name);
   Lin:=2;
   While Length(Planilha.Cells[Lin,1].text)>0 do
   begin
    S.Add('Codigo,'+Planilha.Cells[Lin,1].text);
    K:=0;
    For I:=1 to 12 do //Meses
    begin
     //Se For fim de arquivo, finaliza
     If Length(Planilha.Cells[Lin+K,1].text)=0 then
      Break;
     //Se o mês não existir, vai para o próximo
     If Planilha.Cells[Lin+K,2].Value<>I then
     begin
      S.Add('                                                                             ');
      S.Add('                                                                             ');
      Continue;
     end;
     //Primeiros 15 dias
     Str:='             ';
     For J:=3 to 17 do
     begin
      try Dado:=FloatToStr(Planilha.Cells[Lin+K,J].Value*10) Except Dado:='    ' end;
      While length(Dado)<>4 do Dado:=' '+Dado;
      Str:=Str+Dado;
     end;
     S.Add(Str+'   0');
     //Ultimos 15 dias
     Str:='             ';
     For J:=18 to DaysInAMonth(Planilha.Cells[Lin+K,1].Value,Planilha.Cells[Lin+K,2].Value)+3 do
     begin
      try Dado:=FloatToStr(Planilha.Cells[Lin+K,J].Value*10) Except Dado:='    ' end;
      While length(Dado)<>4 do Dado:=' '+Dado;
      Str:=Str+Dado;
     end;
     S.Add(Str);
     K:=K+1;
    end;
    //Próximo Ano
    Lin:=Lin+K;
   end;
   S.SaveToFile(ExtractFilePath(ParamStr(0))+Planilha.Name+'.PLU');
   ProgressBar1.Position:=ProgressBar1.Position+1;
   Application.ProcessMessages;
  end;
  Screen.Cursor:=crDefault;
  ShowMessage('Fim');
  ExcelApplication1.Free;
 except
  Screen.Cursor:=crDefault;
  S.SaveToFile(ExtractFilePath(ParamStr(0))+Planilha.Name+'.PLU');
  MessageDlg('Feche o Excel e tente novamente.',mtInformation,[mbOk],0);
 end;
end;

end.
