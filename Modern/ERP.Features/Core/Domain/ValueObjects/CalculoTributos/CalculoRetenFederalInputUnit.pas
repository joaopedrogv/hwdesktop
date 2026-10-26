unit CalculoRetenFederalInputUnit;

interface

uses TipoRetencaoFederalPJEnumUnit;

type
  CalculoRetenFederalInput = record
  private
    FValorLiquidoCobrado: Currency;
    FAliqPis: Currency;
    FAliqCofins: Currency;
    FAliqIRRF: Currency;
    FAliqCSLL: Currency;
    FAliqCP: Currency;
  public
    class function Create(
      ValorLiquidoCobrado, AliqPis, AliqCofins, AliqIRRF, AliqCSLL, AliqCP: Currency
    ): CalculoRetenFederalInput; static;

    property ValorLiquidoCobrado: Currency read FValorLiquidoCobrado;
    property AliqPis: Currency read FAliqPis;
    property AliqCofins: Currency read FAliqCofins;
    property AliqIRRF: Currency read FAliqIRRF;
    property AliqCSLL: Currency read FAliqCSLL;
    property AliqCP: Currency read FAliqCP;
  end;

implementation

{ CalculoRetenFederalInput }

class function CalculoRetenFederalInput.Create(ValorLiquidoCobrado, AliqPis,
  AliqCofins, AliqIRRF, AliqCSLL, AliqCP: Currency): CalculoRetenFederalInput;
begin
  Result.FValorLiquidoCobrado := ValorLiquidoCobrado;
  Result.FAliqPis := AliqPis;
  Result.FAliqCofins := AliqCofins;
  Result.FAliqIRRF := AliqIRRF;
  Result.FAliqCSLL := AliqCSLL;
  Result.FAliqCP := AliqCP;
end;

end.
