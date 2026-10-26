unit ICalcularISSQNServiceUnit;

interface             

uses
  CalculoISSQNResultUnit;

type
  ICalcularISSQNService = interface
    ['{32CE40B4-34FF-4BA8-B583-D220F8F1D7D8}']
    function Executar(Aliquota, BaseCalculo: Currency): CalculoISSQNResult;
  end;

implementation

end.
