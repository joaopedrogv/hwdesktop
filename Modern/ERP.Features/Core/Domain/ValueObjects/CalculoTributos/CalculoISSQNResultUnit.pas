unit CalculoISSQNResultUnit;

interface

type
  CalculoISSQNResult = record
  private
    FAliquota, FBaseCalculo, FValorISSQN: Currency;
  public
    class function Create(
      Aliquota, BaseCalculo, ValorISSQN: Currency
    ): CalculoISSQNResult; static;

    property Aliquota: Currency read FAliquota;
    property BaseCalculo: Currency read FBaseCalculo;
    property ValorISSQN: Currency read FValorISSQN;
  end;

implementation  

{ CalculoISSQNResult }

class function CalculoISSQNResult.Create(Aliquota, BaseCalculo,
  ValorISSQN: Currency): CalculoISSQNResult;
begin
  Result.FAliquota := Aliquota;
  Result.FBaseCalculo := BaseCalculo;
  Result.FValorISSQN := ValorISSQN;
end;

end.
