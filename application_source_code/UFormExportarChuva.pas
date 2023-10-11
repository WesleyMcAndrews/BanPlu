unit UFormExportarChuva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Word2000, OleServer, Excel2000, DB, ADODB, DateUtils, Math;

type
  TFormExportarChuva = class(TForm)
    GroupBox1: TGroupBox;
    PLURadio: TRadioButton;
    XLSRadio: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    CSVRadio: TRadioButton;
    Chuva: TADOQuery;
    ChuvaData: TDateTimeField;
    ChuvaChuva: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ExportarXLS;
    procedure ExportarPLU;
    procedure ExportarCSV;
  public
    { Public declarations }
  end;

var
  FormExportarChuva: TFormExportarChuva;

implementation

 Uses DataModule;

{$R *.dfm}

procedure TFormExportarChuva.BitBtn1Click(Sender: TObject);
begin
 If XLSRadio.Checked then
  ExportarXLS
 else If PLURadio.Checked then
  ExportarPLU
 else If CSVRadio.Checked then
  ExportarCSV;
end;


procedure TFormExportarChuva.ExportarXLS;
var
   Planilha    : olevariant;
   Lin, Col     : integer;
begin
 try
  ExcelApplication1 := TExcelApplication.Create(nil);
  ExcelApplication1.Workbooks.Add(EmptyParam,0);
  ExcelApplication1.Visible[0] := True;
  Planilha := ExcelApplication1.Workbooks[1].Worksheets[1];
  //Sumário
  For Col:=0 to DM.Sumario.FieldCount-1 do
  If DM.Sumario.Fields[Col].Visible then
  begin
   Planilha.Cells[1,Col+1].Select; Planilha.Cells[1,Col+1].Value:=DM.Sumario.Fields[Col].DisplayLabel;
   Planilha.Cells[2,Col+1].Select;
   try
    Planilha.Cells[2,Col+1].Value:=DM.Sumario.Fields[Col].Value;
   except
    Planilha.Cells[2,Col+1].Value:=DM.Sumario.Fields[Col].AsString;
   end;
  end;
  //Chuva
  Lin:=4;
  DM.Detalhe.Open;
  Chuva.Open;
  Planilha.Cells[Lin+0,1].Select; Planilha.Cells[Lin+0,1].Value:='Ano';
  Planilha.Cells[Lin+1,1].Select; Planilha.Cells[Lin+1,1].Value:='Completude(%)';
  Planilha.Cells[Lin+2,1].Select; Planilha.Cells[Lin+2,1].Value:='Ausência de Erros(%)';
  Planilha.Cells[Lin+3,1].Select; Planilha.Cells[Lin+3,1].Value:='Aprovado';
  Col:=2;
  While not DM.Detalhe.eof do
  begin
   Lin:=4;
   Planilha.Cells[Lin+0,Col].Select; Planilha.Cells[Lin+0,Col].Value:=DM.DetalheAno.AsString;
   Planilha.Cells[Lin+1,Col].Select; Planilha.Cells[Lin+1,Col].Value:=DM.DetalheCompletude.Value;
   Planilha.Cells[Lin+2,Col].Select; Planilha.Cells[Lin+2,Col].Value:=DM.DetalheAusenciaErros.Value;
   Planilha.Cells[Lin+3,Col].Select; Planilha.Cells[Lin+3,Col].Value:=DM.DetalheAprovado.AsString;
   Lin:=7;
   While not Chuva.Eof do
   begin
    If Col=2 then //Primeiro Ano
    If (not IsInLeapYear(ChuvaData.Value)) and (DayOfTheYear(ChuvaData.Value)>=60) then
    begin
     Planilha.Cells[DayOfTheYear(ChuvaData.Value)+Lin+1,1].Select;
     Planilha.Cells[DayOfTheYear(ChuvaData.Value)+Lin+1,1].Value:=FormatDateTime('dd/mmm',ChuvaData.Value);
    end
    else
    begin
     Planilha.Cells[DayOfTheYear(ChuvaData.Value)+Lin,1].Select;
     Planilha.Cells[DayOfTheYear(ChuvaData.Value)+Lin,1].Value:=FormatDateTime('dd/mmm',ChuvaData.Value);
    end;
    //Chuva
    If (not IsInLeapYear(ChuvaData.Value)) and (DayOfTheYear(ChuvaData.Value)>=60) then
    begin
     Planilha.Cells[DayOfTheYear(ChuvaData.Value)+Lin+1,Col].Select;
     Planilha.Cells[DayOfTheYear(ChuvaData.Value)+Lin+1,Col].Value:=ChuvaChuva.Value;
    end
    else
    begin
     Planilha.Cells[DayOfTheYear(ChuvaData.Value)+Lin,Col].Select;
     Planilha.Cells[DayOfTheYear(ChuvaData.Value)+Lin,Col].Value:=ChuvaChuva.Value;
    end;
    Chuva.Next;
   end;
   DM.Detalhe.Next;
   Inc(Col);
  end;
  Chuva.Close;
  DM.Detalhe.Close;
  ExcelApplication1.Free;
 except
  MessageDlg('Feche o Excel e tente novamente.',mtInformation,[mbOk],0);
 end;
end;


procedure TFormExportarChuva.ExportarPLU;
Var
 Plu:TStringList;
 Str,Dado:String;
 Mes,Dia:Integer;
begin
 DM.Sumario.First;
 Plu:=TStringList.Create;
 SaveDialog1.FileName:='Exportar Estacoes.PLU';
 If SaveDialog1.Execute then
 While not DM.Sumario.Eof do
 begin
  Screen.Cursor:=CrHourGlass;
  Plu.Clear;
  //Primeira Linha
  Str:=DM.SumarioNomeEstacao.AsString;
  While length(Str)<29 do
   Str:=Str+' ';
  Str:=Str+DM.SumarioLatG.AsString+DM.SumarioLatM.AsString+DM.SumarioLatS.AsString;
  While length(Str)<44 do
   Str:=Str+' ';
  Str:=Str+DM.SumarioLongG.AsString+DM.SumarioLongM.AsString+DM.SumarioLongS.AsString;
  While length(Str)<60 do
   Str:=Str+' ';
  Str:=Str+DM.SumarioAltitude.AsString;
  Plu.Add(Str);
  //Anos
  DM.Detalhe.open;
  Chuva.Open;
  While not DM.Detalhe.Eof do
  begin
   Plu.Add(DM.SumarioCodigoEstacao.AsString+','+DM.DetalheAno.AsString);
   For Mes:=1 to 12 do
   begin
    Str:='             ';
    For Dia:=1 to DaysInAMonth(DM.DetalheAno.Value,Mes) do
    begin
     If RecodeDate(Today,DM.DetalheAno.Value,Mes,Dia)=ChuvaData.Value then
     begin
      Dado:=FloatToStr(RoundTo(ChuvaChuva.Value,-1)*10);
      While length(Dado)<4 do Dado:=' '+Dado;
      Str:=Str+Dado;
      Chuva.Next;
     end
     else
      Str:=Str+'   0';//Dia ausente
     If Dia=15 then
     begin
      Plu.Add(Str+'   0');
      Str:='             ';
     end;
    end;
    While Length(Str)<74 do//Completar mês com zero
     Str:=Str+'   0';
    Plu.Add(Str);
   end;
   DM.Detalhe.Next;
  end;//EOF
  Plu.Add('000000');
  Chuva.Close;
  DM.Detalhe.Close;
  Plu.SaveToFile(ExtractFilePath(SaveDialog1.FileName)+DM.SumarioCodigoEstacao.AsString+'-'+DM.SumarioNomeEstacao.AsString+'-'+DM.SumarioUF.AsString+'.PLU');
  DM.Sumario.Next;
 end;
 Screen.Cursor:=CrDefault;
 PLU.Free;
end;

procedure TFormExportarChuva.ExportarCSV;
Var
 S:TStringList;
 Linha:String;
 I:Integer;
begin
 Screen.Cursor:=CrHourGlass;
 S:=TStringList.Create;
 DM.Detalhe.Open;
 Chuva.Open;
 Linha:='Ano;Completude(%);Ausência de Erros(%);Aprovado';
 For I:=0 to 365 do
  Linha:=Linha+';'+FormatDateTime('dd/mmm',StrToDate('01/01/1976')+I);
 S.Add(Linha);
 While not DM.Detalhe.eof do
 begin
  Linha:=DM.DetalheAno.AsString+';'+Format('%3.2n',[DM.DetalheCompletude.Value])+';'+Format('%3.2n',[DM.DetalheAusenciaErros.Value])+';'+DM.DetalheAprovado.AsString;
  While not Chuva.Eof do
  begin
   If (not IsInLeapYear(ChuvaData.Value)) and (DayOfTheYear(ChuvaData.Value)=60) then
    Linha:=Linha+';'
   else
     Linha:=Linha+';'+ChuvaChuva.AsString;
   Chuva.Next;
  end;
  S.Add(Linha);
  DM.Detalhe.Next;
 end;
 Chuva.Close;
 DM.Detalhe.Close;
 Screen.Cursor:=CrDefault;
 SaveDialog1.FileName:=DM.SumarioCodigoEstacao.AsString+'-'+DM.SumarioNomeEstacao.AsString+'-'+DM.SumarioUF.AsString+'.csv';
 If SaveDialog1.Execute then
  S.SaveToFile(ExtractFilePath(SaveDialog1.FileName)+DM.SumarioCodigoEstacao.AsString+'-'+DM.SumarioNomeEstacao.AsString+'-'+DM.SumarioUF.AsString+'.csv');
 S.Free;
end;

end.
