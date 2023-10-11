unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, FileCtrl, Buttons;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    ProgressBar1: TProgressBar;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
 Var
  P,S:TStringList;
  Str,Dado,Codigo:String;
  L,F,M,D:Integer;
begin
 ProgressBar1.Max:=FileListBox1.Count;
 Screen.Cursor:=crHourGlass;
 P:=TStringList.Create;
 S:=TStringList.Create;
 For F:=0 to FileListBox1.Items.Count-1 do
 begin
  P.LoadFromFile(DirectoryListBox1.Directory+'\'+FileListBox1.Items[F]);
  S.Clear;
  Codigo:=Trim(Copy(P.Strings[1],9,3));
  //Primeira Linha
  S.Add(Copy(P.Strings[1],22,29));
  L:=4;
  While L<P.Count-1 do
  begin
   If Copy(P.Strings[L],1,3)<>'ANO' then
   begin
    L:=L+1;
    Continue;
   end;
   //Ano
   S.Add(Codigo+','+Copy(P.Strings[L],6,4));
   L:=L+3;
   For M:=1 to 12 do
   begin
    Str:='             ';
    For D:=1 to 31 do
    begin
     Dado:=Trim(Copy(P.Strings[L+D],(M*7)+4,6));
     If (Dado<>'')and(Dado<>'-1,0') then
      try
       Dado:=FloatToStr(StrToFloat(Dado)*10)
      except
       Dado:=' ';
      end
     else
      Dado:=' ';
     While length(Dado)<>4 do Dado:=' '+Dado;
     Str:=Str+Dado;
     If D=15 then
     begin
      S.Add(Str+'   0');
      Str:='             ';
     end;
    end;
    S.Add(Str);
   end;
   //Fim do ano
  end;
  S.Add('00000');
  S.SaveToFile(DirectoryListBox1.Directory+'\'+Codigo+'-'+Copy(FileListBox1.Items[F],1,pos('.',FileListBox1.Items[F]))+'PLU');
  ProgressBar1.Position:=ProgressBar1.Position+1;
 end;
 Screen.Cursor:=crDefault;
 ShowMessage('Fim');
end;

end.
