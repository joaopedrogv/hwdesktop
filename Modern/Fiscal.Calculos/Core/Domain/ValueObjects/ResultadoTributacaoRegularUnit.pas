unit ResultadoTributacaoRegularUnit;

interface

uses
  TipoComunsUnit;

type
  ResultadoTributacaoRegular = record
  private
    FInstance: RecordInstance;
    FCst: string;
    FCClassTrib: string;
    FBaseCalculo: Currency;
    FAliquotaEfetiva: Currency;
    FTributoDevido: Currency;
  public
    class function NullInstance(): ResultadoTributacaoRegular; static;
    class function Create(
      const Cst: string;
      const CClassTrib: string;
      BaseCalculo: Currency;
      AliquotaEfetiva: Currency;
      TributoDevido: Currency
    ): ResultadoTributacaoRegular; static;

    function IsNull(): Boolean;

    property Cst: string read FCst;
    property CClassTrib: string read FCClassTrib;
    property BaseCalculo: Currency read FBaseCalculo;
    property AliquotaEfetiva: Currency read FAliquotaEfetiva;
    property TributoDevido: Currency read FTributoDevido;
  end;

implementation

{ ResultadoTributacaoRegular }

class function ResultadoTributacaoRegular.Create(
  const Cst: string;
  const CClassTrib: string;
  BaseCalculo: Currency;
  AliquotaEfetiva: Currency;
  TributoDevido: Currency
): ResultadoTributacaoRegular;
begin
  Result.FInstance := riNotNull;
  Result.FCst := Cst;
  Result.FCClassTrib := CClassTrib;
  Result.FBaseCalculo := BaseCalculo;
  Result.FAliquotaEfetiva := AliquotaEfetiva;
  Result.FTributoDevido := TributoDevido;
end;

function ResultadoTributacaoRegular.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function ResultadoTributacaoRegular.NullInstance: ResultadoTributacaoRegular;
begin
  Result.FInstance := riNull;
end;

end.
