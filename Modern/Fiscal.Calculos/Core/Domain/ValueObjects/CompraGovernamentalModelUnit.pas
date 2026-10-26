unit CompraGovernamentalModelUnit;

interface

uses
  TipoComunsUnit,
  TipoEnteGovernamentalEnumUnit,
  TipoOperacaoGovernamentalEnumUnit;

type
  /// <summary>
  ///   Descreve os parametros de compra governamental da operacao, como ente
  ///   publico, redutor de aliquota e tipo de operacao.
  ///   Equivale a CompraGovernamentalDomain.java (pRedutor inicia em ZERO).
  /// </summary>
  // Java: source/src/main/java/br/gov/serpro/rtc/api/model/roc/CompraGovernamentalDomain.java
  CompraGovernamentalModel = record
  private
    FInstance: RecordInstance;
    FTpEnteGov: TipoEnteGovernamental;
    FPRedutor: Currency;
    FTpOperGov: TipoOperacaoGovernamental;
  public
    class function NullInstance(): CompraGovernamentalModel; static;
    class function Create(
      TpEnteGov: TipoEnteGovernamental;
      TpOperGov: TipoOperacaoGovernamental;
      PRedutor: Currency = 0
    ): CompraGovernamentalModel; static;

    function IsNull(): Boolean;

    property TpEnteGov: TipoEnteGovernamental read FTpEnteGov;
    property PRedutor: Currency read FPRedutor;
    property TpOperGov: TipoOperacaoGovernamental read FTpOperGov;
  end;

implementation

{ CompraGovernamentalModel }

class function CompraGovernamentalModel.Create(
  TpEnteGov: TipoEnteGovernamental;
  TpOperGov: TipoOperacaoGovernamental;
  PRedutor: Currency
): CompraGovernamentalModel;
begin
  Result.FInstance := riNotNull;
  Result.FTpEnteGov := TpEnteGov;
  Result.FPRedutor := PRedutor;
  Result.FTpOperGov := TpOperGov;
end;

function CompraGovernamentalModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function CompraGovernamentalModel.NullInstance: CompraGovernamentalModel;
begin
  Result.FInstance := riNull;
end;

end.
