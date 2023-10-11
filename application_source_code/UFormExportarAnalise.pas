unit UFormExportarAnalise;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, OleServer, Excel2000, Word2000,
  Grids;

type
  TFormExportarAnalise = class(TForm)
    GroupBox1: TGroupBox;
    XLSRadio: TRadioButton;
    DOCRadio: TRadioButton;
    ExcelApplication1: TExcelApplication;
    SaveDialog1: TSaveDialog;
    Chuva: TADOQuery;
    ChuvaData: TDateTimeField;
    ChuvaChuva: TFloatField;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    WordFont: TWordFont;
    WordDocument: TWordDocument;
    WordApplication: TWordApplication;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ExportarXLS;
    procedure ExportarDOC;
  public
    { Public declarations }
  end;

var
  FormExportarAnalise: TFormExportarAnalise;

implementation

 Uses DataModule, UFormAnalisarEstacao;

{$R *.dfm}

procedure TFormExportarAnalise.ExportarXLS;
var
 Planilha: olevariant;
 Lin,Col: integer;

   Procedure IncluirGrid(Grid:TStringGrid);
   var
    L,C:Integer;
   begin
    For L:=0 to Grid.RowCount-1 do
    begin
     For C:=0 to Grid.ColCount-1 do
     begin
      Planilha.Cells[Lin+L,C+1].Select;
      Planilha.Cells[Lin+L,C+1].Value:=Grid.Cells[C,L];
     end;
    end;
    Lin:=Lin+L;
   end;

begin
 //try
  ExcelApplication1 := TExcelApplication.Create(nil);
  ExcelApplication1.Workbooks.Add(EmptyParam,0);
  ExcelApplication1.Visible[0] := True;
  Planilha := ExcelApplication1.Workbooks[1].Worksheets[1];
  {Sumário
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
  end;}
  Lin:=4;
  IncluirGrid(FormAnalisarEstacao.GridT);
  IncluirGrid(FormAnalisarEstacao.GridV);
  IncluirGrid(FormAnalisarEstacao.GridC);

  ExcelApplication1.Free;
 {except
  MessageDlg('Feche o Excel e tente novamente.',mtInformation,[mbOk],0);
 end;}
end;

procedure TFormExportarAnalise.ExportarDOC;
Begin
end;

procedure TFormExportarAnalise.BitBtn1Click(Sender: TObject);
begin
 If XLSRadio.Checked then
  ExportarXLS
 else If DOCRadio.Checked then
  ExportarDoc;
end;

end.
