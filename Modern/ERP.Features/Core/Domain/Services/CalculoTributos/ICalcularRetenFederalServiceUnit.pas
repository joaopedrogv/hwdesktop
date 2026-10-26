unit ICalcularRetenFederalServiceUnit;

interface             

uses
  CalculoRetenFederalInputUnit,
  CalculoRetenFederalResultUnit;

type
	ICalcularRetenFederalService = interface
		['{F3AA098D-9723-49E0-BE9F-5A71CE83400F}']
		function Executar(const Input: CalculoRetenFederalInput): CalculoRetenFederalResult;
  end;

implementation

end.
