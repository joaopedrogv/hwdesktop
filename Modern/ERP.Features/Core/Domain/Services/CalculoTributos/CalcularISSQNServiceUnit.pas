unit CalcularISSQNServiceUnit;

interface

uses
  ICalcularISSQNServiceUnit,
  CalculoISSQNResultUnit;

type
  CalcularISSQNService = class(TInterfacedObject, ICalcularISSQNService)
  public
    function Executar(Aliquota, BaseCalculo: Currency): CalculoISSQNResult;
  end;

implementation

uses NumberServiceUnit;

{ CalcularISSQNService }

function CalcularISSQNService.Executar(
  Aliquota, BaseCalculo: Currency): CalculoISSQNResult;
begin
  Result := CalculoISSQNResult.Create(
    Aliquota,
    BaseCalculo,
    NumberService.RoundHalfUpTo2( Aliquota * BaseCalculo / 100 )
  );
end;

end.
