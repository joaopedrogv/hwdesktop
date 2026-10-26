unit ICalcularTributosNFSeServiceUnit;

interface

uses
  CalculoTributosNFSeInputUnit,
  CalculoTributosNFSeOutputUnit;

type
	ICalcularTributosNFSeService = interface
    ['{562A81BD-1904-4E7E-97EE-0098741F9A52}']
		function Executar(const Input: CalculoTributosNFSeInput): CalculoTributosNFSeOutput;
	end;

implementation

end.
