unit UFormDetalheEstacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DBCtrls;

type
  TFormDetalheEstacao = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    DBText2: TDBText;
    Label3: TLabel;
    DBText3: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    Label5: TLabel;
    DBText5: TDBText;
    DBNavigator1: TDBNavigator;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDetalheEstacao: TFormDetalheEstacao;

implementation

 Uses DataModule, UFormDetalheAno;

{$R *.dfm}

procedure TFormDetalheEstacao.FormCreate(Sender: TObject);
begin
 DM.Detalhe.Open;
end;

procedure TFormDetalheEstacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DM.Detalhe.Close;
end;

procedure TFormDetalheEstacao.SpeedButton1Click(Sender: TObject);
begin
 Close;
end;

procedure TFormDetalheEstacao.SpeedButton2Click(Sender: TObject);
begin
 With TFormDetalheAno.Create(Self) do
 try
  Caption:='Detalhe do Ano de '+DM.DetalheAno.AsString+' da Estação '+DM.SumarioNomeEstacao.AsString;
  ShowModal;
 finally
  free;
 end;
end;

end.
