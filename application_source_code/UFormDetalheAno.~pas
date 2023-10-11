unit UFormDetalheAno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DBCtrls;

type
  TFormDetalheAno = class(TForm)
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDetalheAno: TFormDetalheAno;

implementation

 Uses DataModule;

{$R *.dfm}

procedure TFormDetalheAno.FormCreate(Sender: TObject);
begin
 DM.Ano.Open;
end;

procedure TFormDetalheAno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DM.Ano.Close;
end;

end.
