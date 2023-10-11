unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer, Excel2000, ComCtrls, StdCtrls, DB, ADODB;

type
  TMainForm = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    ProgressBar1: TProgressBar;
    OpenDialog1: TOpenDialog;
    ExcelApplication1: TExcelApplication;
    Estacoes: TADOTable;
    EstacoesCDIGO: TFloatField;
    EstacoesMUNICPIO: TWideStringField;
    EstacoesLATITUDE: TFloatField;
    EstacoesLONGITUDE: TFloatField;
    EstacoesALTITUDE: TFloatField;
    EstacoesLatG: TSmallintField;
    EstacoesLatM: TSmallintField;
    EstacoesLatS: TSmallintField;
    EstacoesLonG: TSmallintField;
    EstacoesLonM: TSmallintField;
    EstacoesLonS: TSmallintField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
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
   Lin, W: integer;
   S:TStringList;
   UltimoAno,UltimoMes:String;
   Str,Dado:String;
begin
 try
  ExcelApplication1 := TExcelApplication.Create(nil);
  If OpenDialog1.Execute then
   ExcelApplication1.Workbooks.Open(OpenDialog1.FileName,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,0);
  ExcelApplication1.Visible[0] := False;
  S:=TStringList.Create;
  ProgressBar1.Max:=ExcelApplication1.Workbooks[1].Worksheets.Count;
  Screen.Cursor:=crHourGlass;
  Estacoes.Open;
  For W:=1 to ExcelApplication1.Workbooks[1].Worksheets.Count do
  begin
   Planilha := ExcelApplication1.Workbooks[1].Worksheets[W];
   S.Clear;
   //Primeira Linha
   Str:=Copy(Planilha.Name,1,29);
   While length(Str)<>29 do
    Str:=Str+' ';
   Str:=Str+FormatFloat('00',EstacoesLatG.Value)+FormatFloat('00',EstacoesLatM.Value)+FormatFloat('00',EstacoesLatS.Value);
   While length(Str)<>43 do
    Str:=Str+' ';
   Str:=Str+FormatFloat('00',EstacoesLonG.Value)+FormatFloat('00',EstacoesLonM.Value)+FormatFloat('00',EstacoesLonS.Value);
   While length(Str)<>60 do
    Str:=Str+' ';
   Str:=Str+FormatFloat('#.0',EstacoesALTITUDE.Value);
   S.Add(Str);

   Lin:=1;
   UltimoAno:='';
   UltimoMes:='';
   While Length(Planilha.Cells[Lin,1].text)>3 do
   begin
    If UltimoAno<>FormatDateTime('yyyy',StrToDate(Planilha.Cells[Lin,1])) then
    begin
     If UltimoAno<>'' then
      S.Add(Str);
     S.Add(EstacoesCDIGO.AsString+','+FormatDateTime('yyyy',StrToDate(Planilha.Cells[Lin,1])));
     Str:='             ';
     UltimoAno:=FormatDateTime('yyyy',StrToDate(Planilha.Cells[Lin,1]));
     UltimoMes:=FormatDateTime('mm',StrToDate(Planilha.Cells[Lin,1]));
    end
    else If UltimoMes<>FormatDateTime('mm',StrToDate(Planilha.Cells[Lin,1])) then
    begin
     S.Add(Str);
     Str:='             ';
     UltimoMes:=FormatDateTime('mm',StrToDate(Planilha.Cells[Lin,1]))
    end;
    Dado:=FloatToStr(StrToFloat(Planilha.Cells[Lin,2])*10);
    If StrToFloat(Dado)>999 then
     Dado:='0';
    While length(Dado)<4 do Dado:=' '+Dado;
     Str:=Str+Dado;
    If FormatDateTime('dd',StrToDate(Planilha.Cells[Lin,1]))='15' then
    begin
     S.Add(Str+'   0');
     Str:='             ';
    end;
    Lin:=Lin+1
   end;//EOF
   S.Add(Str);
   S.Add('000000');

   S.SaveToFile(ExtractFilePath(ParamStr(0))+Planilha.Name+'.PLU');
   ProgressBar1.Position:=ProgressBar1.Position+1;
   Application.ProcessMessages;
   Estacoes.Next;
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
