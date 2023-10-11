unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, FileCtrl, OleServer, Excel2000, ComCtrls;

type
  TFormMain = class(TForm)
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    ProgressBar1: TProgressBar;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.SpeedButton1Click(Sender: TObject);
var
 S,P:TStringList;
 L,F,Col,Lin:Integer;
 Str,Dado,Codigo:String;
 lat,Long:Real;
begin
 try
  DecimalSeparator:='.';
  ProgressBar1.Max:=FileListBox1.Count;
  Screen.Cursor:=crHourGlass;
  S:=TStringList.Create;
  P:=TStringList.Create;
  For F:=0 to FileListBox1.Items.Count-1 do
  begin
   P.LoadFromFile(DirectoryListBox1.Directory+'\'+FileListBox1.Items[F]);
   S.Clear;
   L:=1;
   While L<P.Count do
   begin
    If Copy(P.Strings[L],1,7)<>'Posto :'then
    begin
     L:=L+1;
     Continue;
    end;
    If S.Count=0 then //Início do PLU
    begin
     //Nome da Estação
     Str:=Copy(P.Strings[L],8,29);
     While length(Str)<29 do
      Str:=Str+' ';
     //Lat
     Lat:=Abs(StrToFloat(Trim(Copy(P.Strings[L],54,9))));
     Str:=Str+FormatFloat('00',Int(Lat));
     Codigo:=FormatFloat('00',Int(Lat));
     Str:=Str+FormatFloat('00',Int((Lat-Int(Lat))*60));
     Codigo:=Codigo+FormatFloat('00',Int((Lat-Int(Lat))*60));
     Str:=Str+FormatFloat('00',int((((Lat-Int(Lat))*60)-Int((Lat-Int(Lat))*60))*60));
     While length(Str)<43 do
      Str:=Str+' ';
     //Long
     Long:=Abs(StrToFloat(Trim(Copy(P.Strings[L],69,9))));
     Str:=Str+FormatFloat('00',Int(Long));
     Codigo:=Codigo+FormatFloat('00',Int(Long));
     Str:=Str+FormatFloat('00',Int((Long-Int(Long))*60));
     Codigo:=Codigo+FormatFloat('00',Int((Long-Int(Long))*60));
     Str:=Str+FormatFloat('00',int((((Long-Int(Long))*60)-Int((Long-Int(Long))*60))*60));
     While length(Str)<60 do
      Str:=Str+' ';
     S.Add(Str+'0.0');
    end;
    L:=L+1;
    //Ano
    S.Add(Codigo+','+Copy(P.Strings[L],length(P.Strings[L])-3,4));
    L:=L+2;
    For Col:=1 to 12 do
    begin
     Str:='             ';
     For Lin:=1 to 31 do
     begin
      Dado:=Trim(Copy(P.Strings[L+Lin],Col*9,7));
      If Dado<>'' then
       Dado:=FloatToStr(StrToFloatDef(Dado,0)*10)
      else
       Dado:='0';
      While length(Dado)<>4 do Dado:=' '+Dado;
       Str:=Str+Dado;
      If Lin=15 then
      begin
       S.Add(Str+'   0');
       Str:='             ';
      end;
     end;
     S.Add(Str);
    end;//Fim do Ano
    Application.ProcessMessages;
   end;//fim dos anos
   S.Add('00000');
   S.SaveToFile(DirectoryListBox1.Directory+'\'+ExtractFileName(FileListBox1.Items[F])+'.PLU');
   ProgressBar1.Position:=ProgressBar1.Position+1;
  end;
  Screen.Cursor:=crDefault;
  ShowMessage('Fim');
 except
  Screen.Cursor:=crDefault;
  S.SaveToFile(DirectoryListBox1.Directory+'\'+ExtractFileName(FileListBox1.Items[F])+'.PLU');
  MessageDlg('Erro ao converter arquivo.',mtInformation,[mbOk],0);
 end;
end;

end.
