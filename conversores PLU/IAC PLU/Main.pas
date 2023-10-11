unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, Db, DBTables, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    FileList: TFileListBox;
    Directory: TDirectoryListBox;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    E: TTable;
    C: TTable;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Database1: TDatabase;
    ECodigo: TStringField;
    ENome: TStringField;
    ELatG: TSmallintField;
    ELatM: TSmallintField;
    ELatS: TSmallintField;
    ELongG: TSmallintField;
    ELongM: TSmallintField;
    ELongS: TSmallintField;
    EUF: TStringField;
    EAltitude: TFloatField;
    EMunic: TIntegerField;
    EArquivo: TStringField;
    CCodigo: TStringField;
    CData: TDateTimeField;
    CChuva: TFloatField;
    CTMax: TFloatField;
    CTMin: TFloatField;
    CEtp: TFloatField;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    Procedure CarregaChuva(Codigo:String; Ano:Integer; Linha:String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

Procedure TForm1.CarregaChuva(Codigo:String; Ano:Integer; Linha:String);
Var
 I:Integer;
 Data:TDate;
begin
   Data:=StrToDate('01/01/'+IntToStr(Ano));
   I:=1;
   While Data<=StrToDate('31/12/'+IntToStr(Ano)) do
   begin
    C.Append;
    CCodigo.AsString:=Codigo;
    CData.Value:=Data;
    CChuva.Value:=StrToFloat(Copy(Linha,I,4))/10;
    try
     C.Post;
    except
     C.Cancel;
    end;
    I:=I+4;
    Data:=Data+1;
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
 Var
 I,J,L,Ano:Integer;
 Arq:TStringList;
 Linha:String;
begin
 Arq:=TStringList.Create;
 ShortDateFormat:='dd/mm/yyyy';
 DecimalSeparator:='.';
 Screen.Cursor:=crhourglass;
 E.open;
 C.Open;
 ProgressBar1.Max:=FileList.Items.Count;
 For I:=0 to FileList.Items.Count-1 do
 begin
  Arq.LoadFromFile(Directory.Directory+'\'+FileList.Items[I]);
  ProgressBar2.Max:=trunc(Arq.Count-1/24);
  ProgressBar2.Position:=0;
  try
   L:=1;
   E.Append;
   eCodigo.AsString:=Copy(Arq.Strings[1],1,pos(',',Arq.Strings[1])-1);
   eNome.AsString:=Trim(Copy(Arq.Strings[0],1,29));
   eLatG.AsString:=Copy(Arq.Strings[0],30,2);
   eLatM.AsString:=Copy(Arq.Strings[0],32,2);
   If length(trim(Copy(Arq.Strings[0],30,6)))>=5 then
    eLatS.AsString:=Copy(Arq.Strings[0],34,2);
   eLongG.AsString:=Copy(Arq.Strings[0],44,2);
   eLongM.AsString:=Copy(Arq.Strings[0],46,2);
   If length(trim(Copy(Arq.Strings[0],44,6)))>=5 then
    eLongS.AsString:=Copy(Arq.Strings[0],48,2);
   eAltitude.AsString:=trim(Copy(Arq.Strings[0],61,6));
   eUf.AsString:=Copy(FileList.Items[I],1,2);
   eArquivo.AsString:=FileList.Items[I];
   e.post;
   While Copy(trim(Arq.strings[L]),1,3)<>'000' do
   begin
    Application.ProcessMessages;
    Linha:=Arq.Strings[L];
    Ano:=StrToInt(Copy(Linha,pos(',',linha)+1,4));
    L:=L+1;
    Linha:='';
    For J:=1 to 12 do
    begin
     If trim(Copy(Arq.strings[L],1,3))='000' then
      exit;
     Linha:=Linha+Copy(Arq.Strings[L],14,60);
     If trim(Copy(Arq.strings[L+1],1,3))='000' then
      exit;
     If J in([4,6,9,11]) then
      Linha:=Linha+Copy(Arq.Strings[L+1],14,60) //30 Dias
     else if (J=2) and (not IsLeapYear(Ano)) then
      Linha:=Linha+Copy(Arq.Strings[L+1],14,52) //28 Dias
     else if (J=2) and (IsLeapYear(Ano)) then
      Linha:=Linha+Copy(Arq.Strings[L+1],14,56) //29 Dias
     else
      Linha:=Linha+Copy(Arq.Strings[L+1],14,64); //31 Dias
     L:=L+2;
    end;
    CarregaChuva(eCodigo.asstring, Ano, Linha);
    ProgressBar2.Position:=ProgressBar2.Position+1;
   end; //processar próximo ano
  except
   Memo1.Lines.Add('Erro no arquivo: '+FileList.Items[I]+', linha: '+IntToStr(L));
   Memo1.Lines.SaveToFile('C:\log_plu.txt');
   If L=1 then
    e.cancel;
  end;
  ProgressBar1.Position:=ProgressBar1.Position+1;
 end;{Próximo arquivo}
 C.Close;
 E.Close;
 Screen.Cursor:=crDefault;
 ShowMessage('Arquivos Carregados!');
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
 Directory.Drive:='C';
end;





end.
