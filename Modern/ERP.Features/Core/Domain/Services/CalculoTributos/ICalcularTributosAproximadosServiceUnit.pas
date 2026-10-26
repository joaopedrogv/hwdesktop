unit ICalcularTributosAproximadosServiceUnit;

interface

uses
  CalcularTributosAproximadosTypesUnit;

type
  ICalcularTributosAproximadosService = interface
    ['{67CDA5E2-E6A2-40AD-9695-BFE8A6E17A0D}']
    function Executar(const Input: CalcularTributosAproximadosInput): CalcularTributosAproximadosResult; 
  end;

implementation

end.
