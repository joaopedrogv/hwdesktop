unit ICalculadorROCServiceUnit;

interface

uses
  CalcularTributoInputUnit,
  ROCDomainUnit;

type
  ICalculadorROCService = interface
     ['{950F1A98-16EC-49A1-8945-470CA73E1F85}']
    function Executar(const Input: CalcularTributoInput): ROCDomain;
  end;

implementation

end.
