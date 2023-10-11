unit UFormExportarSpring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ComCtrls, DateUtils, Math,
  OleServer, Excel2000;

type
  TFormExportarSpring = class(TForm)
    Label4: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    ChuvaMediaAnualRadio: TRadioButton;
    VeranicosRadio: TRadioButton;
    DiasChuvososRadio: TRadioButton;
    VeranicosCombo: TComboBox;
    ChuvaCombo: TComboBox;
    ProgressBar1: TProgressBar;
    ChuvaMediaMensalRadio: TRadioButton;
    MesCombo: TComboBox;
    AnaliseFreqRadio: TRadioButton;
    MesCombo2: TComboBox;
    DecilCombo: TComboBox;
    VeranicosMesRadio: TRadioButton;
    MesCombo3: TComboBox;
    VeranicosCombo2: TComboBox;
    ProbVeranicosRadio: TRadioButton;
    MesCombo4: TComboBox;
    VeranicosCombo3: TComboBox;
    QuinzCombo: TComboBox;
    ChuvaAcumuladaRadio: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ChuvaEdit: TEdit;
    SaveDialog1: TSaveDialog;
    Chuva: TADOQuery;
    ExcelApplication1: TExcelApplication;
    procedure BitBtn1Click(Sender: TObject);
    procedure ChuvaEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure ExportarSumario(Campo:String);
    procedure ExportarVeranicos;
    procedure ExportarChuvaMediaAnual;
    procedure ExportarChuvaMediaMensal;
    procedure ExportarDiasChuvosos;
    procedure ExportarAnaliseFreq;
    procedure VeranicosMes;
    procedure ProbVeranicos;
    procedure ChuvaAcumulada;
  public
    { Public declarations }
  end;

var
  FormExportarSpring: TFormExportarSpring;

implementation

uses DataModule;

{$R *.dfm}

Procedure TFormExportarSpring.ChuvaAcumulada;
Var
 Col:Integer;
 S,T:String;
 P:TStringList;
 Valor:Real;
begin
 DecimalSeparator:='.';
 DM.Sumario.First;
 Chuva.SQL.Clear;
 Chuva.SQL.Add('SELECT Year(Data) as Ano,');
 Chuva.SQL.Add('Sum(Case When Month(Data)=1 then Chuva else 0 end) as Jan,');
 Chuva.SQL.Add('Sum(Case When Month(Data)=2 then Chuva else 0 end) as Fev,');
 Chuva.SQL.Add('Sum(Case When Month(Data)=3 then Chuva else 0 end) as Mar,');
 Chuva.SQL.Add('Sum(Case When Month(Data)=4 then Chuva else 0 end) as Abr,');
 Chuva.SQL.Add('Sum(Case When Month(Data)=5 then Chuva else 0 end) as Mai,');
 Chuva.SQL.Add('Sum(Case When Month(Data)=6 then Chuva else 0 end) as Jun,');
 Chuva.SQL.Add('Sum(Case When Month(Data)=7 then Chuva else 0 end) as Jul,');
 Chuva.SQL.Add('Sum(Case When Month(Data)=8 then Chuva else 0 end) as Ago,');
 Chuva.SQL.Add('Sum(Case When Month(Data)=9 then Chuva else 0 end) as Sete,');
 Chuva.SQL.Add('Sum(Case When Month(Data)=10 then Chuva else 0 end) as Out,');
 Chuva.SQL.Add('Sum(Case When Month(Data)=11 then Chuva else 0 end) as Nov,');
 Chuva.SQL.Add('Sum(Case When Month(Data)=12 then Chuva else 0 end) as Dez,');
 Chuva.SQL.Add('Sum(Chuva) as Total');
 Chuva.SQL.Add('FROM ClimaDia');
 Chuva.SQL.Add('Where IDEstacao=:IDEstacao');
 Chuva.SQL.Add('And Chuva>'+ChuvaEdit.Text);
 Chuva.SQL.Add('Group by Year(Data)');
 Chuva.Open;
 Screen.Cursor:=CrHourGlass;
 ProgressBar1.Max:=DM.Sumario.RecordCount;
 P:=TStringList.Create;
 SaveDialog1.FileName:='ChuvaAcumuladaMensal-'+DM.SumarioUF.AsString+'.txt';
 If SaveDialog1.Execute then
 While not DM.Sumario.Eof do
 begin
  If DM.SumarioAnos.Value<1 then
  begin
   DM.Sumario.Next;
   Continue;
  end;
  P.Clear;
  For Col:=0 to 10 do
  If DM.Sumario.Fields[Col].Visible then
   P.Add(DM.Sumario.Fields[Col].DisplayLabel+':'+DM.Sumario.Fields[Col].AsString);
  P.Add('');
  //Chuva
  While not Chuva.Eof do
  begin
   //Ano
   S:=Chuva.FieldbyName('Ano').AsString+'  ';
   //Meses
   For Col:=1 to Chuva.FieldCount-2 do
   begin
    Valor:=Chuva.Fields[Col].Value;
    If Chuva.Fields[Col].IsNull then Valor:=-1;
    T:=FormatFloat('0.0',Valor);
    While Length(T)<8 do
     T:=' '+T;
    S:=S+T;
   end;
   //Soma
   Valor:=Chuva.Fields[Chuva.FieldCount-1].Value;
    If Chuva.Fields[Chuva.FieldCount-1].IsNull then Valor:=-1;
   T:=FormatFloat('0.0',Valor);
   While Length(T)<11 do
    T:=' '+T;
   S:=S+T;
   P.Add(S);
   Chuva.Next;
  end;
  P.SaveToFile(ExtractFilePath(SaveDialog1.FileName)+DM.SumarioNomeEstacao.AsString+'-'+DM.SumarioUF.AsString+'.txt');
  DM.Sumario.Next;
  ProgressBar1.Position:=ProgressBar1.Position+1;
 end;
 Chuva.Close;
 Screen.Cursor:=CrDefault;
 DecimalSeparator:=',';
end;

procedure TFormExportarSpring.ExportarSumario(Campo:String);
Var
 S:TStringList;
 Linha:String;
begin
 Screen.Cursor:=CrHourGlass;
 S:=TStringList.Create;
 DM.Sumario.First;
 S.Add('SAMPLE');
 S.Add('POINT3D');
 While not DM.Sumario.eof do
 begin
  If DM.SumarioAnos.value<1 then
  begin
   DM.Sumario.Next;
   Continue;
  end;
  Linha:=' s '+DM.SumarioLatG.AsString+'  '+DM.SumarioLatM.AsString+'  '+DM.SumarioLatS.AsString+'   o '+
  DM.SumarioLongG.AsString+'  '+DM.SumarioLongM.AsString+'  '+DM.SumarioLongS.AsString+'   Z '+DM.VirgulaPorPonto(FormatFloat('00.00',DM.Sumario.fieldByName(Campo).Value));
  S.Add(Linha);
  DM.Sumario.Next;
 end;
 DM.Sumario.First;
 S.Add('END');
 S.Add('END');
 Screen.Cursor:=CrDefault;
 SaveDialog1.FileName:=Campo+'-'+DM.SumarioUF.AsString+'.spr';
 If SaveDialog1.Execute then
  S.SaveToFile(ExtractFilePath(SaveDialog1.FileName)+Campo+'-'+DM.SumarioUF.AsString+'.spr');
 S.Free;
end;

procedure TFormExportarSpring.ExportarChuvaMediaAnual;
Var
 S:TStringList;
 Linha:String;
begin
 DM.Sumario.First;
 Chuva.SQL.Clear;
 Chuva.SQL.Add('Select AVG(Chuva) as ChuvaMedia');
 Chuva.SQL.Add('From (Select Year(Data) as ano, Sum(Chuva) as Chuva from ClimaDia ');
 Chuva.SQL.Add('Where IDEstacao=:IDEstacao');
 Chuva.SQL.Add('And Chuva>'+ChuvaEdit.Text);
 Chuva.SQl.Add('group by Year(Data))');
 Chuva.Open;
 Screen.Cursor:=CrHourGlass;
 S:=TStringList.Create;
 S.Add('SAMPLE');
 S.Add('POINT3D');
 ProgressBar1.Max:=DM.Sumario.RecordCount;
 While not DM.Sumario.Eof do
 begin
  If DM.SumarioAnos.value<1 then
  begin
   DM.Sumario.Next;
   Continue;
  end;
  Linha:=' s '+DM.SumarioLatG.AsString+'  '+DM.SumarioLatM.AsString+'  '+DM.SumarioLatS.AsString+'   o '+
  DM.SumarioLongG.AsString+'  '+DM.SumarioLongM.AsString+'  '+DM.SumarioLongS.AsString+'   Z '+
  DM.VirgulaPorPonto(FormatFloat('00.00',Chuva.FieldByName('ChuvaMedia').Value));
  S.Add(Linha);
  DM.Sumario.Next;
  ProgressBar1.Position:=ProgressBar1.Position+1;
 end;
 Chuva.Close;
 S.Add('END');
 S.Add('END');
 Screen.Cursor:=CrDefault;
 SaveDialog1.FileName:='Chuva M�dia Anual'+' - '+DM.SumarioUF.AsString+'.spr';
 If SaveDialog1.Execute then
  S.SaveToFile(SaveDialog1.FileName);
 S.Free;
 ProgressBar1.Position:=0;
end;

procedure TFormExportarSpring.ExportarChuvaMediaMensal;
Var
 S:TStringList;
 Linha:String;
begin
 DM.Sumario.First;
 Chuva.SQL.Clear;
 Chuva.SQL.Add('Select AVG(Chuva) as ChuvaMedia');
 Chuva.SQL.Add('From (Select Year(Data) as ano,Month(Data) as mes, Sum(Chuva) as Chuva from ClimaDia ');
 Chuva.SQL.Add('Where IDEstacao=:IDEstacao');
 Chuva.SQl.Add('And Month(Data)='+IntToStr(MesCombo.ItemIndex+1));
 Chuva.SQL.Add('And Chuva>'+ChuvaEdit.Text);
  Chuva.SQl.Add('group by Year(Data), Month(Data))');
 Chuva.Open;
 Screen.Cursor:=CrHourGlass;
 S:=TStringList.Create;
 S.Add('SAMPLE');
 S.Add('POINT3D');
 ProgressBar1.Max:=DM.Sumario.RecordCount;
 While not DM.Sumario.Eof do
 begin
  If DM.SumarioAnos.value<1 then
  begin
   DM.Sumario.Next;
   Continue;
  end;
  Linha:=' s '+DM.SumarioLatG.AsString+'  '+DM.SumarioLatM.AsString+'  '+DM.SumarioLatS.AsString+'   o '+
  DM.SumarioLongG.AsString+'  '+DM.SumarioLongM.AsString+'  '+DM.SumarioLongS.AsString+'   Z '+
  DM.VirgulaPorPonto(FormatFloat('00.00',Chuva.FieldByName('ChuvaMedia').Value));
  S.Add(Linha);
  DM.Sumario.Next;
  ProgressBar1.Position:=ProgressBar1.Position+1;
 end;
 Chuva.Close;
 S.Add('END');
 S.Add('END');
 Screen.Cursor:=CrDefault;
 SaveDialog1.FileName:='Chuva M�dia Mensal '+MesCombo.Text+' - '+DM.SumarioUF.AsString+'.spr';
 If SaveDialog1.Execute then
  S.SaveToFile(SaveDialog1.FileName);
 S.Free;
 ProgressBar1.Position:=0;
end;

procedure TFormExportarSpring.ExportarVeranicos;
Var
 S:TStringList;
 DiasVeranico,Veranicos:Integer;
 Linha:String;
begin
 DM.Sumario.First;
 Chuva.SQL.Clear;
 Chuva.SQL.Add('Select Data,Chuva');
 Chuva.SQL.Add('From ClimaDia');
 Chuva.SQL.Add('Where IDEstacao=:IDEstacao');
 Chuva.SQL.Add('Order by Data');
 Chuva.Open;
 Screen.Cursor:=CrHourGlass;
 S:=TStringList.Create;
 S.Add('SAMPLE');
 S.Add('POINT3D');
 ProgressBar1.Max:=DM.Sumario.RecordCount;
 While not DM.Sumario.Eof do
 begin
  If DM.SumarioAnos.value<1 then
  begin
   DM.Sumario.Next;
   Continue;
  end;
  DiasVeranico:=0;
  Veranicos:=0;
  While not Chuva.eof do
  begin
   If Chuva.FieldByName('Chuva').Value<=StrToFloatDef(ChuvaEdit.Text,1) then
    Inc(DiasVeranico)
   else
   begin
    If  (VeranicosCombo.ItemIndex=0)and(DiasVeranico=5) then
     Inc(Veranicos)
    else If (VeranicosCombo.ItemIndex<9)and(DiasVeranico in [((VeranicosCombo.ItemIndex+1)*5)-4..(VeranicosCombo.ItemIndex+1)*5]) then
     Inc(Veranicos)
    else If (VeranicosCombo.ItemIndex=9)and(DiasVeranico>45) then
     Inc(Veranicos);
    DiasVeranico:=0;
   end;
   Chuva.Next;
  end;
  Linha:=' s '+DM.SumarioLatG.AsString+'  '+DM.SumarioLatM.AsString+'  '+DM.SumarioLatS.AsString+'   o '+
  DM.SumarioLongG.AsString+'  '+DM.SumarioLongM.AsString+'  '+DM.SumarioLongS.AsString+'   Z '+IntToStr(Veranicos);
  S.Add(Linha);
  DM.Sumario.Next;
  ProgressBar1.Position:=ProgressBar1.Position+1;
 end;
 Chuva.Close;
 S.Add('END');
 S.Add('END');
 Screen.Cursor:=CrDefault;
 SaveDialog1.FileName:='Veranicos de '+VeranicosCombo.Text+' - '+DM.SumarioUF.AsString+'.spr';
 If SaveDialog1.Execute then
  S.SaveToFile(ExtractFilePath(SaveDialog1.FileName)+'Veranicos de '+VeranicosCombo.Text+' - '+DM.SumarioUF.AsString+'.spr');
 S.Free;
 ProgressBar1.Position:=0;
end;

procedure TFormExportarSpring.ExportarDiasChuvosos;
Var
 S:TStringList;
 DiasChuva,Observacoes:Integer;
 Linha:String;
begin
 DM.Sumario.First;
 Chuva.Open;
 Screen.Cursor:=CrHourGlass;
 S:=TStringList.Create;
 S.Add('SAMPLE');
 S.Add('POINT3D');
 ProgressBar1.Max:=DM.Sumario.RecordCount;
 While not DM.Sumario.Eof do
 begin
  If DM.SumarioAnos.value<1 then
  begin
   DM.Sumario.Next;
   Continue;
  end;
  DiasChuva:=0;
  Observacoes:=0;
  While not Chuva.eof do
  begin
   If Chuva.FieldByName('Chuva').Value>StrToFloatDef(ChuvaEdit.Text,1) then
    Inc(DiasChuva)
   else If (DiasChuva=ChuvaCombo.ItemIndex+1)or((ChuvaCombo.ItemIndex>10) and (DiasChuva>10)) then
   begin
    Inc(Observacoes);
    DiasChuva:=0;
   end;
   Chuva.Next;
  end;
  Linha:=' s '+DM.SumarioLatG.AsString+'  '+DM.SumarioLatM.AsString+'  '+DM.SumarioLatS.AsString+'   o '+
  DM.SumarioLongG.AsString+'  '+DM.SumarioLongM.AsString+'  '+DM.SumarioLongS.AsString+'   Z '+IntToStr(Observacoes);
  S.Add(Linha);
  DM.Sumario.Next;
  ProgressBar1.Position:=ProgressBar1.Position+1;
 end;
 Chuva.Close;
 S.Add('END');
 S.Add('END');
 Screen.Cursor:=CrDefault;
 SaveDialog1.FileName:=ChuvaCombo.Text+' chuvosos'+' - '+DM.SumarioUF.AsString+'.spr';
 If SaveDialog1.Execute then
  S.SaveToFile(ExtractFilePath(SaveDialog1.FileName)+ChuvaCombo.Text+' chuvosos'+' - '+DM.SumarioUF.AsString+'.spr');
 S.Free;
 ProgressBar1.Position:=0;
end;

procedure TFormExportarSpring.ExportarAnaliseFreq;
Var
 S:TStringList;
 I:Double;
 Decil:Integer;
 Separatriz:Real;
 Linha:String;
begin
 DM.Sumario.First;
 Chuva.SQL.Clear;
 Chuva.SQL.Add('Select Year(Data) as ano, Sum(Chuva) as Chuva from ClimaDia ');
 Chuva.SQL.Add('Where IDEstacao=:IDEstacao');
 Chuva.SQl.Add('And Month(Data)='+IntToStr(MesCombo2.ItemIndex+1));
 If QuinzCombo.ItemIndex=1 then
  Chuva.SQl.Add('And Day(Data) between 1 and 15');
 If QuinzCombo.ItemIndex=2 then
  Chuva.SQl.Add('And Day(Data) between 16 and 31');
 Chuva.SQL.Add('And Chuva>'+ChuvaEdit.Text);
 Chuva.SQl.Add('group by Year(Data)');
 Chuva.SQL.Add('Order by Sum(Chuva)');
 Chuva.Open;
 Decil:=StrToInt(Copy(DecilCombo.Text,1,1));
 Screen.Cursor:=CrHourGlass;
 S:=TStringList.Create;
 S.Add('SAMPLE');
 S.Add('POINT3D');
 ProgressBar1.Max:=DM.Sumario.RecordCount;
 While not DM.Sumario.Eof do
 begin
  If DM.SumarioAnos.value<1 then
  begin
   DM.Sumario.Next;
   Continue;
  end;
  Chuva.First;
  I:=(Decil*Chuva.RecordCount)/10;
  If I=Int(I) then //Se for inteiro
  begin
   Chuva.MoveBy(Trunc(I)-1);
   Separatriz:=Chuva.FieldByName('Chuva').Value;
  end
  else
  begin
   Chuva.MoveBy(Trunc(I)-1);
   Separatriz:=Chuva.FieldByName('Chuva').Value;
   Chuva.Next;
   Separatriz:=(Separatriz+Chuva.FieldByName('Chuva').Value)/2;
  end;
  Linha:=' s '+DM.SumarioLatG.AsString+'  '+DM.SumarioLatM.AsString+'  '+DM.SumarioLatS.AsString+'   o '+
  DM.SumarioLongG.AsString+'  '+DM.SumarioLongM.AsString+'  '+DM.SumarioLongS.AsString+'   Z '+
  DM.VirgulaPorPonto(FormatFloat('00.00',Separatriz));
  S.Add(Linha);
  DM.Sumario.Next;
  ProgressBar1.Position:=ProgressBar1.Position+1;
 end;
 Chuva.Close;
 S.Add('END');
 S.Add('END');
 Screen.Cursor:=CrDefault;
 SaveDialog1.FileName:='An�lise Frequencial '+DecilCombo.Text+' '+MesCombo2.Text+' '+QuinzCombo.Text+' - '+DM.SumarioUF.AsString+'.spr';
 If SaveDialog1.Execute then
  S.SaveToFile(ExtractFilePath(SaveDialog1.FileName)+'An�lise Frequencial '+DecilCombo.Text+' '+MesCombo2.Text+' '+QuinzCombo.Text+' - '+DM.SumarioUF.AsString+'.spr');
 S.Free;
 ProgressBar1.Position:=0;
end;

procedure TFormExportarSpring.VeranicosMes;
Var
 S:TStringList;
 UltimoAno,DiasVeranico,Veranicos:Integer;
 Linha:String;
begin
 DM.Sumario.First;
 Chuva.SQL.Clear;
 Chuva.SQL.Add('Select Data,Chuva');
 Chuva.SQL.Add('From ClimaDia');
 Chuva.SQL.Add('Where IDEstacao=:IDEstacao');
 Chuva.SQl.Add('And Month(Data)='+IntToStr(MesCombo3.ItemIndex+1));
 Chuva.SQL.Add('Order by Data');
 Chuva.Open;
 Screen.Cursor:=CrHourGlass;
 S:=TStringList.Create;
 S.Add('SAMPLE');
 S.Add('POINT3D');
 ProgressBar1.Max:=DM.Sumario.RecordCount;
 UltimoAno:=YearOf(Chuva.FieldByName('Data').AsDateTime);
 While not DM.Sumario.Eof do
 begin
  If DM.SumarioAnos.value<1 then
  begin
   DM.Sumario.Next;
   Continue;
  end;
  DiasVeranico:=0;
  Veranicos:=0;
  While not Chuva.eof do
  begin
   If YearOf(Chuva.FieldByName('Data').AsDateTime)<>UltimoAno then
   begin
    If (VeranicosCombo2.ItemIndex=0)and(DiasVeranico=5) then
     Inc(Veranicos)
    else If (VeranicosCombo2.ItemIndex in [1..8])and(DiasVeranico in [((VeranicosCombo2.ItemIndex+1)*5)-4..(VeranicosCombo2.ItemIndex+1)*5]) then
     Inc(Veranicos)
    else If (VeranicosCombo2.ItemIndex=9)and(DiasVeranico>45) then
     Inc(Veranicos);
    DiasVeranico:=0;
    UltimoAno:=YearOf(Chuva.FieldByName('Data').AsDateTime);
   end;
   If Chuva.FieldByName('Chuva').Value<=StrToFloatDef(ChuvaEdit.Text,1) then
    Inc(DiasVeranico)
   else
   begin
    If (VeranicosCombo2.ItemIndex=0)and(DiasVeranico=5) then
     Inc(Veranicos)
    else If (VeranicosCombo2.ItemIndex in [1..8])and(DiasVeranico in [((VeranicosCombo2.ItemIndex+1)*5)-4..(VeranicosCombo2.ItemIndex+1)*5]) then
     Inc(Veranicos)
    else If (VeranicosCombo2.ItemIndex=9)and(DiasVeranico>45) then
     Inc(Veranicos);
    DiasVeranico:=0;
   end;
   Chuva.Next;
  end;
  Linha:=' s '+DM.SumarioLatG.AsString+'  '+DM.SumarioLatM.AsString+'  '+DM.SumarioLatS.AsString+'   o '+
  DM.SumarioLongG.AsString+'  '+DM.SumarioLongM.AsString+'  '+DM.SumarioLongS.AsString+'   Z '+IntToStr(Veranicos);
  S.Add(Linha);
  DM.Sumario.Next;
  ProgressBar1.Position:=ProgressBar1.Position+1;
 end;
 Chuva.Close;
 S.Add('END');
 S.Add('END');
 Screen.Cursor:=CrDefault;
 SaveDialog1.FileName:='Veranicos de '+VeranicosCombo2.Text+' '+MesCombo3.Text+' - '+DM.SumarioUF.AsString+'.spr';
 If SaveDialog1.Execute then
  S.SaveToFile(ExtractFilePath(SaveDialog1.FileName)+'Veranicos de '+VeranicosCombo2.Text+' '+MesCombo3.Text+' - '+DM.SumarioUF.AsString+'.spr');
 S.Free;
 ProgressBar1.Position:=0;
end;

procedure TFormExportarSpring.ProbVeranicos;
Var
 S:TStringList;
 UltimoAno,DiasVeranico,Veranicos:Integer;
 Linha:String;
begin
 DM.Sumario.First;
 Chuva.SQL.Clear;
 Chuva.SQL.Add('Select Data,Chuva');
 Chuva.SQL.Add('From ClimaDia');
 Chuva.SQL.Add('Where IDEstacao=:IDEstacao');
 Chuva.SQl.Add('And Month(Data)='+IntToStr(MesCombo4.ItemIndex+1));
 Chuva.SQL.Add('Order by Data');
 Chuva.Open;
 Screen.Cursor:=CrHourGlass;
 S:=TStringList.Create;
 S.Add('SAMPLE');
 S.Add('POINT3D');
 ProgressBar1.Max:=DM.Sumario.RecordCount;
 UltimoAno:=0;
 While not DM.Sumario.Eof do
 begin
  If DM.SumarioAnos.value<1 then
  begin
   DM.Sumario.Next;
   Continue;
  end;
  DiasVeranico:=0;
  Veranicos:=0;
  While not Chuva.eof do
  begin
   If YearOf(Chuva.FieldByName('Data').AsDateTime)<>UltimoAno then
   begin
    If  (VeranicosCombo3.ItemIndex=0)and(DiasVeranico=5) then
     Inc(Veranicos)
    else If (VeranicosCombo3.ItemIndex in [1..8])and(DiasVeranico in [((VeranicosCombo3.ItemIndex+1)*5)-4..(VeranicosCombo3.ItemIndex+1)*5]) then
     Inc(Veranicos)
    else If (VeranicosCombo3.ItemIndex=9)and(DiasVeranico>45) then
     Inc(Veranicos);
    DiasVeranico:=0;
    UltimoAno:=YearOf(Chuva.FieldByName('Data').AsDateTime);
   end;
   If Chuva.FieldByName('Chuva').Value<=StrToFloatDef(ChuvaEdit.Text,1) then
    Inc(DiasVeranico)
   else
   begin
    If  (VeranicosCombo3.ItemIndex=0)and(DiasVeranico=5) then
     Inc(Veranicos)
    else If (VeranicosCombo3.ItemIndex in [1..8])and(DiasVeranico in [((VeranicosCombo3.ItemIndex+1)*5)-4..(VeranicosCombo3.ItemIndex+1)*5]) then
     Inc(Veranicos)
    else If (VeranicosCombo3.ItemIndex=9)and(DiasVeranico>45) then
     Inc(Veranicos);
    DiasVeranico:=0;
   end;
   Chuva.Next;
  end;
  Linha:=' s '+DM.SumarioLatG.AsString+'  '+DM.SumarioLatM.AsString+'  '+DM.SumarioLatS.AsString+'   o '+
  DM.SumarioLongG.AsString+'  '+DM.SumarioLongM.AsString+'  '+DM.SumarioLongS.AsString+'   Z '+
  DM.VirgulaPorPonto(IntToStr(Round((Veranicos*100)/IfThen(DM.SumarioAnos.Value<Veranicos,Veranicos,DM.SumarioAnos.Value))));
  S.Add(Linha);
  DM.Sumario.Next;
  ProgressBar1.Position:=ProgressBar1.Position+1;
 end;
 Chuva.Close;
 S.Add('END');
 S.Add('END');
 Screen.Cursor:=CrDefault;
 SaveDialog1.FileName:='Probabilidade de Veranicos de '+VeranicosCombo3.Text+' '+MesCombo4.Text+' - '+DM.SumarioUF.AsString+'.spr';
 If SaveDialog1.Execute then
  S.SaveToFile(ExtractFilePath(SaveDialog1.FileName)+'Probabilidade de Veranicos de '+VeranicosCombo3.Text+' '+MesCombo4.Text+' - '+DM.SumarioUF.AsString+'.spr');
 S.Free;
 ProgressBar1.Position:=0;
end;

procedure TFormExportarSpring.BitBtn1Click(Sender: TObject);
begin
 If ChuvaMediaAnualRadio.Checked then
  ExportarChuvaMediaAnual
 else if ChuvaMediaMensalRadio.Checked then
  ExportarChuvaMediaMensal
 else if VeranicosRadio.Checked then
  ExportarVeranicos
 else if DiasChuvososRadio.Checked then
  ExportarDiasChuvosos
 else if AnaliseFreqRadio.Checked then
  ExportarAnaliseFreq
 else if VeranicosMesRadio.Checked then
  VeranicosMes
 else if ProbVeranicosRadio.Checked then
  ProbVeranicos
 else if ChuvaAcumuladaRadio.Checked then
  ChuvaAcumulada;
end;

procedure TFormExportarSpring.ChuvaEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 If not (Key in ['0'..'9','.',chr(8),chr(13)]) then
  Key:=#0;
end;

end.
