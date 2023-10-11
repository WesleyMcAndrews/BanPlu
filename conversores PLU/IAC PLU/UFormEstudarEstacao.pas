unit UFormEstudarEstacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Spin, StdCtrls, ExtCtrls, Grids, Menus, DBCtrls, Buttons,
  ComCtrls, TeEngine, Series, TeeProcs, Chart, Mask;

type
  TFormEstudarEstacao = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    EstacaoLCombo: TDBLookupComboBox;
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
    Series2: TLineSeries;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    Label2: TLabel;
    DiaIniEdit: TMaskEdit;
    Label5: TLabel;
    DiaFinEdit: TMaskEdit;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CalcularBtnClick(Sender: TObject);
    procedure EstacaoLComboClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure GridVDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
   Procedure ContaVeranicos;
   Procedure ContaChuva;
   Procedure GerarGrafico;
    { Public declarations }
  end;

var
  FormEstudarEstacao: TFormEstudarEstacao;
  Arq:TStringList;
  Linha:String;
  Ano:Integer;

implementation

Uses DataModule;

{$R *.DFM}

Procedure TFormEstudarEstacao.GerarGrafico;
var
 I:Integer;
begin
 Series2.Clear;
 For I:=1 to GridT.RowCount-1 do
 Begin
  Series2.Add(StrToFloat(GridT.Cells[2,I]),GridT.Cells[0,I],clGreen);
 end;
 Chart1.Repaint;
end;

Procedure TFormEstudarEstacao.ContaVeranicos;
Var
 Dias,I:Integer;
begin
   Dias:=0;
   I:=1;
   While I<Length(linha) do
   begin
    If StrToFloat(Copy(Linha,I,4))/10<=ChuvaEdit.Value then
    begin
     Dias:=Dias+1;
    end
    else
    begin
     {If (GridV.Cells[0,Ano]='2001')and(Dias>0) then
      ShowMessage(IntToStr(Dias));}
     If Dias=5 then
      {1 a 5}GridV.Cells[1,Ano]:=Format('%0.2d',[StrToInt(GridV.Cells[1,Ano])+1])
     else if Dias in [6..10] then
      {6 a 10}GridV.Cells[2,Ano]:=Format('%0.2d',[StrToInt(GridV.Cells[2,Ano])+1])
     else if Dias in [11..15] then
      {11 a 15}GridV.Cells[3,Ano]:=Format('%0.2d',[StrToInt(GridV.Cells[3,Ano])+1])
     else if Dias in [16..20] then
      {16 a 20}GridV.Cells[4,Ano]:=Format('%0.2d',[StrToInt(GridV.Cells[4,Ano])+1])
     else if Dias in [21..25] then
      {21 a 25}GridV.Cells[5,Ano]:=Format('%0.2d',[StrToInt(GridV.Cells[5,Ano])+1])
     else if Dias in [26..30] then
      {26 a 30}GridV.Cells[6,Ano]:=Format('%0.2d',[StrToInt(GridV.Cells[6,Ano])+1])
     else if Dias in [31..35] then
      {31 a 35}GridV.Cells[7,Ano]:=Format('%0.2d',[StrToInt(GridV.Cells[7,Ano])+1])
     else if Dias in [36..40] then
      {36 a 40}GridV.Cells[8,Ano]:=Format('%0.2d',[StrToInt(GridV.Cells[8,Ano])+1])
     else if Dias in [41..45] then
      {41 a 45}GridV.Cells[9,Ano]:=Format('%0.2d',[StrToInt(GridV.Cells[9,Ano])+1])
     else if Dias>45 then
      {+45}GridV.Cells[10,Ano]:=Format('%0.2d',[StrToInt(GridV.Cells[10,Ano])+1]);
     Dias:=0;
    end;
    I:=I+4;
   end;{Fim da contagem}
end;

Procedure TFormEstudarEstacao.ContaChuva;
Var
 Dias,DiasChuvosos,Data,I:Integer;
 MaiorChuva,TotalChuvas:Real;
begin
   DiasChuvosos:=0;
   MaiorChuva:=0;
   TotalChuvas:=0;
   Dias:=0;
   I:=1;
   While I<Length(linha) do
   begin
    If StrToFloat(Copy(Linha,I,4))/10>ChuvaEdit.Value then
    begin
     Dias:=Dias+1;
     DiasChuvosos:=DiasChuvosos+1;
     TotalChuvas:=TotalChuvas+(StrToFloat(Copy(Linha,I,4))/10);
     If StrToFloat(Copy(Linha,I,4))/10>MaiorChuva then
     begin
      MaiorChuva:=StrToFloat(Copy(Linha,I,4))/10;
      Data:=Trunc((I-1)/4);
     end;
    end
    else
    begin
     If (Dias>=1)and(Dias<=10) then
      {1 a 10}GridC.Cells[Dias,Ano]:=Format('%0.2d',[StrToInt(GridC.Cells[Dias,Ano])+1])
     else if Dias>10 then
      {+10}GridC.Cells[11,Ano]:=Format('%0.2d',[StrToInt(GridC.Cells[11,Ano])+1]);
     Dias:=0;
    end;
    I:=I+4;
   end;{Fim da contagem}
   {escrever Totaliza��o}
   With GridT do
   begin
    Cells[1,Ano]:=Format('%0.3d',[DiasChuvosos]);
    Cells[2,Ano]:=Format('%3.2n',[MaiorChuva]);
    Cells[3,Ano]:=DateToStr(StrToDate('01/01/'+Cells[0,Ano])+(Data));
    If DiasChuvosos>0 then
     Cells[4,Ano]:=Format('%3.2n',[TotalChuvas/DiasChuvosos])
    else
     Cells[4,Ano]:='0,00';
    Cells[5,Ano]:=Format('%3.2n',[TotalChuvas]);
   end;
end;

procedure TFormEstudarEstacao.FormActivate(Sender: TObject);
 Var
  I:Byte;
begin
 DM.Estacoes.Open;
 With GridV do
 begin
  Cells[0,0]:='Ano';
  Cells[1,0]:='5 Dias';
  For I:=2 to 9 do
   Cells[I,0]:=IntToStr(I*5-4)+'a'+IntToStr(I*5)+' D';
  Cells[10,0]:='+45 D';
  ColWidths[0]:=60;
 end;
 With GridC do
 begin
  Cells[0,0]:='Ano';
  For I:=1 to 10 do
   Cells[I,0]:=IntToStr(I)+' D';
  Cells[11,0]:='+10 D';
  ColWidths[0]:=60;
 end;
 With GridT do
 begin
  Cells[0,0]:='Ano';
  Cells[1,0]:='Dias';
  Cells[2,0]:='M�ximo';
  Cells[3,0]:='Data';
  Cells[4,0]:='M�dia';
  Cells[5,0]:='Total';
 end;

end;

procedure TFormEstudarEstacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DM.Estacoes.Close;
end;

procedure TFormEstudarEstacao.CalcularBtnClick(Sender: TObject);
Var
 I,L:Integer;
begin
 Screen.Cursor:=CrHourGlass;
 L:=1;
 Ano:=1;
 try
  While Copy(trim(Arq.strings[L]),1,3)<>'000' do
  begin
   Linha:=Arq.Strings[L];
   GridV.RowCount:=Ano+1;
   GridC.RowCount:=Ano+1;
   GridT.RowCount:=Ano+1;
   {inicializando o novo ano na grid}
   For I:=1 to 10 do
    GridV.Cells[I,Ano]:='00';
   For I:=1 to 11 do
    GridC.Cells[I,Ano]:='00';
   GridV.Cells[0,Ano]:=Copy(Linha,pos(',',linha)+1,4);
   GridC.Cells[0,Ano]:=Copy(Linha,pos(',',linha)+1,4);
   GridT.Cells[0,Ano]:=Copy(Linha,pos(',',linha)+1,4);
   L:=L+1;
   Linha:='';
   {colocando todos os meses num vetor}
   For I:=1 to 12 do
   begin
    If trim(Copy(Arq.strings[L],1,3))='000' then
     exit;
    Linha:=Linha+Copy(Arq.Strings[L],14,60);
    If trim(Copy(Arq.strings[L+1],1,3))='000' then
     exit;
    If I in([4,6,9,11]) then
     Linha:=Linha+Copy(Arq.Strings[L+1],14,60){30 Dias}
    else if (I=2) and (not IsLeapYear(StrToInt(GridV.Cells[0,Ano]))) then
     Linha:=Linha+Copy(Arq.Strings[L+1],14,52){28 Dias}
    else if (I=2) and (IsLeapYear(StrToInt(GridV.Cells[0,Ano]))) then
     Linha:=Linha+Copy(Arq.Strings[L+1],14,56){29 Dias}
    else
     Linha:=Linha+Copy(Arq.Strings[L+1],14,64);{31 Dias}
    L:=L+2;
   end;{for}
   {Contando os veranicos}
   ContaVeranicos;
   ContaChuva;
   Ano:=Ano+1;
  end;{processar pr�ximo ano}
  CalcularBtn.Enabled:=false;
  GerarGrafico;
  MessageDlg('Contagem de Veranicos terminada com sucesso!',mtInformation,[mbOk],0);
 except
  MessageDlg('H� um erro no arquivo de chuva. Verifique.',mtError,[mbOk],0);
 end;
 Screen.Cursor:=CrDefault;
end;

procedure TFormEstudarEstacao.EstacaoLComboClick(Sender: TObject);
Var
 UltimoAno,L:Integer;
begin
 Screen.Cursor:=CrHourGlass;
 Arq:=TStringList.Create;
 Arq.LoadFromFile(ExtractFilePath(ParamStr(0))+'Dados\'+DM.EstacoesARQUIVO.AsString);
 If Arq.Count>=4 then
 L:=2;
 While Copy(trim(Arq.strings[L]),1,3)<>'000' do
 begin
  If pos(',',Arq.strings[L])>0 then
   UltimoAno:=StrToInt(Copy(Arq.strings[L],pos(',',Arq.strings[L])+1,4));
  L:=L+1;
 end;
 Label6.Caption:='Per�odo registrado: De '+Copy(Arq.strings[1],pos(',',Arq.strings[1])+1,4)+' at� '+IntToStr(UltimoAno);
 CalcularBtn.Enabled:=(EstacaoLCombo.Text<>'');
 Screen.Cursor:=CrDefault;
end;

procedure TFormEstudarEstacao.SpeedButton1Click(Sender: TObject);
begin
 Close;
end;

procedure TFormEstudarEstacao.GridVDrawCell(Sender: TObject; Col,
  Row: Integer; Rect: TRect; State: TGridDrawState);
begin
 {If (GridV.Cells[col,row]<>'00')and(col>0)and(row>0)then
 begin
  GridV.Font.Color:=clRed;
  Canvas.FillRect(Rect);
  Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, GridV.Cells[col,row]);
 end
 else
  GridV.Font.Color := clWindowText;}
end;


end.
