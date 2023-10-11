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
    Label2: TLabel;
    DasEdit: TEdit;
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
  P,Arq:TStringList;
  F,I:Integer;
  S,Ultimo,Nome:String;
begin
 DecimalSeparator:='.';
 ProgressBar1.Max:=FileListBox1.Count;
 Screen.Cursor:=crHourGlass;
 P:=TStringList.Create;
 Arq:=TStringList.Create;
 Ultimo:='';
 For F:=0 to FileListBox1.Items.Count-1 do
 begin
  P.LoadFromFile(DirectoryListBox1.Directory+'\'+FileListBox1.Items[F]);
  If Ultimo<>Copy(FileListBox1.Items[F],1,pos('.',FileListBox1.Items[F])-2) then
  begin
   If Ultimo<>'' then
   begin
    Arq.Add('END');
    Arq.Add('END');
    Arq.SaveToFile(DirectoryListBox1.Directory+'\'+Ultimo+'.SPR');
   end;
   Arq.Clear;
   Arq.Add('SAMPLE');
   Arq.Add('POINT3D');
   Ultimo:=Copy(FileListBox1.Items[F],1,pos('.',FileListBox1.Items[F])-2);
  end;
  For I:=4 to P.Count-1 do
  begin
   S:=P.Strings[I];
   If Trim(Copy(S,28,3))=DasEdit.Text then
    Arq.Add(' s '+Copy(S,2,2)+'  '+Copy(S,4,2)+'  '+Copy(S,6,2)+
    '   o '+Copy(S,9,2)+'  '+Copy(S,11,2)+'  '+Copy(S,13,2)+
    '   z '+FormatFloat('0.00',StrToFloat(Trim(Copy(S,34,7)))/100));
  end;
  ProgressBar1.Position:=ProgressBar1.Position+1;
 end;
 Arq.Add('END');
 Arq.Add('END');
 Arq.SaveToFile(DirectoryListBox1.Directory+'\'+Ultimo+'.SPR');
 Screen.Cursor:=crDefault;
 ShowMessage('Fim');
end;

end.
