unit ResultadoGrupoEtapaMonofasiaUnit;

interface

uses TipoComunsUnit;

type
  ResultadoGrupoEtapaMonofasia = record
  private
    FInstance: RecordInstance;
    FQuantidade: Double;
    FAliquotaAdRem: Double;
    FValor: Double;
  public
    class function NullInstance(): ResultadoGrupoEtapaMonofasia; static;
    class function Create(
      Quantidade: Double;
      AliquotaAdRem: Double;
      Valor: Double
    ): ResultadoGrupoEtapaMonofasia; static;

    class function Merge(
      const G1: ResultadoGrupoEtapaMonofasia;
      const G2: ResultadoGrupoEtapaMonofasia
    ): ResultadoGrupoEtapaMonofasia; static;

    function IsNull(): Boolean;

    property Quantidade: Double read FQuantidade;
    property AliquotaAdRem: Double read FAliquotaAdRem;
    property Valor: Double read FValor;
  end;

implementation

{ ResultadoGrupoEtapaMonofasia }

class function ResultadoGrupoEtapaMonofasia.Create(
  Quantidade: Double;
  AliquotaAdRem: Double;
  Valor: Double
): ResultadoGrupoEtapaMonofasia;
begin
  Result.FQuantidade := Quantidade;
  Result.FAliquotaAdRem := AliquotaAdRem;
  Result.FValor := Valor;
  Result.FInstance := riNotNull;
end;

function ResultadoGrupoEtapaMonofasia.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function ResultadoGrupoEtapaMonofasia.Merge(
  const G1: ResultadoGrupoEtapaMonofasia;
  const G2: ResultadoGrupoEtapaMonofasia
): ResultadoGrupoEtapaMonofasia;
var
  Q1, Q2: Double;
  A1, A2: Double;
begin
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

  // Quantidade: usa G1 se não for zero, senão usa G2
  Q1 := G1.FQuantidade;
  Q2 := G2.FQuantidade;
  if Q1 = 0.00 then
    Q1 := Q2;

  // Aliquota: usa G1 se não for zero, senão usa G2
  A1 := G1.FAliquotaAdRem;
  A2 := G2.FAliquotaAdRem;
  if A1 = 0.00 then
    A1 := A2;

  // Valor: soma os valores
  Result := ResultadoGrupoEtapaMonofasia.Create(
    Q1,
    A1,
    G1.FValor + G2.FValor
  );
end;

class function ResultadoGrupoEtapaMonofasia.NullInstance: ResultadoGrupoEtapaMonofasia;
begin
  Result := ResultadoGrupoEtapaMonofasia.Create( 0, 0, 0 );
  Result.FInstance := riNull;
end;

end.
