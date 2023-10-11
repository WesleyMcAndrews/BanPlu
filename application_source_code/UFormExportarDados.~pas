unit UFormExportarDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Word2000, OleServer, Excel2000, DB, ADODB;

type
  TFormExportarDados = class(TForm)
    GroupBox1: TGroupBox;
    DocRadio: TRadioButton;
    XMLRadio: TRadioButton;
    PDFRadio: TRadioButton;
    XLSRadio: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SaveDialog1: TSaveDialog;
    WordFont: TWordFont;
    WordDocument: TWordDocument;
    WordApplication: TWordApplication;
    ExcelApplication1: TExcelApplication;
    CSVRadio: TRadioButton;
    Periodos: TADOQuery;
    PeriodosSafra: TWideStringField;
    PeriodosUF: TWideStringField;
    PeriodosMunic: TIntegerField;
    PeriodosCultura: TIntegerField;
    PeriodosCiclo: TIntegerField;
    PeriodosSolo: TIntegerField;
    PeriodosDecendioIni: TIntegerField;
    PeriodosDecendioFim: TIntegerField;
    PeriodosRegiao: TIntegerField;
    PeriodosAltitude: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ExportarDOC;
    procedure ExportarPDF;
    procedure ExportarXLS;
    procedure ExportarXML;
    procedure ExportarCSV;
  public
    { Public declarations }
  end;

var
  FormExportarDados: TFormExportarDados;

implementation

 Uses DataModule;

{$R *.dfm}

procedure TFormExportarDados.BitBtn1Click(Sender: TObject);
begin
 If DocRadio.Checked then
  ExportarDOC
 else If PDFRadio.Checked then
  ExportarPDF
 else If XLSRadio.Checked then
  ExportarXLS
 else If XMLRadio.Checked then
  ExportarXML
 else If CSVRadio.Checked then
  ExportarCSV;
end;

procedure TFormExportarDados.ExportarDOC;
var
 Template, NewTemplate, TrueTemplate, FalseTemplate, ItemIndex, FileName:OleVariant;
 ATabela:Table;
 ExisteNotaTecnica:Boolean;
 Lin,Col:Integer;
begin
 try
  Template := EmptyParam;
  NewTemplate := True;
  TrueTemplate := True;
  FalseTemplate:=False;
  FileName := ExtractFilePath(ParamStr(0))+'NotasTecnicas\'+DM.IndiceNomeArquivo.AsString+'.DOC';
  ItemIndex := 1;
  //Se existe Nota Técnica
  ExisteNotaTecnica:=FileExists(FileName);
  //Inicial Word
  try
   Wordapplication.Connect;
  except
   MessageDlg('MS-Word não pode ser executado.', mtError, [mbOk], 0);
   Abort;
  end;
  Wordapplication.Visible := True;
  WordApplication.Caption := 'Períodos de Plantio';
  //Create new document
  WordApplication.Documents.Add(Template, NewTemplate,EmptyParam,TrueTemplate);
  //Assign WordDocument component
  WordDocument.ConnectTo(WordApplication.Documents.Item(ItemIndex));
  //Turn Spell checking of because it takes a long time if enabled and slows down Winword
  WordApplication.Options.CheckSpellingAsYouType := False;
  WordApplication.Options.CheckGrammarAsYouType := False;
  //Se Existir uma nota tecnica...
  If ExisteNotaTecnica then
   WordDocument.Range.InsertFile(FileName,EmptyParam,EmptyParam,EmptyParam,EmptyParam);
  //Tabela do índice dos períodos
  WordDocument.Range.Paragraphs.Last.Range.Paragraphs.Alignment:=1;
  WordDocument.Range.Paragraphs.Last.Range.Bold:=1;
  WordDocument.Range.InsertAfter(''+#13+#13);
  WordDocument.Range.InsertAfter('PERÍODOS FAVORÁVEIS DE PLANTIO'+#13+#13);
  WordDocument.Range.Paragraphs.Last.Range.Paragraphs.Alignment:=0;
  WordDocument.Range.Paragraphs.Last.Range.Bold:=0;
  ATabela:=WordDocument.Tables.Add(WordDocument.Paragraphs.Last.Range,3,DM.Decendios.RecordCount+1,EmptyParam,EmptyParam);
  ATabela.Borders.Enable:=1;
  Atabela.Cell(1,1).Range.InsertAfter('Periodos');Atabela.Cell(1,1).Range.Paragraphs.Alignment:=0;
  Atabela.Cell(2,1).Range.InsertAfter('Dias');Atabela.Cell(2,1).Range.Paragraphs.Alignment:=0;
  Atabela.Cell(3,1).Range.InsertAfter('Meses');Atabela.Cell(3,1).Range.Paragraphs.Alignment:=0;
  Col:=2;
  While not DM.Decendios.Eof Do
  begin
   Atabela.Cell(1,Col).Range.InsertAfter(DM.DecendiosDecendio.AsString);Atabela.Cell(1,Col).Range.Paragraphs.Alignment:=1;
   Atabela.Cell(2,Col).Range.InsertAfter(DM.DecendiosData.AsString);Atabela.Cell(2,Col).Range.Paragraphs.Alignment:=1;
   Atabela.Cell(3,Col).Range.InsertAfter(DM.DecendiosMes.AsString);Atabela.Cell(3,Col).Range.Paragraphs.Alignment:=1;
   DM.Decendios.Next;
   Inc(Col);
  end;
  Atabela.AutoFitBehavior(1);
  WordDocument.Range.Paragraphs.Last.Range.Paragraphs.Alignment:=1;
  WordDocument.Range.Paragraphs.Last.Range.Bold:=1;
  WordDocument.Range.InsertAfter(''+#13+#13);
  WordDocument.Range.InsertAfter('MUNICÍPIOS E PERÍODOS FAVORÁVEIS DE PLANTIO'+#13+#13);
  WordDocument.Range.Paragraphs.Last.Range.Paragraphs.Alignment:=0;
  WordDocument.Range.Paragraphs.Last.Range.Bold:=0;
  //Tabela de Municípios e Períodos
  ATabela:=WordDocument.Tables.Add(WordDocument.Paragraphs.Last.Range,DM.Portarias.RecordCount+1,4,EmptyParam,EmptyParam);
  ATabela.Borders.Enable:=1;
  Atabela.Cell(1,1).Range.InsertAfter('Município');Atabela.Cell(1,1).Range.Paragraphs.Alignment:=1;
  Atabela.Cell(1,2).Range.InsertAfter('Solo Tipo 1');Atabela.Cell(1,2).Range.Paragraphs.Alignment:=1;
  Atabela.Cell(1,3).Range.InsertAfter('Solo Tipo 2');Atabela.Cell(1,3).Range.Paragraphs.Alignment:=1;
  Atabela.Cell(1,4).Range.InsertAfter('Solo Tipo 3');Atabela.Cell(1,4).Range.Paragraphs.Alignment:=1;
  Lin:=2;
  While not DM.Portarias.Eof Do
  begin
   Atabela.Cell(Lin,1).Range.InsertAfter(DM.PortariasMunicipio.AsString);Atabela.Cell(Lin,1).Range.Paragraphs.Alignment:=0;
   Atabela.Cell(Lin,2).Range.InsertAfter(DM.PortariasPeriodoT1.AsString);Atabela.Cell(Lin,2).Range.Paragraphs.Alignment:=1;
   Atabela.Cell(Lin,3).Range.InsertAfter(DM.PortariasPeriodoT2.AsString);Atabela.Cell(Lin,3).Range.Paragraphs.Alignment:=1;
   Atabela.Cell(Lin,4).Range.InsertAfter(DM.PortariasPeriodoT3.AsString);Atabela.Cell(Lin,4).Range.Paragraphs.Alignment:=1;
   DM.Portarias.Next;
   Inc(Lin);
  end;
  Atabela.AutoFitBehavior(1);
  //WordDocument.SendMail;
 Finally
  WordApplication.Disconnect;
 end;
end;

procedure TFormExportarDados.ExportarPDF;
begin
end;

procedure TFormExportarDados.ExportarXLS;
var
   Planilha    : olevariant;
   Lin, Col     : integer;
begin
 try
  ExcelApplication1 := TExcelApplication.Create(nil);
  ExcelApplication1.Workbooks.Add(EmptyParam,0);
  ExcelApplication1.Visible[0] := True;
  Planilha := ExcelApplication1.Workbooks[1].Worksheets[1];
  Planilha.Cells[1,1].Select;Planilha.Cells[1,1].Value:=DM.IndiceSafra.AsString;
  Planilha.Cells[1,1].Select;Planilha.Cells[2,1].Value:=DM.IndiceUF_Nome.AsString;
  Planilha.Cells[1,1].Select;Planilha.Cells[3,1].Value:=DM.IndicetbCultura_Nome.AsString;
  Planilha.Cells[1,1].Select;Planilha.Cells[4,1].Value:=DM.IndicetbCiclo_Nome.AsString;
  Planilha.Cells[1,1].Select;Planilha.Cells[5,1].Value:='MUNICÍPIOS E PERÍODOS FAVORÁVEIS DE PLANTIO'; Planilha.Cells[5,1].Font.Bold := True;
  Lin:=6;
  DM.Portarias.First;
  for Col := 1 to DM.Portarias.FieldCount do
  If DM.Portarias.Fields[Col-1].Visible then
  begin
   Planilha.Cells[Lin,Col].Select;
   Planilha.Cells[Lin,Col].Font.Bold := True;
   Planilha.Cells[Lin,Col].Value := DM.Portarias.Fields[Col-1].DisplayLabel;
  end;
  Inc(Lin);
  while not ( DM.Portarias.Eof ) do
  begin
   for Col := 1 to DM.Portarias.FieldCount do
   If DM.Portarias.Fields[Col-1].Visible then
   begin
    Planilha.Cells[Lin,Col].Select;
    Planilha.Cells[Lin,Col].Value := DM.Portarias.Fields[Col-1].AsString;
   end;
   inc(Lin);
   DM.Portarias.Next;
  end;
  ExcelApplication1.Free;
 except
  MessageDlg('Feche o Excel e tente novamente.',mtInformation,[mbOk],0);
 end;
end;


procedure TFormExportarDados.ExportarXML;
var
 S:TStringList;
Function Tag(tag,S:String):String;
begin
  Result:='<'+LowerCase(Tag)+'>'+S+'</'+LowerCase(Tag)+'>';
end;
begin
 S:=TStringList.Create;
 DM.Portarias.First;
 //Cabeçalho
 S.Add('<?xml version="1.0" encoding="UTF-8"?>');
 S.Add('<zoneamento>');
 S.Add('<portaria>');
 S.Add(Tag('Safra',DM.IndiceSafra.AsString));
 S.Add(Tag('UF',DM.IndiceUF.AsString));
 S.Add(Tag('UF_Nome',DM.IndiceUF_Nome.AsString));
 S.Add(Tag('Cultura',DM.IndiceCultura.AsString));
 S.Add(Tag('Nome_Cultura',DM.IndicetbCultura_Nome.AsString));
 S.Add(Tag('Ciclo',DM.IndiceCiclo.AsString));
 S.Add(Tag('Nome_Ciclo',DM.IndicetbCiclo_Nome.AsString));
 S.Add('<periodos>');
 While not DM.Portarias.eof do
 begin
  S.Add('<municipio>');
  S.Add(Tag('Municipio',DM.PortariasMunic.AsString));
  S.Add(Tag('Nome_Municipio',DM.PortariastbMunic_Nome.AsString));
  S.Add(Tag('Regiao',DM.PortariasRegiao.AsString));
  S.Add(Tag('Nome_Regiao',DM.PortariastbRegioes_Regiao.AsString));
  S.Add(Tag('Altitude',DM.PortariasAltitude.AsString));
  S.Add(Tag('Nome_Altitude',DM.PortariastbAltitude_faixa.AsString));
  S.Add('<solo_tipo_1>');
  S.Add(Tag('Decendio_Inicial',DM.PortariasDecendioIniT1.AsString));
  S.Add(Tag('Decendio_Final',DM.PortariasDecendioFimT1.AsString));
  S.Add('</solo_tipo_1>');
  S.Add('<solo_tipo_2>');
  S.Add(Tag('Decendio_Inicial',DM.PortariasDecendioIniT2.AsString));
  S.Add(Tag('Decendio_Final',DM.PortariasDecendioFimT2.AsString));
  S.Add('</solo_tipo_2>');
  S.Add('<solo_tipo_3>');
  S.Add(Tag('Decendio_Inicial',DM.PortariasDecendioIniT3.AsString));
  S.Add(Tag('Decendio_Final',DM.PortariasDecendioFimT3.AsString));
  S.Add('</solo_tipo_3>');
  S.Add('</municipio>');
  DM.Portarias.Next;
 end;
 S.Add('</periodos>');
 S.Add('</portaria>');
 S.Add('</zoneamento>');
 SaveDialog1.FileName:=DM.IndiceNomeArquivo.AsString+'.xml';
 If SaveDialog1.Execute then
  S.SaveToFile(ExtractFilePath(SaveDialog1.FileName)+DM.IndiceNomeArquivo.AsString+'.xml');
 S.Free;
end;

procedure TFormExportarDados.ExportarCSV;
Var
 S:TStringList;
 I:Integer;
 Linha:String;
begin
 S:=TStringList.Create;
 Periodos.Open;
 //Cabecalho
 For I:=0 to Periodos.FieldCount-1 do
 begin
  Linha:=Linha+Periodos.Fields[I].FieldName;
  If I<>Periodos.FieldCount-1 then
   Linha:=Linha+',';
 end;
 S.Add(Linha);
 Linha:='';
 //Dados
 While not Periodos.Eof do
 begin
  For I:=0 to Periodos.FieldCount-1 do
  begin
   If Periodos.fields[I] is TWideStringField then
    Linha:=Linha+QuotedStr(Periodos.Fields[I].AsString)
   else
    Linha:=Linha+Periodos.Fields[I].AsString;
   If I<>Periodos.FieldCount-1 then
    Linha:=Linha+',';
  end;
  S.Add(Linha);
  Linha:='';
  Periodos.Next;
 end;
 Periodos.Close;
 SaveDialog1.FileName:=DM.IndiceNomeArquivo.AsString+'.csv';
 If SaveDialog1.Execute then
  S.SaveToFile(ExtractFilePath(SaveDialog1.FileName)+DM.IndiceNomeArquivo.AsString+'.csv');
 S.Free;
end;

end.
