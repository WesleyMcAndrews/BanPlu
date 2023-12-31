unit UFormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DBCtrls, StdCtrls, ExtCtrls, Buttons, OleServer,
  Excel2000, DB;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    UFCombo: TComboBox;
    Label1: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    ExcelApplication1: TExcelApplication;
    BitBtn1: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure UFComboChange(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure UFComboClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExportarParaExcel(DataSet:TDataSet);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

 Uses DataModule, UFormCarregaPLU, UFormDetalheEstacao, UFormAnalisarEstacao,
 UFormRelSumario, UFormExportarChuva, UFormExportarSpring, UFormEditarEstacao;

{$R *.dfm}

procedure TMainForm.ExportarParaExcel(DataSet:TDataSet);
var
   Planilha    : olevariant;
   Lin, Col     : integer;
begin
  ExcelApplication1 := TExcelApplication.Create(nil);
  ExcelApplication1.Workbooks.Add(EmptyParam,0);
  ExcelApplication1.Visible[0] := True;
  Planilha := ExcelApplication1.Workbooks[1].Worksheets[1];
  DataSet.First;
  for Col := 1 to DataSet.FieldCount do
  If DataSet.Fields[Col-1].Visible then
  begin
   Planilha.Cells[1,Col].Select;
   Planilha.Cells[1,Col].Font.Bold := True;
   Planilha.Cells[1,Col].Value := DataSet.Fields[Col-1].DisplayLabel;
  end;
  Lin := 2;
  while not ( DataSet.Eof ) do
  begin
   for Col := 1 to DataSet.FieldCount do
   If DataSet.Fields[Col-1].Visible then
   begin
    Planilha.Cells[Lin,Col].Select;
    try
     Planilha.Cells[Lin,Col].Value := DataSet.Fields[Col-1].Value;
    except
     Planilha.Cells[Lin,Col].Value := DataSet.Fields[Col-1].AsString;
    end;
   end;
   inc(Lin);
   DataSet.Next;
  end;
  Planilha.Columns.AutoFit;
  DataSet.Close;
  ExcelApplication1.Free;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
 With TFormCarregaPLU.create(Self) do
 try
  ShowModal;
 finally
  free;
 end;
 Screen.Cursor:=CrSQLWait;
 DM.Sumario.Close;
 UFCombo.ItemIndex:=-1; 
 Screen.Cursor:=CrDefault;
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
begin
 With TFormDetalheEstacao.Create(Self) do
 try
  ShowModal;
 finally
  free;
 end;
end;

procedure TMainForm.UFComboChange(Sender: TObject);
begin
 Screen.Cursor:=CrSQLWait;
 If UFCombo.Text<>'' then
 With DM.Sumario do
 begin
  Close;
  SQl.Strings[SQl.Count-2]:='Where UF='+QuotedStr(UFCombo.Text);
  Open;
 end;
 SpeedButton2.Enabled:=DM.Sumario.RecordCount>0;
 SpeedButton3.Enabled:=DM.Sumario.RecordCount>0;
 SpeedButton4.Enabled:=DM.Sumario.RecordCount>0;
 SpeedButton6.Enabled:=DM.Sumario.RecordCount>0;
 SpeedButton7.Enabled:=DM.Sumario.RecordCount>0;
 SpeedButton8.Enabled:=DM.Sumario.RecordCount>0;
 SpeedButton9.Enabled:=DM.Sumario.RecordCount>0;
 Screen.Cursor:=CrDefault;
end;

procedure TMainForm.SpeedButton5Click(Sender: TObject);
begin
 Close;
end;

procedure TMainForm.SpeedButton4Click(Sender: TObject);
begin
 With TFormAnalisarEstacao.Create(Self) do
 try
  EstacaoCombo.KeyValue:=DM.SumarioIDEstacao.Value;
  EstacaoCombo.OnClick(Sender);
  ShowModal;
 finally
  free;
 end;
end;

procedure TMainForm.SpeedButton3Click(Sender: TObject);
begin
 If DM.Sumario.RecordCount>0 then
 If MessageDlg('Confirma a exclus�o desta esta��o? Todos os dados pluviom�tricos tamb�m serr�o exclu�dos.',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 With DM.Query1 do
 begin
  DM.ADOConnection1.BeginTrans;
  SQL.Clear;
  SQL.Add('Delete from ClimaDia');
  SQl.Add('Where IDEstacao='+DM.SumarioIDEstacao.AsString);
  try
   ExecSQL;
  except
   DM.ADOConnection1.RollbackTrans;
   MessageDlg('Erro ao tentar excluir dados de chuva. A opera��o foi desfeita.',mtInformation,[mbOk],0);
   Exit;
  end;
  Sql.Clear;
  Sql.Add('Delete From Estacoes');
  SQl.Add('Where IDEstacao='+DM.SumarioIDEstacao.AsString);
  try
   ExecSQL;
  except
   DM.ADOConnection1.RollbackTrans;
   MessageDlg('Erro ao tentar excluir esta��o. A opera��o foi desfeita.',mtInformation,[mbOk],0);
   Exit;
  end;
  DM.ADOConnection1.CommitTrans;
  Screen.Cursor:=CrSQLWait;
  DM.Sumario.Close;
  DM.Sumario.Open;
  Screen.Cursor:=CrDefault;
 end;
end;

procedure TMainForm.SpeedButton6Click(Sender: TObject);
begin
 With TFormRelSumario.Create(Self) do
 try
  QRLabel1.Caption:='Sum�rio das Esta��es    UF:'+UFCombo.Text;
  QuickRep1.Preview;
  If MessageDlg('Deseja exportar o sum�rio para o Excel?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
   ExportarParaExcel(DM.Sumario);
 Finally
  Free;
 end;
end;

procedure TMainForm.SpeedButton7Click(Sender: TObject);
begin
 With TFormExportarChuva.Create(Self) do
 try
  ShowModal;
 finally
  free;
 end;
end;

procedure TMainForm.SpeedButton8Click(Sender: TObject);
begin
 With TFormExportarSpring.Create(Self) do
 try
  ShowModal;
 finally
  free;
 end;
end;

procedure TMainForm.SpeedButton9Click(Sender: TObject);
Var
 i:Integer;
begin
 With TFormEditarEstacao.Create(Self) do
 try
  i := 0;
  while (i < UFsCombo.Items.Count) and (UFsCombo.Items[i] <> DM.SumarioUF.AsString) do
   inc(i);
  UFsCombo.ItemIndex:=i;
  NomeEdit.Text:=DM.SumarioNomeEstacao.AsString;
  LatGEdit.Text:=DM.SumarioLatG.AsString;
  LatMEdit.Text:=DM.SumarioLatM.AsString;
  LatSEdit.Text:=DM.SumarioLatS.AsString;
  LongGEdit.Text:=DM.SumarioLongG.AsString;
  LongMEdit.Text:=DM.SumarioLongM.AsString;
  LongSEdit.Text:=DM.SumarioLongS.AsString;
  AltitudeEdit.Text:=DM.SumarioAltitude.AsString;
  FonteCombo.KeyValue:=DM.SumarioCodigoFonte.value;
  MunicCombo.KeyValue:=DM.SumarioCodigoMunicipio.Value;
  ShowModal;
 finally
  free;
 end;
end;

procedure TMainForm.BitBtn1Click(Sender: TObject);
var
   Planilha    : olevariant;
   Lin, Col, I     : integer;
begin
  ExcelApplication1 := TExcelApplication.Create(nil);
  ExcelApplication1.Workbooks.Add(EmptyParam,0);
  ExcelApplication1.Visible[0] := True;
  Planilha := ExcelApplication1.Workbooks[1].Worksheets[1];
  Lin:=1;
  For I:=0 to UFCombo.Items.Count-1 do
  begin
   UFCombo.ItemIndex:=I;
   UFCombo.OnChange(Sender);
   DM.Sumario.First;
   for Col := 1 to DM.Sumario.FieldCount do
   If DM.Sumario.Fields[Col-1].Visible then
   begin
    Planilha.Cells[Lin,Col].Select;
    Planilha.Cells[Lin,Col].Font.Bold := True;
    Planilha.Cells[Lin,Col].Value := DM.Sumario.Fields[Col-1].DisplayLabel;
   end;
   inc(Lin);
   while not ( DM.Sumario.Eof ) do
   begin
    for Col := 1 to DM.Sumario.FieldCount do
    If DM.Sumario.Fields[Col-1].Visible then
    begin
     Planilha.Cells[Lin,Col].Select;
     try
      Planilha.Cells[Lin,Col].Value := DM.Sumario.Fields[Col-1].Value;
     except
      Planilha.Cells[Lin,Col].Value := DM.Sumario.Fields[Col-1].AsString;
     end;
    end;
    inc(Lin);
    DM.Sumario.Next;
   end;
  end;
  Planilha.Columns.AutoFit;
  DM.Sumario.Close;
  ExcelApplication1.Free;
end;

procedure TMainForm.UFComboClick(Sender: TObject);
begin
 DBGrid1.SetFocus;
end;

end.
