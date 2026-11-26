unit ImpostoSeletivoInputUnit;

interface

uses TipoComunsUnit, CurrencyNullableUnit;

type
  ImpostoSeletivoInput = record
  private
    FInstance: RecordInstance;
    FCst: string;
    FCClassTrib: string;
    FBaseCalculo: CurrencyNullable;
    FQuantidade: CurrencyNullable;
    FUnidade: string;
    FImpostoInformado: CurrencyNullable;
  public
    class function NullInstance(): ImpostoSeletivoInput; static;
    class function Create(
      const Cst: string;
      const CClassTrib: string;
      const BaseCalculo: CurrencyNullable;
      const Quantidade: CurrencyNullable;
      const Unidade: string;
      const ImpostoInformado: CurrencyNullable
    ): ImpostoSeletivoInput; overload; static;

    class function Create(
      const Cst: string;
      const CClassTrib: string;
      BaseCalculo: Double;
      Quantidade: Double;
      const Unidade: string;
      ImpostoInformado: Double = 0.0
    ): ImpostoSeletivoInput; overload; static;

    function IsValid(): Boolean;
    function IsNull(): Boolean;
    function ValorImpostoSeletivoInformado: Currency;

    property Cst: string read FCst;
    property CClassTrib: string read FCClassTrib;
    property BaseCalculo: CurrencyNullable read FBaseCalculo write FBaseCalculo;
    property Quantidade: CurrencyNullable read FQuantidade;
    property Unidade: string read FUnidade;
    property ImpostoInformado: CurrencyNullable read FImpostoInformado;
  end;

implementation

uses
  SysUtils;

{ ImpostoSeletivoInput }

class function ImpostoSeletivoInput.Create(const Cst, CClassTrib: string; const BaseCalculo: CurrencyNullable;
  const Quantidade: CurrencyNullable; const Unidade: string;
  const ImpostoInformado: CurrencyNullable): ImpostoSeletivoInput;
begin
  Result.FInstance := riNotNull;
  Result.FCst := Cst;
  Result.FCClassTrib := CClassTrib;
  Result.FBaseCalculo := BaseCalculo;
  Result.FQuantidade := Quantidade;
  Result.FUnidade := Unidade;
  Result.FImpostoInformado := ImpostoInformado;
end;

class function ImpostoSeletivoInput.Create(const Cst, CClassTrib: string; BaseCalculo, Quantidade: Double;
  const Unidade: string; ImpostoInformado: Double): ImpostoSeletivoInput;
begin
  Result := ImpostoSeletivoInput.Create(
    Cst,
    CClassTrib,
    CurrencyNullable.Create(BaseCalculo),
    CurrencyNullable.Create(Quantidade),
    Unidade,
    CurrencyNullable.Create(ImpostoInformado)
  );
end;

function ImpostoSeletivoInput.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

function ImpostoSeletivoInput.IsValid: Boolean;
begin
  Result := (Trim(FCst) <> '') and
    (Trim(FCClassTrib) <> ''); // add mais se necessario
end;

function ImpostoSeletivoInput.ValorImpostoSeletivoInformado: Currency;
begin
  if FImpostoInformado.IsNull then
    Result := 0
  else
    Result := FImpostoInformado.Value;
end;

class function ImpostoSeletivoInput.NullInstance: ImpostoSeletivoInput;
begin
  Result.FInstance := riNull;
end;

end.