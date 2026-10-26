unit CalculoPisCofinsInputUnit;

interface

type
  CalculoPisCofinsInput = record
  private
    FCSTPisCofins: string;
    FValorLiquidoCobrado: Currency;
    FQtdeItem: Currency;
    FValorIpi: Currency;
    FValorIcms: Currency;
    FPPisOuReais: Currency;
    FPCofinsOuReais: Currency;
  public                    
    class function Create(
      const CSTPisCofins: string;
      ValorLiquidoCobrado, QtdeItem, ValorIpi, ValorIcms, PPisOuReais, PCofinsOuReais: Currency
    ): CalculoPisCofinsInput; static;

    property CSTPisCofins: string read FCSTPisCofins;
    property ValorLiquidoCobrado: Currency read FValorLiquidoCobrado;
    property QtdeItem: Currency read FQtdeItem;
    property ValorIpi: Currency read FValorIpi;
    property ValorIcms: Currency read FValorIcms;
    property PPisOuReais: Currency read FPPisOuReais;
    property PCofinsOuReais: Currency read FPCofinsOuReais;
  end;

implementation

{ CalculoPisCofinsInput }

class function CalculoPisCofinsInput.Create(const CSTPisCofins: string;
  ValorLiquidoCobrado, QtdeItem, ValorIpi, ValorIcms, PPisOuReais,
  PCofinsOuReais: Currency): CalculoPisCofinsInput;
begin
  Result.FCSTPisCofins := CSTPisCofins;
  Result.FValorLiquidoCobrado := ValorLiquidoCobrado;
  Result.FQtdeItem := QtdeItem;
  Result.FValorIpi := ValorIpi;
  Result.FValorIcms := ValorIcms;
  Result.FPPisOuReais := PPisOuReais;
  Result.FPCofinsOuReais := PCofinsOuReais;
end;

end.
