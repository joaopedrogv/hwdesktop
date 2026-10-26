unit CalcularRetenFederalServiceUnit;

interface

uses
  ICalcularRetenFederalServiceUnit,
  CalculoRetenFederalInputUnit,
	CalculoRetenFederalResultUnit;

type
  CalcularRetenFederalService = class(TInterfacedObject, ICalcularRetenFederalService)
  public
		function Executar(const Input: CalculoRetenFederalInput): CalculoRetenFederalResult;
  end;

implementation

uses
  NumberServiceUnit;

{ CalcularRetenFederalService }

function CalcularRetenFederalService.Executar(
  const Input: CalculoRetenFederalInput): CalculoRetenFederalResult;
begin
	Result := CalculoRetenFederalResult.Create(
    NumberService.RoundHalfUpTo2( Input.ValorLiquidoCobrado * Input.AliqPis / 100 ),
    NumberService.RoundHalfUpTo2( Input.ValorLiquidoCobrado * Input.AliqCofins / 100 ),
    NumberService.RoundHalfUpTo2( Input.ValorLiquidoCobrado * Input.AliqIRRF / 100 ),
    NumberService.RoundHalfUpTo2( Input.ValorLiquidoCobrado * Input.AliqCSLL / 100 ),
    NumberService.RoundHalfUpTo2( Input.ValorLiquidoCobrado * Input.AliqCP / 100 )
  );
end;

end.
