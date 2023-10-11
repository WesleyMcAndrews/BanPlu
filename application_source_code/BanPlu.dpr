program BanPlu;

uses
  Forms,
  UFormMain in 'UFormMain.pas' {MainForm},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  UFormCarregaPLU in 'UFormCarregaPLU.pas' {FormCarregaPLU},
  Load in 'Load.pas' {SplashForm},
  UShowProgressDlg in 'UShowProgressDlg.pas' {ShowProgressDlg},
  UFormDetalheEstacao in 'UFormDetalheEstacao.pas' {FormDetalheEstacao},
  UFormAnalisarEstacao in 'UFormAnalisarEstacao.pas' {FormAnalisarEstacao},
  UFormRelSumario in 'UFormRelSumario.pas' {FormRelSumario},
  UFormExportarChuva in 'UFormExportarChuva.pas' {FormExportarChuva},
  UFormExportarSpring in 'UFormExportarSpring.pas' {FormExportarSpring},
  UFormEditarEstacao in 'UFormEditarEstacao.pas' {FormEditarEstacao},
  UFormCadastroFontes in 'UFormCadastroFontes.pas' {FormCadastroFontes},
  UFormDetalheAno in 'UFormDetalheAno.pas' {FormDetalheAno};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TShowProgressDlg, ShowProgressDlg);
  Application.CreateForm(TFormCarregaPLU, FormCarregaPLU);
  Application.Run;
end.
