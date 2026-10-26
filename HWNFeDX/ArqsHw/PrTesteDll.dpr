program PrTesteDll;

uses
  Forms,
  UformTeste in 'UformTeste.pas' {frmTestes_DFe},
  hw_utils in '..\..\Ativos\fonte\hw_utils.pas',
  hw_win_utils in '..\..\Ativos\fonte\hw_win_utils.pas',
  USock in '..\..\Utils\USock.pas',
  DFeDLLHeader in '..\..\Modern\ERP.Features\Adapters\Secondary\DFeDLL\DFeDLLHeader.pas',
  DFeDLLAdapterUnit in '..\..\Modern\ERP.Features\Adapters\Secondary\DFeDLL\DFeDLLAdapterUnit.pas',
  ResultadoOperacaoDFeUnit in '..\..\Modern\ERP.Features\Core\Domain\Types\DFe\ResultadoOperacaoDFeUnit.pas',
  TipoComunsUnit in '..\..\Modern\Core\Domain\Types\Shared\TipoComunsUnit.pas',
  StringServiceUnit in '..\..\Modern\Core\Infrastructure\Services\StringServiceUnit.pas',
  ITokenEncryptorUnit in '..\..\Modern\Core\Domain\Ports\Services\Shared\ITokenEncryptorUnit.pas',
  ITokenDecryptorUnit in '..\..\Modern\Core\Domain\Ports\Services\Shared\ITokenDecryptorUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTestes_DFe, frmTestes_DFe);
  Application.Run;
end.
