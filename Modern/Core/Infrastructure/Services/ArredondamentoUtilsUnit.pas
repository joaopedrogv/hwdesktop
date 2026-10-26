unit ArredondamentoUtilsUnit;

interface

uses
  CurrencyNullableUnit,
  DoubleNullableUnit;

type
  /// <summary>
  ///   Utilitario centralizado de arredondamento para a Calculadora de Tributos da RTC.
  ///   Espelho de ArredondamentoUtils.java: todos os calculos intermediarios usam
  ///   precisao de 8 casas decimais e arredondamento HALF_EVEN (arredondamento bancario).
  /// </summary>
  ArredondamentoUtils = class
  public
    const
      /// <summary>Precisao usada em TODOS os calculos intermediarios (8 casas decimais).</summary>
      PRECISAO_INTERNA = 8;

    // ─── Primitivas em Double (8 casas, HALF_EVEN) ────────────────────────────

    /// <summary>Aplica arredondamento interno (8 casas, HALF_EVEN) a um valor.</summary>
    class function ArredondarInterno(Value: Double): Double; overload; static;

    /// <summary>Divide o valor por 100 com precisao interna (8 casas, HALF_EVEN).</summary>
    class function DividirPorCem(Value: Double): Double; overload; static;

    /// <summary>Divisao com precisao interna (8 casas, HALF_EVEN).</summary>
    class function Dividir(Dividendo, Divisor: Double): Double; overload; static;

    /// <summary>Multiplicacao com precisao interna (8 casas, HALF_EVEN).</summary>
    class function Multiplicar(V1, V2: Double): Double; overload; static;

    /// <summary>Subtracao com precisao interna (8 casas, HALF_EVEN).</summary>
    class function Subtrair(V1, V2: Double): Double; overload; static;

    // ─── Overloads null-safe para CurrencyNullable (null -> null, sem excecao) ─

    class function ArredondarInterno(Value: CurrencyNullable): CurrencyNullable; overload; static;
    class function DividirPorCem(Value: CurrencyNullable): CurrencyNullable; overload; static;
    class function Dividir(Dividendo, Divisor: CurrencyNullable): CurrencyNullable; overload; static;
    class function Multiplicar(V1, V2: CurrencyNullable): CurrencyNullable; overload; static;
    class function Subtrair(V1, V2: CurrencyNullable): CurrencyNullable; overload; static;

    // ─── Overloads null-safe para DoubleNullable (null -> null, sem excecao) ───

    class function ArredondarInterno(Value: DoubleNullable): DoubleNullable; overload; static;
    class function DividirPorCem(Value: DoubleNullable): DoubleNullable; overload; static;
    class function Dividir(Dividendo, Divisor: DoubleNullable): DoubleNullable; overload; static;
    class function Multiplicar(V1, V2: DoubleNullable): DoubleNullable; overload; static;
    class function Subtrair(V1, V2: DoubleNullable): DoubleNullable; overload; static;
  end;

implementation

uses
  NumberServiceUnit;

{ ArredondamentoUtils — Double }

class function ArredondamentoUtils.ArredondarInterno(Value: Double): Double;
begin
  Result := NumberService.RoundHalfEvenTo8(Value);
end;

class function ArredondamentoUtils.DividirPorCem(Value: Double): Double;
begin
  Result := NumberService.RoundHalfEvenTo8(Value / 100);
end;

class function ArredondamentoUtils.Dividir(Dividendo, Divisor: Double): Double;
begin
  Result := NumberService.RoundHalfEvenTo8(Dividendo / Divisor);
end;

class function ArredondamentoUtils.Multiplicar(V1, V2: Double): Double;
begin
  Result := NumberService.RoundHalfEvenTo8(V1 * V2);
end;

class function ArredondamentoUtils.Subtrair(V1, V2: Double): Double;
begin
  Result := NumberService.RoundHalfEvenTo8(V1 - V2);
end;

{ ArredondamentoUtils — CurrencyNullable }

class function ArredondamentoUtils.ArredondarInterno(Value: CurrencyNullable): CurrencyNullable;
begin
  if Value.IsNull then
    Result := CurrencyNullable.NullInstance()
  else
    Result := CurrencyNullable.Create(NumberService.RoundHalfEvenTo8(Value.Value));
end;

class function ArredondamentoUtils.DividirPorCem(Value: CurrencyNullable): CurrencyNullable;
begin
  if Value.IsNull then
    Result := CurrencyNullable.NullInstance()
  else
    Result := CurrencyNullable.Create(NumberService.RoundHalfEvenTo8(Value.Value / 100));
end;

class function ArredondamentoUtils.Dividir(Dividendo, Divisor: CurrencyNullable): CurrencyNullable;
begin
  if Dividendo.IsNull or Divisor.IsNull then
    Result := CurrencyNullable.NullInstance()
  else
    Result := CurrencyNullable.Create(NumberService.RoundHalfEvenTo8(Dividendo.Value / Divisor.Value));
end;

class function ArredondamentoUtils.Multiplicar(V1, V2: CurrencyNullable): CurrencyNullable;
begin
  if V1.IsNull or V2.IsNull then
    Result := CurrencyNullable.NullInstance()
  else
    Result := CurrencyNullable.Create(NumberService.RoundHalfEvenTo8(V1.Value * V2.Value));
end;

class function ArredondamentoUtils.Subtrair(V1, V2: CurrencyNullable): CurrencyNullable;
begin
  if V1.IsNull or V2.IsNull then
    Result := CurrencyNullable.NullInstance()
  else
    Result := CurrencyNullable.Create(NumberService.RoundHalfEvenTo8(V1.Value - V2.Value));
end;

{ ArredondamentoUtils — DoubleNullable }

class function ArredondamentoUtils.ArredondarInterno(Value: DoubleNullable): DoubleNullable;
begin
  if Value.IsNull then
    Result := DoubleNullable.NullInstance()
  else
    Result := DoubleNullable.Create(NumberService.RoundHalfEvenTo8(Value.Value));
end;

class function ArredondamentoUtils.DividirPorCem(Value: DoubleNullable): DoubleNullable;
begin
  if Value.IsNull then
    Result := DoubleNullable.NullInstance()
  else
    Result := DoubleNullable.Create(NumberService.RoundHalfEvenTo8(Value.Value / 100));
end;

class function ArredondamentoUtils.Dividir(Dividendo, Divisor: DoubleNullable): DoubleNullable;
begin
  if Dividendo.IsNull or Divisor.IsNull then
    Result := DoubleNullable.NullInstance()
  else
    Result := DoubleNullable.Create(NumberService.RoundHalfEvenTo8(Dividendo.Value / Divisor.Value));
end;

class function ArredondamentoUtils.Multiplicar(V1, V2: DoubleNullable): DoubleNullable;
begin
  if V1.IsNull or V2.IsNull then
    Result := DoubleNullable.NullInstance()
  else
    Result := DoubleNullable.Create(NumberService.RoundHalfEvenTo8(V1.Value * V2.Value));
end;

class function ArredondamentoUtils.Subtrair(V1, V2: DoubleNullable): DoubleNullable;
begin
  if V1.IsNull or V2.IsNull then
    Result := DoubleNullable.NullInstance()
  else
    Result := DoubleNullable.Create(NumberService.RoundHalfEvenTo8(V1.Value - V2.Value));
end;

end.
