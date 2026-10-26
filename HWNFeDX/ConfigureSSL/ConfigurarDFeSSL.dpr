program ConfigurarDFeSSL;

uses
  Vcl.Forms,
  FormHelperDFe in 'FormHelperDFe.pas' {FrmHelperDFe},
  hw_utils in '..\..\Ativos\fonte\hw_utils.pas',
  hw_win_utils in '..\..\Ativos\fonte\hw_win_utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmHelperDFe, FrmHelperDFe);
  Application.Run;
end.
