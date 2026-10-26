unit ICalcularPisCofinsServiceUnit; 

interface             

uses
  CalculoPisCofinsInputUnit,
  CalculoPisCofinsResultUnit;

type
  ICalcularPisCofinsService = interface
    ['{D17DAEAE-C044-48D6-ABA6-F418C25A7255}']
    function Executar(const Input: CalculoPisCofinsInput): CalculoPisCofinsResult;
  end;

implementation

end.
