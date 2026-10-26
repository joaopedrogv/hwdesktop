program HwSistemas;

{%TogetherDiagram 'ModelSupport_HwSistemas\default.txaPackage'}

uses
  Forms,
  Classes,
  SysUtils,
  XPMan,
  Dialogs,
  funcoes in 'funcoes.pas';

{$R *.res}
var
  frPrincipal: TForm;
  frDataModule: TDataModule;
  hndlfrmPrincpal, hndlDataModule: THandle;
  XPManifest1: TXPManifest;

begin
  if ParamStr(1) <> '' then
    frPrincipal := Funcoes.AbreForm(ParamStr(1), ParamStr(2), hndlfrmPrincpal)
  else if verificaArquivoIni then
    frPrincipal := Funcoes.AbreForm(nomePacote, nomeForm, hndlfrmPrincpal)
  else
  begin
    MessageDlg('Sistema não pode ser carregado!' + #13 + 'Sem Parâmetros para inicialização ',
      mtWarning, [mbOK], 0);
    Application.Terminate;
    exit;
  end;
  try
    frPrincipal.ShowModal;
  finally
    frPrincipal.Free;
    unLoadPackage(hndlfrmPrincpal);
  end;
end.

