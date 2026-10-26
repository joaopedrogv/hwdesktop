unit ResultadoGrupoDiferimentoMonofasiaUnit;

interface

uses
  TipoComunsUnit;

type
  ResultadoGrupoDiferimentoMonofasia = record
  private
    FInstance: RecordInstance;
    FValorDiferimento: Currency;
    FPercentualDiferimento: Currency;
  public
    class function NullInstance(): ResultadoGrupoDiferimentoMonofasia; static;
    class function Create(
      ValorDiferimento: Currency;
      PercentualDiferimento: Currency
    ): ResultadoGrupoDiferimentoMonofasia; static;

    class function Merge(
      const G1: ResultadoGrupoDiferimentoMonofasia;
      const G2: ResultadoGrupoDiferimentoMonofasia
    ): ResultadoGrupoDiferimentoMonofasia; static;

    function IsNull(): Boolean;

    property ValorDiferimento: Currency read FValorDiferimento;
    property PercentualDiferimento: Currency read FPercentualDiferimento;
  end;

implementation

{ ResultadoGrupoDiferimentoMonofasia }

class function ResultadoGrupoDiferimentoMonofasia.Create(
  ValorDiferimento: Currency;
  PercentualDiferimento: Currency
): ResultadoGrupoDiferimentoMonofasia;
begin
  Result.FValorDiferimento := ValorDiferimento;
  Result.FPercentualDiferimento := PercentualDiferimento;
  Result.FInstance := riNotNull;
end;

function ResultadoGrupoDiferimentoMonofasia.IsNull(): Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function ResultadoGrupoDiferimentoMonofasia.Merge(
  const G1: ResultadoGrupoDiferimentoMonofasia;
  const G2: ResultadoGrupoDiferimentoMonofasia
): ResultadoGrupoDiferimentoMonofasia;
var
  P1, P2: Currency;
begin
  // Se G1 está vazio, retorna G2
  if G1.IsNull() then
  begin
    Result := G2;
    Exit;
  end;

  if G2.IsNull() then
  begin
    Result := G1;
    Exit;
  end;

  // Percentual: usa G1 se não for zero, senão usa G2
  P1 := G1.FPercentualDiferimento;
  P2 := G2.FPercentualDiferimento;
  if P1 = 0.00 then
    P1 := P2;

  // Valor: soma os valores
  Result := ResultadoGrupoDiferimentoMonofasia.Create(
    G1.FValorDiferimento + G2.FValorDiferimento,
    P1
  );
end;

class function ResultadoGrupoDiferimentoMonofasia.NullInstance: ResultadoGrupoDiferimentoMonofasia;
begin
  Result.FInstance := riNull;
end;

end.
