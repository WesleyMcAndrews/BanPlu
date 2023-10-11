unit UFormEditarEstacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DBCtrls;

type
  TFormEditarEstacao = class(TForm)
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    NomeEdit: TEdit;
    AltitudeEdit: TEdit;
    LatGEdit: TEdit;
    LatMEdit: TEdit;
    LatSEdit: TEdit;
    LongGEdit: TEdit;
    LongMEdit: TEdit;
    LongSEdit: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    UFsCombo: TComboBox;
    Label11: TLabel;
    FonteCombo: TDBLookupComboBox;
    Label12: TLabel;
    MunicCombo: TDBLookupComboBox;
    procedure NomeEditChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure LatGEditKeyPress(Sender: TObject; var Key: Char);
    procedure AltitudeEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditarEstacao: TFormEditarEstacao;

implementation

uses DataModule;

{$R *.dfm}

procedure TFormEditarEstacao.NomeEditChange(Sender: TObject);
begin
 BitBtn1.Enabled:=(UFsCombo.Text<>'') and (NomeEdit.Text<>'') and (LatGEdit.Text<>'') and (LatMEdit.Text<>'') and (LatSEdit.Text<>'')
 and (LongGEdit.Text<>'') and (LongMEdit.Text<>'') and (LongSEdit.Text<>'') and (AltitudeEdit.Text<>'')
 and (FonteCombo.Text<>'') and (MunicCombo.Text<>'');
end;

procedure TFormEditarEstacao.BitBtn1Click(Sender: TObject);
Var
 Codigo:String;
begin
 If (StrToInt(LatGEdit.Text)>59) or (StrToInt(LatMEdit.Text)>59) or (StrToInt(LatSEdit.Text)>59)
 or (StrToInt(LongGEdit.Text)>59) or (StrToInt(LongMEdit.Text)>59) or (StrToInt(LongSEdit.Text)>59) then
 begin
  MessageDlg('Verifique os valores de Latitude e Longitude.',mtInformation,[mbOk],0);
  Exit; 
 end;
 If MessageDlg('Confirma a gravação dos dados desta estação?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 With DM.Query1 do
 begin
  Codigo:=DM.SumarioCodigoEstacao.AsString;
  SQl.Clear;
  SQl.Add('Update Estacoes');
  SQl.Add('Set NomeEstacao='+QuotedStr(NomeEdit.Text));
  SQl.Add(',UF='+QuotedStr(UFsCombo.Text));
  SQl.Add(',LatG='+QuotedStr(FormatFloat('00',StrToInt(LatGEdit.Text))));
  SQl.Add(',LatM='+QuotedStr(FormatFloat('00',StrToInt(LatMEdit.Text))));
  SQl.Add(',LatS='+QuotedStr(FormatFloat('00',StrToInt(LatSEdit.Text))));
  SQl.Add(',LongG='+QuotedStr(FormatFloat('00',StrToInt(LongGEdit.Text))));
  SQl.Add(',LongM='+QuotedStr(FormatFloat('00',StrToInt(LongMEdit.Text))));
  SQl.Add(',LongS='+QuotedStr(FormatFloat('00',StrToInt(LongSEdit.Text))));
  Sql.Add(',Altitude='+AltitudeEdit.Text);
  SQl.Add(',CodigoFonte='+IntToStr(FonteCombo.KeyValue));
  SQl.Add(',CodigoMunicipio='+QuotedStr(MunicCombo.KeyValue));
  SQl.Add('Where CodigoEstacao='+QuotedStr(DM.SumarioCodigoEstacao.AsString));
  try
   ExecSQl;
   DM.Sumario.Close;
   DM.Sumario.Open;
   DM.Sumario.Locate('CodigoEstacao',Codigo,[]);
  except
   MessageDlg('Erro ao gravar os dados. Verifique.',mtInformation,[mbOk],0);
  end;
 end;
end;

procedure TFormEditarEstacao.LatGEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 If not (Key in ['0'..'9',chr(8),chr(13),'-']) then
 Key:=#0;
end;

procedure TFormEditarEstacao.AltitudeEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 If not (Key in ['0'..'9','.',chr(8),chr(13)]) then
 Key:=#0;
end;

procedure TFormEditarEstacao.FormCreate(Sender: TObject);
begin
 DM.Fontes.Open;
 DM.Municipios.Open;
end;

procedure TFormEditarEstacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DM.Fontes.Close;
 DM.Municipios.Close;
end;

end.
