unit UFormAnalisarEstacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Spin, StdCtrls, ExtCtrls, Grids, Menus, DBCtrls, Buttons, Math,
  ComCtrls, TeEngine, Series, TeeProcs, Chart, Mask, DateUtils, DBGrids,
  Word2000, OleServer, Excel2000, Variants;

type
  TFormAnalisarEstacao = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    EstacaoCombo: TDBLookupComboBox;
    CalcularBtn: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GridV: TStringGrid;
    TabSheet3: TTabSheet;
    GridT: TStringGrid;
    GridC: TStringGrid;
    TabSheet4: TTabSheet;
    Chart1: TChart;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    ChuvaEdit: TEdit;
    MensalRadio: TRadioButton;
    QuinzenalRadio: TRadioButton;
    DecendialRadio: TRadioButton;
    PentadalRadio: TRadioButton;
    AnualRadio: TRadioButton;
    Label2: TLabel;
    VariavelCombo: TComboBox;
    Label5: TLabel;
    AnoCombo: TComboBox;
    SpeedButton2: TSpeedButton;
    ThreeDCheck: TCheckBox;
    Series2: TBarSeries;
    BarrasChk: TRadioButton;
    LinhasChk: TRadioButton;
    Series1: TLineSeries;
    GroupBox1: TGroupBox;
    XLSRadio: TRadioButton;
    DOCRadio: TRadioButton;
    ExportarBtn: TSpeedButton;
    ExcelApplication1: TExcelApplication;
    SaveDialog1: TSaveDialog;
    WordFont: TWordFont;
    WordDocument: TWordDocument;
    WordApplication: TWordApplication;
    Series3: TLineSeries;
    Series4: TLineSeries;
    procedure CalcularBtnClick(Sender: TObject);
    procedure EstacaoComboClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure GridVDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure AnualRadioClick(Sender: TObject);
    procedure AnoComboChange(Sender: TObject);
    procedure ChuvaEditKeyPress(Sender: TObject; var Key: Char);
    procedure VariavelComboClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ThreeDCheckClick(Sender: TObject);
    procedure BarrasChkClick(Sender: TObject);
    procedure ExportarBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure EscreveVeranicos(Dias:Integer);
    procedure EscreveChuva(Dias:Integer);
    procedure GerarGrafico(Grid:TStringGrid;ACol:Integer;Titulo:String);
    procedure GerarGraficoAnalise(Grid:TStringGrid;ACol:Integer;Titulo:String);
    procedure GridAlignment(Grid: TStringGrid; Rect: TRect; ACol, ARow: Integer;Alignment: TAlignment; LineBreak: Boolean);
    procedure DrawReticle(Grid: TStringGrid; ACol, ARow: Integer; Rect: TRect;ReticleFontColor, ReticleBackColor,GridFontColor, GridBackColor,SelFontColor, SelBackColor: TColor);
    procedure CriarConsultas;
    procedure ExportarXLS;
    procedure ExportarDOC;
    function Separatriz(Elemento:Integer;Divisoes:Integer):Double;
  public
    { Public declarations }
  end;

var
  FormAnalisarEstacao: TFormAnalisarEstacao;
  L:Integer;

implementation

Uses DataModule;

{$R *.DFM}

Procedure TFormAnalisarEstacao.CriarConsultas;
begin
 If AnualRadio.Checked then
 With DM.Periodos do
 begin
  SQl.Clear;
  Sql.Add('Select Distinct Year(C.Data) as Ordem, 01 as DiaIni, 01 as MesIni, 31 as DiaFim, 12 as MesFim, 1 as Freq');
  Sql.Add('FROM ClimaDia C');
  Sql.Add('Where C.IDEstacao='+IntToStr(EstacaoCombo.KeyValue));
  Sql.Add('Order by Year(C.Data)');
  Filter:='Anual';
  DM.Analise.SQL.Strings[2]:='where Year(C.Data)=:Ordem';
  DM.Separatrizes.SQL.Strings[2]:='where (Day(C.Data) between :DiaIni and :DiaFim and Month(C.Data)>=:MesIni)';
 end;
 If MensalRadio.Checked then
 With DM.Periodos do
 begin
  SQl.Clear;
  Sql.Add('Select D.MesIni as Ordem, Min(D.DiaIni) as DiaIni, D.MesIni, Max(D.DiaFim) as DiaFim, D.MesIni as MesFim, 12 as Freq');
  Sql.Add('FROM Decendios D');
  Sql.Add('group by D.MesIni, D.Mes');
  SQl.Add('Order by D.MesIni');
  Filter:='Mensal';
  DM.Analise.SQL.Strings[2]:='where C.Data between Ltrim(Str(:MesIni))+''/''+Ltrim(Str(:DiaIni))+''/''+Ltrim(Str(Year(C.Data))) and Ltrim(Str(:MesFim))+''/''+Ltrim(Str(:DiaFim))+''/''+Ltrim(Str(Year(C.Data)))';
  DM.Separatrizes.SQL.Strings[2]:='where (Day(C.Data) between :DiaIni and :DiaFim and Month(C.Data)=:MesIni)';
 end;
 If QuinzenalRadio.Checked then
 With DM.Periodos do
 begin
  SQl.Clear;
  Sql.Add('Select Q.Ordem, Q.DiaIni, Q.MesIni, Q.DiaFim, Q.MesFim, 24 as Freq');
  Sql.Add('FROM Quinzenas Q');
  Sql.Add('Order by Q.Ordem');
  Filter:='Quinzenal';
  DM.Analise.SQL.Strings[2]:='where C.Data between Ltrim(Str(:MesIni))+''/''+Ltrim(Str(:DiaIni))+''/''+Ltrim(Str(Year(C.Data))) and Ltrim(Str(:MesFim))+''/''+Ltrim(Str(:DiaFim))+''/''+Ltrim(Str(Year(C.Data)))';
  DM.Separatrizes.SQL.Strings[2]:='where (Day(C.Data) between :DiaIni and :DiaFim and Month(C.Data)=:MesIni)';
 end;
 If DecendialRadio.Checked then
 With DM.Periodos do
 begin
  SQl.Clear;
  Sql.Add('Select D.Ordem, D.DiaIni, D.MesIni, D.DiaFim, D.MesFim, 36 as Freq');
  Sql.Add('FROM Decendios D');
  Sql.Add('Order by D.Ordem');
  Filter:='Decendial';
  DM.Analise.SQL.Strings[2]:='where C.Data between Ltrim(Str(:MesIni))+''/''+Ltrim(Str(:DiaIni))+''/''+Ltrim(Str(Year(C.Data))) and Ltrim(Str(:MesFim))+''/''+Ltrim(Str(:DiaFim))+''/''+Ltrim(Str(Year(C.Data)))';
  DM.Separatrizes.SQL.Strings[2]:='where (Day(C.Data) between :DiaIni and :DiaFim and Month(C.Data)=:MesIni)';
 end;
 If PentadalRadio.Checked then
 With DM.Periodos do
 begin
  SQl.Clear;
  Sql.Add('Select D.Ordem, D.DiaIni, D.MesIni, D.DiaFim, D.MesFim, 73 as Freq');
  Sql.Add('FROM Pentadas D');
  Sql.Add('Order by D.Ordem');
  Filter:='Pentadal';
  DM.Analise.SQL.Strings[2]:='where C.Data between Ltrim(Str(:MesIni))+''/''+Ltrim(Str(:DiaIni))+''/''+Ltrim(Str(Year(C.Data))) and Ltrim(Str(:MesFim))+''/''+Ltrim(Str(:DiaFim))+''/''+Ltrim(Str(Year(C.Data)))';
  DM.Separatrizes.SQL.Strings[2]:='where (Day(C.Data) between :DiaIni and :DiaFim and Month(C.Data)=:MesIni)';
 end;
end;

Procedure TFormAnalisarEstacao.GerarGrafico(Grid:TStringGrid;ACol:Integer;Titulo:String);
var
 I:Integer;
 S:String;
begin
 Series1.Clear;
 Series2.Clear;
 Series3.Clear;
 Series4.Clear;
 Series1.Active:=False;
 Series2.Active:=True;
 Series3.Active:=False;
 Series4.Active:=False;
 For I:=1 to Grid.RowCount-1 do
 Begin
  S:=Grid.Cells[ACol,I];
  //Retirar Caracteres de formata��o
  While (pos('.',S)>0) or (pos('%',S)>0) do
  begin
   S:=Copy(S,1,pos('.',S)-1)+Copy(S,pos('.',S)+1,100);
   If (pos('%',S)>0) then
    S:=Copy(S,1,pos('%',S)-1);
  end;
  Series1.Add(StrToFloatDef(S,0),Grid.Cells[0,I],clGreen);
  Series2.Add(StrToFloatDef(S,0),Grid.Cells[0,I],clGreen);
 end;
 Chart1.Title.Text.Clear;
 Chart1.Title.Text.Add(Titulo);
 Chart1.Title.Text.Add('Per�odo: '+DM.Periodos.Filter);
 Chart1.Repaint;
end;

Procedure TFormAnalisarEstacao.GerarGraficoAnalise(Grid:TStringGrid;ACol:Integer;Titulo:String);
var
 I:Integer;
 S2,S5,S8:String;
begin
 Series1.Clear;
 Series2.Clear;
 Series3.Clear;
 Series4.Clear;
 Series1.Active:=True;
 Series2.Active:=False;
 Series3.Active:=True;
 Series4.Active:=True;
 For I:=1 to Grid.RowCount-1 do
 Begin
  S2:=Grid.Cells[ACol,I];
  S5:=Grid.Cells[ACol+1,I];
  S8:=Grid.Cells[ACol+2,I];
  //Retirar Caracteres de formata��o
  While (pos('.',S2)>0) or (pos('%',S2)>0) do
  begin
   S2:=Copy(S2,1,pos('.',S2)-1)+Copy(S2,pos('.',S2)+1,100);
   If (pos('%',S2)>0) then
    S2:=Copy(S2,1,pos('%',S2)-1);
  end;
  While (pos('.',S5)>0) or (pos('%',S5)>0) do
  begin
   S5:=Copy(S5,1,pos('.',S5)-1)+Copy(S5,pos('.',S5)+1,100);
   If (pos('%',S5)>0) then
    S5:=Copy(S5,1,pos('%',S5)-1);
  end;
  While (pos('.',S8)>0) or (pos('%',S8)>0) do
  begin
   S8:=Copy(S8,1,pos('.',S8)-1)+Copy(S8,pos('.',S8)+1,100);
   If (pos('%',S8)>0) then
    S8:=Copy(S8,1,pos('%',S8)-1);
  end;
  Series1.Add(StrToFloatDef(S2,0),Grid.Cells[0,I],clGreen);
  Series3.Add(StrToFloatDef(S5,0),Grid.Cells[0,I],clYellow);
  Series4.Add(StrToFloatDef(S8,0),Grid.Cells[0,I],clRed);
 end;
 Chart1.Title.Text.Clear;
 Chart1.Title.Text.Add(Titulo);
 Chart1.Title.Text.Add('Per�odo: '+DM.Periodos.Filter);
 Chart1.Repaint;
end;

Procedure TFormAnalisarEstacao.EscreveVeranicos(Dias:Integer);
begin
 If Dias=5 then
  {5}GridV.Cells[1,L]:=Format('%0.2d',[StrToIntDef(GridV.Cells[1,L],0)+1])
 else if Dias in [6..10] then
  {6 a 10}GridV.Cells[2,L]:=Format('%0.2d',[StrToIntDef(GridV.Cells[2,L],0)+1])
 else if Dias in [11..15] then
  {11 a 15}GridV.Cells[3,L]:=Format('%0.2d',[StrToIntDef(GridV.Cells[3,L],0)+1])
 else if Dias in [16..20] then
  {16 a 20}GridV.Cells[4,L]:=Format('%0.2d',[StrToIntDef(GridV.Cells[4,L],0)+1])
 else if Dias in [21..25] then
  {21 a 25}GridV.Cells[5,L]:=Format('%0.2d',[StrToIntDef(GridV.Cells[5,L],0)+1])
 else if Dias in [26..30] then
  {26 a 30}GridV.Cells[6,L]:=Format('%0.2d',[StrToIntDef(GridV.Cells[6,L],0)+1])
 else if Dias in [31..35] then
  {31 a 35}GridV.Cells[7,L]:=Format('%0.2d',[StrToIntDef(GridV.Cells[7,L],0)+1])
 else if Dias in [36..40] then
  {36 a 40}GridV.Cells[8,L]:=Format('%0.2d',[StrToIntDef(GridV.Cells[8,L],0)+1])
 else if Dias in [41..45] then
  {41 a 45}GridV.Cells[9,L]:=Format('%0.2d',[StrToIntDef(GridV.Cells[9,L],0)+1])
 else if Dias>45 then
  {+45}GridV.Cells[10,L]:=Format('%0.2d',[StrToIntDef(GridV.Cells[10,L],0)+1]);
end;

Procedure TFormAnalisarEstacao.EscreveChuva(Dias:Integer);
begin
 If Dias in [1..10] then
  {1 a 10}GridC.Cells[Dias,L]:=Format('%0.2d',[StrToIntDef(GridC.Cells[Dias,L],0)+1])
 else if Dias>10 then
  {+10}GridC.Cells[11,L]:=Format('%0.2d',[StrToIntDef(GridC.Cells[11,L],0)+1]);
end;

procedure TFormAnalisarEstacao.CalcularBtnClick(Sender: TObject);
Var
 I,J,K,DiasVeranico,DiasChuva,DiasChuvosos,UltimoAno:Integer;
 S1,S2,MaiorChuva,TotalChuvas,ChuvaAnual:Real;
 DataMaiorChuva:TDateTime;
 Dados:Array of Double;
begin
 Screen.Cursor:=CrHourGlass;
 L:=1;
 //LimparGrids
 For J:=1 To GridT.RowCount-1 do
 begin
  For I:=1 To GridT.ColCount-1 do
   GridT.Cells[I,J]:='';
  For I:=1 To GridV.ColCount-1 do
   GridV.Cells[I,J]:='';
  For I:=1 To GridC.ColCount-1 do
   GridC.Cells[I,J]:='';
 end;
 try
  CriarConsultas;
  DM.Periodos.Open;
  If (AnoCombo.Enabled) and (AnoCombo.Text<>'Todos') then
   DM.Analise.SQl.Strings[3]:='And C.IDEstacao='+IntToStr(EstacaoCombo.KeyValue)+' And Year(C.Data)='+AnoCombo.Text
  else
   DM.Analise.SQl.Strings[3]:='And C.IDEstacao='+IntToStr(EstacaoCombo.KeyValue);
  DM.Analise.Open;
  //Separatrizes
  With DM.Separatrizes do
  begin
   SQL.Strings[3]:='And C.IDEstacao='+IntToStr(EstacaoCombo.KeyValue);
   SQL.Strings[4]:='And C.Chuva>'+ChuvaEdit.Text;
   //SQl.SaveToFile('C:\sql.txt');
   Open;
  end;
  If not DM.Analise.RecordCount>0 then
  begin
   MessageDlg('N�o h� dados para esta esta��o.',mtInformation,[mbOk],0);
   exit;
  end;
  While not DM.Periodos.eof do
  begin
   GridV.RowCount:=L+1;
   GridC.RowCount:=L+1;
   GridT.RowCount:=L+1;
   GridV.Cells[0,L]:=DM.PeriodosRotulo.AsString;
   GridC.Cells[0,L]:=DM.PeriodosRotulo.AsString;
   GridT.Cells[0,L]:=DM.PeriodosRotulo.AsString;
   DiasVeranico:=0;
   DiasChuva:=0;
   UltimoAno:=DM.AnaliseAno.Value;
   TotalChuvas:=0;
   DiasChuvosos:=0;
   MaiorChuva:=0;
   K:=0;
   SetLength(Dados,DM.SumarioAnos.Value);
   While not DM.Analise.Eof do
   begin
    Application.ProcessMessages;
    //Se for um novo ano
    If DM.AnaliseAno.Value<>UltimoAno then
    begin
     //Escreve os resultados e zera os contadores
     EscreveVeranicos(DiasVeranico);
     EscreveChuva(DiasChuva);
     Dados[K]:=ChuvaAnual;
     Inc(K);
     DiasVeranico:=0;
     DiasChuva:=0;
     ChuvaAnual:=0;
     UltimoAno:=DM.AnaliseAno.Value;
    end;
    //Veranicos
    If DM.AnaliseChuva.Value<=StrToFloatDef(ChuvaEdit.Text,1) then
     Inc(DiasVeranico)
    else
    begin
     EscreveVeranicos(DiasVeranico);
     DiasVeranico:=0;
    end;
    //Chuvas
    If DM.AnaliseChuva.Value>StrToFloatDef(ChuvaEdit.Text,1) then
    begin
     Inc(DiasChuva);
     Inc(DiasChuvosos);
     ChuvaAnual:=ChuvaAnual+DM.AnaliseChuva.Value;
     TotalChuvas:=TotalChuvas+DM.AnaliseChuva.Value;
     If DM.AnaliseChuva.Value>MaiorChuva then
     begin
      MaiorChuva:=DM.AnaliseChuva.Value;
      DataMaiorChuva:=DM.AnaliseData.AsDateTime;
     end;
    end
    else
    begin
     EscreveChuva(DiasChuva);
     DiasChuva:=0;
    end;
    DM.Analise.Next;
   end;
   //Escrever os �ltimos Dados
   EscreveVeranicos(DiasVeranico);
   EscreveChuva(DiasChuva);
   Dados[K]:=ChuvaAnual;
   //escrever Totaliza��o
   With GridT do
   begin
    Cells[1,L]:=Format('%0.3d',[DiasChuvosos]);
    Cells[2,L]:=Format('%3.2n',[MaiorChuva]);
    Cells[3,L]:=DateToStr(DataMaiorChuva);
    If DiasChuvosos>0 then
     Cells[4,L]:=Format('%3.2n',[TotalChuvas/DM.SumarioAnos.Value])
    else
     Cells[4,L]:='0,00';
    Cells[5,L]:=Format('%3.2n',[TotalChuvas]);
    If not AnualRadio.Checked then
    begin
     Cells[6,L]:=Format('%3.2n',[Variance(Dados)]);
     Cells[7,L]:=Format('%3.2n',[PopnStdDev(Dados)]);
     If Mean(Dados)<>0 then
      Cells[8,L]:=Format('%3.2n',[(StdDev(Dados)/Mean(Dados))*100])+'%'
     else
      Cells[8,L]:='0,00%';
    end;
    //Separatrizes
    Cells[10,L]:=Format('%3.2n',[Separatriz(2,10)]);
    Cells[11,L]:=Format('%3.2n',[Separatriz(5,10)]);
    Cells[12,L]:=Format('%3.2n',[Separatriz(8,10)]);
    If AnualRadio.Checked then
    begin
     If TotalChuvas/DM.SumarioAnos.Value<=(Separatriz(2,10)/DM.SumarioAnos.Value) then
      Cells[09,L]:='SECO'
     else If TotalChuvas/DM.SumarioAnos.Value>=(Separatriz(8,10)/DM.SumarioAnos.Value) then
      Cells[09,L]:='CHUVOSO'
     else
      Cells[09,L]:='NORMAL';
    end;
   end;
   //Calcular a freq��ncia
   For I:=1 to GridV.ColCount-1 do
   If GridV.Cells[I,L]<>'' then
    GridV.Cells[I,L]:=GridV.Cells[I,L]+'-'+Format('%0.2d',[Round((StrToInt(GridV.Cells[I,L])*100)/IfThen(DM.SumarioAnos.Value<StrToInt(GridV.Cells[I,L]),StrToInt(GridV.Cells[I,L]),DM.SumarioAnos.Value))])+'%';
   DM.Periodos.Next;
   Inc(L);
  end;//DM.Periodos.EOF
  CalcularBtn.Enabled:=false;
  ExportarBtn.Enabled:=True;
  VariavelCombo.ItemIndex:=0;
  //GerarGraficoAnalise(GridT,10,'An�lise Frequ�ncial da Chuva - 2o, 5o e 8o Decis');
  GerarGrafico(GridT,4,'Chuva M�dia');
  MessageDlg('An�lise completada com sucesso!',mtInformation,[mbOk],0);
 except
  MessageDlg('H� um erro no arquivo de chuva. Verifique.',mtError,[mbOk],0);
 end;
 DM.Analise.Close;
 DM.Periodos.Close;
 Screen.Cursor:=CrDefault;
end;

function TFormAnalisarEstacao.Separatriz(Elemento:Integer;Divisoes:Integer):Double;
var
 I,Media:Double;
begin
 DM.Separatrizes.First;
 I:=(Elemento*DM.Separatrizes.RecordCount)/Divisoes;
 If I=Int(I) then //Se for inteiro
 begin
  DM.Separatrizes.MoveBy(Trunc(I)-1);
  Result:=DM.SeparatrizesChuva.Value;
 end
 else
 begin
  DM.Separatrizes.MoveBy(Trunc(I)-1);
  Media:=DM.SeparatrizesChuva.Value;
  DM.Separatrizes.Next;
  Media:=(Media+DM.SeparatrizesChuva.Value)/2;
  Result:=Media;
 end;
 //ShowMessage(FloatToStr(I)+'/'+IntToStr(DM.Separatrizes.RecordCount));
end;

procedure TFormAnalisarEstacao.EstacaoComboClick(Sender: TObject);
begin
 CalcularBtn.Enabled:=(EstacaoCombo.Text<>'');
 With DM.Query1 do
 Begin
  SQl.Clear;
  Sql.Add('Select Distinct Year(Data) as Ano from ClimaDia');
  Sql.Add('Where IDEstacao='+IntToStr(EstacaoCombo.KeyValue));
  SQl.Add('Order by 1');
  Open;
  AnoCombo.Items.Clear;
  AnoCombo.Items.Add('Todos');
  While not eof do
  begin
   AnoCombo.Items.Add(FieldByName('Ano').AsString);
   Next;
  end;
  Close;
  AnoCombo.ItemIndex:=0;
 end;
end;

procedure TFormAnalisarEstacao.SpeedButton1Click(Sender: TObject);
begin
 Close;
end;

procedure TFormAnalisarEstacao.GridVDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
 //DrawReticle(Sender as TStringGrid, ACol, ARow, Rect, clWindow, clNavy, clWindowText, clInfoBk, clWindowText, clWindow);
end;

procedure TFormAnalisarEstacao.FormCreate(Sender: TObject);
 Var
  I:Byte;
begin
 With GridV do
 begin
  Cells[0,0]:='Per�odo';
  Cells[1,0]:='5 Dias';
  For I:=2 to 9 do
   Cells[I,0]:=IntToStr(I*5-4)+' a '+IntToStr(I*5);
  Cells[10,0]:='+45 Dias';
  ColWidths[0]:=60;
 end;
 With GridC do
 begin
  Cells[0,0]:='Per�odo';
  For I:=1 to 10 do
   Cells[I,0]:=IntToStr(I)+' D';
  Cells[11,0]:='+10 D';
  ColWidths[0]:=60;
 end;
 With GridT do
 begin
  Cells[00,0]:='Per�odo';
  Cells[01,0]:='Dias Chuvosos';
  Cells[02,0]:='Maior Chuva';
  Cells[03,0]:='Data';
  Cells[04,0]:='M�dia';
  Cells[05,0]:='Total';
  Cells[06,0]:='Vari�ncia';
  Cells[07,0]:='Desvio Padr.';
  Cells[08,0]:='Coef. Varia��o';
  Cells[09,0]:='Classif.';
  Cells[10,0]:='2� Decil';
  Cells[11,0]:='5� Decil';
  Cells[12,0]:='8� Decil';
  ColWidths[0]:=60;
 end;
end;

procedure TFormAnalisarEstacao.GridAlignment(Grid: TStringGrid; Rect: TRect; ACol, ARow: Integer;Alignment: TAlignment; LineBreak: Boolean);
var
 TextOut: string;
begin
  Grid.Canvas.FillRect(Rect);
  TextOut := Grid.Cells[ACol, ARow];
  Rect.Right:=Rect.Right-2;
  if LineBreak = False then
  begin
    if Alignment = taLeftJustify then
     DrawText(Grid.Canvas.Handle, PChar(TextOut), StrLen(PChar(TextOut)),Rect, DT_LEFT);
    if Alignment = taCenter then
     DrawText(Grid.Canvas.Handle, PChar(TextOut), StrLen(PChar(TextOut)),Rect, DT_CENTER);
    if Alignment = taRightJustify then
     DrawText(Grid.Canvas.Handle, PChar(TextOut), StrLen(PChar(TextOut)),Rect, DT_RIGHT);
  end
  else
  begin
    if Alignment = taLeftJustify then
     DrawText(Grid.Canvas.Handle, PChar(TextOut), StrLen(PChar(TextOut)),Rect, DT_LEFT or DT_WORDBREAK);
    if Alignment = taCenter then
    DrawText(Grid.Canvas.Handle, PChar(TextOut), StrLen(PChar(TextOut)),Rect, DT_CENTER or DT_WORDBREAK);
    if Alignment = taRightJustify then
    DrawText(Grid.Canvas.Handle, PChar(TextOut), StrLen(PChar(TextOut)),Rect, DT_RIGHT or DT_WORDBREAK);
  end;
end;

procedure TFormAnalisarEstacao.DrawReticle(Grid: TStringGrid; ACol, ARow: Integer; Rect: TRect;ReticleFontColor, ReticleBackColor,GridFontColor, GridBackColor,SelFontColor, SelBackColor: TColor);
begin
  //if (ACol > Grid.FixedCols - 1) and (ARow > Grid.FixedRows - 1) then
  begin
    with Grid do
    begin
      If (ACol=0)or(ARow=0) then
      begin
        Canvas.Font.Style :=[fsBold];
        Canvas.Font.Color := clBlack;
        GridAlignment(Grid, Rect, ACol, ARow, taCenter, False);
        Canvas.FrameRect(Rect);
      end;
      if (ACol>0)and(ARow>0) then
      begin
        Canvas.Font.Color := GridFontColor;
        //Canvas.Brush.Color := GridBackColor;
        GridAlignment(Grid, Rect, ACol, ARow, taCenter, False);
        Canvas.FrameRect(Rect);
      end;
      {if (ACol>0)and(ARow>0)and(StrToFloatDef(Grid.Cells[ACol,ARow],0)>0) then
      begin
        //Canvas.Brush.Color := GridBackColor;
        //Canvas.Font.Style :=[fsBold];
        Canvas.Font.Color := clBlack;
        GridAlignment(Grid, Rect, ACol, ARow, taRightJustify, False);
        Canvas.FrameRect(Rect);
      end;
      if (ARow=0)or(ACol=Grid.ColCount-2) then
      begin
        Canvas.Font.Style :=[fsBold];
        Canvas.Font.Color := clBlack;
        //Canvas.Brush.Color := GridBackColor;
        If (ACol=Grid.ColCount-2)and(ARow<>0) then
         GridAlignment(Grid, Rect, ACol, ARow, taRightJustify, False)
        else
         GridAlignment(Grid, Rect, ACol, ARow, taCenter, False);
        Canvas.FrameRect(Rect);
      end;
      if (ACol>0)and(Grid.Cells[1,ARow]='')and(Grid.Cells[0,ARow]='')then
      begin
        Canvas.Font.Style :=[fsBold];
        Canvas.Font.Color := clBlack;
        Canvas.Brush.Color := clMoneyGreen;
        GridAlignment(Grid, Rect, ACol, ARow, taRightJustify, False);
        Canvas.FrameRect(Rect);
      end;
      if (Grid.Cells[ACol,0]='M�dia')and(ARow>0)and(Grid.Cells[1,ARow]<>'')then
      begin
        Canvas.Font.Color := GridFontColor;
        Canvas.Brush.Color := clSkyBlue;
        GridAlignment(Grid, Rect, ACol, ARow, taRightJustify, False);
        Canvas.FrameRect(Rect);
      end;
      if (Grid.Cells[ACol,ARow]='')and(ACol>0)then
      begin
        Canvas.Font.Style :=[fsBold];
        Canvas.Font.Color := clBlack;
        Canvas.Brush.Color := clMoneyGreen;
        GridAlignment(Grid, Rect, ACol, ARow, taRightJustify, False);
        Canvas.FrameRect(Rect);
      end;}
    end;
  end;
end;

procedure TFormAnalisarEstacao.AnualRadioClick(Sender: TObject);
begin
 CalcularBtn.Enabled:=(EstacaoCombo.Text<>'');
 AnoCombo.Enabled:=Not AnualRadio.Checked;
end;

procedure TFormAnalisarEstacao.AnoComboChange(Sender: TObject);
begin
 CalcularBtn.Enabled:=(EstacaoCombo.Text<>'');
end;

procedure TFormAnalisarEstacao.ChuvaEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 If not (Key in ['0'..'9','.',chr(8),chr(13)]) then
  Key:=#0;
end;

procedure TFormAnalisarEstacao.VariavelComboClick(Sender: TObject);
begin
 If VariavelCombo.Text='Chuva M�dia' then
  GerarGrafico(GridT,4,'Chuva M�dia')
 else If VariavelCombo.Text='Chuva Total' then
  GerarGrafico(GridT,5,'Chuva Total')
 else If VariavelCombo.Text='Desvio Padr�o' then
  GerarGrafico(GridT,7,'Desvio Padr�o')
 else If VariavelCombo.Text='Coeficiente de Varia��o' then
  GerarGrafico(GridT,8,'Coeficiente de Varia��o')
 else If VariavelCombo.Text='An�lise Frequ�ncial' then
  GerarGraficoAnalise(GridT,10,'An�lise Frequ�ncial da Chuva - 2o, 5o e 8o Decis');
end;

procedure TFormAnalisarEstacao.SpeedButton2Click(Sender: TObject);
begin
 Chart1.PrintProportional:=false;
 Chart1.PrintMargins:=Rect(4,4,4,4);
 Chart1.PrintLandscape;
 MessageDlg('Gr�fico impresso na impressora padr�o.',mtinformation,[mbOk],0);
end;

procedure TFormAnalisarEstacao.ThreeDCheckClick(Sender: TObject);
begin
 Chart1.View3D:=ThreeDCheck.Checked;
end;

procedure TFormAnalisarEstacao.BarrasChkClick(Sender: TObject);
begin
 Series2.Active:=BarrasChk.Checked;
 Series1.Active:=LinhasChk.Checked;
end;

procedure TFormAnalisarEstacao.ExportarBtnClick(Sender: TObject);
begin
 If XLSRadio.Checked then
  ExportarXLS
 else If DOCRadio.Checked then
  ExportarDoc;
end;

procedure TFormAnalisarEstacao.ExportarXLS;
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
      //Planilha.Cells[Lin+L,C+1].Select;
      Planilha.Cells.item[Lin+L,C+1]:=Grid.Cells[C,L];
     end;
    end;
    Lin:=Lin+L+2;
   end;

begin
 try
  ExcelApplication1 := TExcelApplication.Create(nil);
  ExcelApplication1.Workbooks.Add(EmptyParam,0);
  ExcelApplication1.Visible[0] := True;
  Planilha := ExcelApplication1.Workbooks[1].Worksheets[1];
  //Sum�rio
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
  Lin:=4;
  //Par�metros
  Planilha.Cells.Item[Lin,1]:='Par�metros da Analise'; Inc(Lin);
  Planilha.Cells.Item[Lin,1]:='Periodo: '+DM.Periodos.Filter; Inc(Lin);
  Planilha.Cells.Item[Lin,1]:='Dia Chuvoso: Chuva>'+ChuvaEdit.Text+'mm'; Inc(Lin);
  If AnoCombo.Text<>'Todos' then
  Planilha.Cells.Item[Lin,1]:='Ano Detalhado: '+AnoCombo.Text; Inc(Lin);
  //Totaliza��es
  Planilha.Cells.Item[Lin,1]:='Totaliza��es'; Inc(Lin);
  IncluirGrid(GridT);
  //Veranicos
  Planilha.Cells.Item[Lin,1]:='Veranicos Observados'; Inc(Lin);
  IncluirGrid(GridV);
  //Dias Chuvosos
  Planilha.Cells.Item[Lin,1]:='Dias Chuvosos Consecutivos Observados'; Inc(Lin);
  IncluirGrid(GridC);
  //Gr�fico
  Chart1.CopyToClipboardBitmap;
  Planilha.Cells[Lin,1].Select;
  Planilha.paste;
  ExcelApplication1.Free;
 except
  MessageDlg('Feche o Excel e tente novamente.',mtInformation,[mbOk],0);
 end;
end;

procedure TFormAnalisarEstacao.ExportarDOC;
var
 Template, NewTemplate, TrueTemplate, FalseTemplate, ItemIndex, FileName:OleVariant;
 ATabela:Table;
 Lin,Col:Integer;

 procedure IncluirGrid(Grid:TStringGrid);
 Var
  L,C:Integer;
 begin
  ATabela:=WordDocument.Tables.Add(WordDocument.Paragraphs.Last.Range,Grid.RowCount,Grid.ColCount,EmptyParam,EmptyParam);
  ATabela.Borders.Enable:=1;
  For L:=0 to Grid.RowCount-1 do
  begin
   For C:=0 to Grid.ColCount-1 do
   begin
    Atabela.Cell(L+1,C+1).Range.InsertAfter(Grid.Cells[C,L]);
    //Atabela.Cell(1,1).Range.Paragraphs.Alignment:=1;
   end;
  end;
  Atabela.AutoFitBehavior(1);
  WordDocument.Range.InsertAfter(''+#13+#13);
 end;

begin
 try
  Template := EmptyParam;
  NewTemplate := True;
  TrueTemplate := True;
  FalseTemplate:=False;
  ItemIndex := 1;
  //Inicial Word
  try
   Wordapplication.Connect;
  except
   MessageDlg('MS-Word n�o pode ser executado.', mtError, [mbOk], 0);
   Abort;
  end;
  Wordapplication.Visible := True;
  WordApplication.Caption := 'An�lise da Esta��o';
  //Create new document
  WordApplication.Documents.Add(Template, NewTemplate,EmptyParam,TrueTemplate);
  //Assign WordDocument component
  WordDocument.ConnectTo(WordApplication.Documents.Item(ItemIndex));
  //Turn Spell checking of because it takes a long time if enabled and slows down Winword
  WordApplication.Options.CheckSpellingAsYouType := False;
  WordApplication.Options.CheckGrammarAsYouType := False;
  WordDocument.PageSetup.LeftMargin:=50;

  //Sum�rio
  ATabela:=WordDocument.Tables.Add(WordDocument.Paragraphs.Last.Range,2,12,EmptyParam,EmptyParam);
  For Col:=0 to 12 do
  If DM.Sumario.Fields[Col].Visible then
  begin
   Atabela.Cell(1,Col+1).Range.InsertAfter(DM.Sumario.Fields[Col].DisplayLabel);Atabela.Cell(1,Col+1).Range.Paragraphs.Alignment:=1;
   Atabela.Cell(2,Col+1).Range.InsertAfter(DM.Sumario.Fields[Col].Text); //Atabela.Cell(2,1).Range.Paragraphs.Alignment:=0;
  end;
  Atabela.AutoFitBehavior(1);
  WordDocument.Range.InsertAfter(''+#13+#13);
  WordDocument.Range.InsertAfter('Par�metros da Analise'+#13);
  WordDocument.Range.InsertAfter('Periodo: '+DM.Periodos.Filter+#13);
  WordDocument.Range.InsertAfter('Dia Chuvoso: Chuva>'+ChuvaEdit.Text+'mm'+#13);
  If AnoCombo.Text<>'Todos' then
   WordDocument.Range.InsertAfter('Ano Detalhado: '+AnoCombo.Text+#13);

  WordDocument.Range.InsertAfter(''+#13+#13);
  WordDocument.Range.InsertAfter('Totaliza��es'+#13);
  IncluirGrid(GridT);
  WordDocument.Range.InsertAfter('Veranicos Observados'+#13);
  IncluirGrid(GridV);
  WordDocument.Range.InsertAfter('Dias Chuvosos Consecutivos Observados'+#13);
  IncluirGrid(GridC);
  Chart1.CopyToClipboardBitmap;
  ATabela:=WordDocument.Tables.Add(WordDocument.Paragraphs.Last.Range,1,1,EmptyParam,EmptyParam);
  Atabela.Cell(1,1).Range.Paste;
 Finally
  WordApplication.Disconnect;
 end;
end;
end.
