unit CompraGovernamentalInputUnit;

interface

uses
  TipoComunsUnit,
  TipoEnteGovernamentalEnumUnit,
  TipoOperacaoGovernamentalEnumUnit;

type
  /// <summary>
  ///   Entrada que encapsula os dados de compra governamental usados nas regras
  ///   tributarias da operacao. Informa o tipo de ente publico envolvido e o tipo
  ///   de operacao governamental. Equivale a CompraGovernamentalInput.java.
  /// </summary>
  CompraGovernamentalInput = record
  private
    FInstance: RecordInstance;
    FTpEnteGov: TipoEnteGovernamental;
    FTpOperGov: TipoOperacaoGovernamental;
  public
    class function NullInstance(): CompraGovernamentalInput; static;
    class function Create(
      TpEnteGov: TipoEnteGovernamental;
      TpOperGov: TipoOperacaoGovernamental
    ): CompraGovernamentalInput; static;

    function IsNull(): Boolean;
    /// <summary>Os campos tpEnteGov e tpOperGov sao obrigatorios (espelho de @NotNull).</summary>
    function IsValid(): Boolean;

    property TpEnteGov: TipoEnteGovernamental read FTpEnteGov;
    property TpOperGov: TipoOperacaoGovernamental read FTpOperGov;
  end;

implementation

{ CompraGovernamentalInput }

class function CompraGovernamentalInput.Create(
  TpEnteGov: TipoEnteGovernamental;
  TpOperGov: TipoOperacaoGovernamental
): CompraGovernamentalInput;
begin
  Result.FInstance := riNotNull;
  Result.FTpEnteGov := TpEnteGov;
  Result.FTpOperGov := TpOperGov;
end;

function CompraGovernamentalInput.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

function CompraGovernamentalInput.IsValid: Boolean;
begin
  Result := (FTpEnteGov <> tegUnassigned) and (FTpOperGov <> togUnassigned);
end;

class function CompraGovernamentalInput.NullInstance: CompraGovernamentalInput;
begin
  Result.FInstance := riNull;
end;

end.
