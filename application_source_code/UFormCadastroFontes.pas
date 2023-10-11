unit UFormCadastroFontes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids, DB, ADODB, ExtCtrls;

type
  TFormCadastroFontes = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Fontes: TADOTable;
    FontesSrc: TDataSource;
    FontesCodigoFonte: TAutoIncField;
    FontesNomeFonte: TStringField;
    FontesSigla: TStringField;
    FontesEndereco: TStringField;
    FontesCidade: TStringField;
    FontesUF: TStringField;
    FontesCEP: TStringField;
    FontesContato: TStringField;
    FontesFone: TStringField;
    Fontesemail: TStringField;
    FontesUrl: TStringField;
    FontesTipo: TStringField;
    FontesDtCadastro: TDateTimeField;
    FontesUsuarioCadastro: TStringField;
    FontesDtEdicao: TDateTimeField;
    FontesUsuarioEdicao: TStringField;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FontesNewRecord(DataSet: TDataSet);
    procedure FontesBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroFontes: TFormCadastroFontes;

implementation

 Uses DataModule;

{$R *.dfm}

procedure TFormCadastroFontes.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
 DBEdit2.SetFocus;
end;

procedure TFormCadastroFontes.FontesNewRecord(DataSet: TDataSet);
begin
 FontesUsuarioCadastro.AsString:=DM.CPF;
 FontesUsuarioEdicao.AsString:=DM.CPF;
end;

procedure TFormCadastroFontes.FontesBeforePost(DataSet: TDataSet);
begin
 FontesUsuarioEdicao.AsString:=DM.CPF;
 FontesDtEdicao.Value:=now();
end;

procedure TFormCadastroFontes.FormCreate(Sender: TObject);
begin
 Fontes.Open;
end;

procedure TFormCadastroFontes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Fontes.Close;
end;

end.
