unit CalculoPisCofinsResultUnit;

interface

type
  CalculoPisCofinsResult = record
  private
    FCSTPisCofins: string;
    FVBcOuQtde: Currency;
    FPPisOuReais, FValorPis: Currency;
    FPCofinsOuReais, FValorCofins: Currency;
  public
    class function Create(
      const CSTPisCofins: string;
      VBcOuQtde: Currency;
      PPisOuReais, ValorPis: Currency;
      PCofinsOuReais, ValorCofins: Currency
    ): CalculoPisCofinsResult; static;

    property CSTPisCofins: string read FCSTPisCofins;
    property VBcOuQtde: Currency read FVBcOuQtde;
    property PPisOuReais: Currency read FPPisOuReais;
    property ValorPis: Currency read FValorPis;
    property PCofinsOuReais: Currency read FPCofinsOuReais;
    property ValorCofins: Currency read FValorCofins;
  end;

implementation

{ CalculoPisCofinsResult }

class function CalculoPisCofinsResult.Create(
  const CSTPisCofins: string;
  VBcOuQtde: Currency;
  PPisOuReais, ValorPis: Currency;
  PCofinsOuReais, ValorCofins: Currency
): CalculoPisCofinsResult;
begin
  Result.FCSTPisCofins := CSTPisCofins;
  Result.FVBcOuQtde := VBcOuQtde;
  Result.FPPisOuReais := PPisOuReais;
  Result.FValorPis := ValorPis;
  Result.FPCofinsOuReais := PCofinsOuReais;
  Result.FValorCofins := ValorCofins;
end;

end.
