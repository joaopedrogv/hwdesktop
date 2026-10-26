program ManutencaoArquivoCriptografadoAuxiliar;

uses
  Forms,
  uManutArqCript in 'uManutArqCript.pas' {frmManutencaoArqAuxCript};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmManutencaoArqAuxCript, frmManutencaoArqAuxCript);
  Application.Run;
end.
