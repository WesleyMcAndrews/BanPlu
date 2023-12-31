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
   Lin, I, J, K : integer;
   S:TStringList;
   UltimaEstacao:String;
   Str,Dado,Estacao:String;
begin
 try
  ExcelApplication1.Connect;
  ExcelApplication1.Visible[0] := False;
  If OpenDialog1.Execute then
  begin
   ExcelApplication1.Workbooks.Open(OpenDialog1.FileName,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,0);
   Planilha := ExcelApplication1.Workbooks[1].Worksheets[1];
  end;
  S:=TStringList.Create;
  Screen.Cursor:=crHourGlass;
  UltimaEstacao:='';


  Lin:=2;
  While Length(Planilha.Cells[Lin,1].text)>=0 do
  begin
   //Verificar se � uma esta��o diferente
   If Planilha.Cells[Lin,1].text<>UltimaEstacao then
   begin
    If UltimaEstacao<>'' then //Salvar arquivo
    begin
     S.Add('000000');
     S.SaveToFile(ExtractFilePath(ParamStr(0))+'PB'+Estacao+'.PLU');
     Application.ProcessMessages;
     If Length(Planilha.Cells[Lin,1].text)=0 then //Fim do arquivo
     begin
      ShowMessage('Arquivos criados com suscesso');
      ExcelApplication1.Disconnect;
      ExcelApplication1.Free;
      Exit;
     end;
    end;
    S.Clear;
    UltimaEstacao:=Planilha.Cells[Lin,1].text;
    //Primeira Linha
    Estacao:=Copy(Planilha.Cells[Lin,2].text,1,29);
    While length(Estacao)<29 do Estacao:=Estacao+' ';
    //Lat
    Estacao:=Estacao+FormatFloat('00',Planilha.Cells[Lin,3].value)+FormatFloat('00',Planilha.Cells[Lin,4].value)+FormatFloat('00',Planilha.Cells[Lin,5].value);
    while length(Estacao)<43 do Estacao:=Estacao+' ';
    //Long
    Estacao:=Estacao+FormatFloat('00',Planilha.Cells[Lin,6].value)+FormatFloat('00',Planilha.Cells[Lin,7].value)+FormatFloat('00',Planilha.Cells[Lin,8].value);
    while length(Estacao)<60 do Estacao:=Estacao+' ';
    S.Add(Estacao);
    Estacao:=Planilha.Cells[Lin,2].text
   end;
   //Se for a mesma estacao continua sem fazer nada

   S.Add(Planilha.Cells[Lin,1].text+','+Planilha.Cells[Lin,9].text);
   K:=0;
   For I:=1 to 12 do //Meses
   begin
    //Se For fim de arquivo, finaliza
    If (Length(Planilha.Cells[Lin+K,1].text)=0)or(Planilha.Cells[Lin+K,1].text<>Ultimaestacao) then
     Break;
    //Se o m�s n�o existir, vai para o pr�ximo
    If Planilha.Cells[Lin+K,10].Value<>I then
    begin
     S.Add('                                                                             ');
     S.Add('                                                                             ');
     Continue;
    end;
    //Primeiros 15 dias
    Str:='             ';
    For J:=11 to 25 do
    begin
     try Dado:=FloatToStr(Planilha.Cells[Lin+K,J].Value*10) Except Dado:='    ' end;
     While length(Dado)<4 do Dado:=' '+Dado;
     Str:=Str+Dado;
    end;
    S.Add(Str+'   0');
    //Ultimos 15 dias
    Str:='             ';
    For J:=26 to DaysInAMonth(Planilha.Cells[Lin+K,9].Value,Planilha.Cells[Lin+K,10].Value)+10 do
    begin
     try Dado:=FloatToStr(Planilha.Cells[Lin+K,J].Value*10) Except Dado:='    ' end;
     While length(Dado)<4 do Dado:=' '+Dado;
     Str:=Str+Dado;
    end;
    S.Add(Str);
    K:=K+1;
   end;
   //Pr�ximo Ano
   Lin:=Lin+K;
  end;
  Screen.Cursor:=crDefault;
  ShowMessage('Fim');
  ExcelApplication1.Disconnect;
  ExcelApplication1.Free;
 except
  Screen.Cursor:=crDefault;
  S.SaveToFile(ExtractFilePath(ParamStr(0))+'PB'+Estacao+'.PLU');
  MessageDlg('Feche o Excel e tente novamente.',mtInformation,[mbOk],0);
 end;
end;

end.
