unit OperacaoConsumoModelUnit;

interface

uses
  CompraGovernamentalModelUnit,
  TipoComunsUnit;

type
  /// <summary>
  ///   Representa os dados da operacao de consumo que influenciam o ROC,
  ///   atualmente com o grupo de compra governamental.
  ///   Equivale a OperacaoConsumoDomain.java (propriedade gCompraGov).
  /// </summary>
  // Java: source/src/main/java/br/gov/serpro/rtc/api/model/roc/OperacaoConsumoDomain.java
  OperacaoConsumoModel = record
  private
    FInstance: RecordInstance;
    FGCompraGov: CompraGovernamentalModel;
  public
    class function NullInstance(): OperacaoConsumoModel; static;
    class function Create(const GCompraGov: CompraGovernamentalModel): OperacaoConsumoModel; static;

    function IsNull(): Boolean;

    property GCompraGov: CompraGovernamentalModel read FGCompraGov;
  end;

implementation

{ OperacaoConsumoModel }

class function OperacaoConsumoModel.Create(const GCompraGov: CompraGovernamentalModel): OperacaoConsumoModel;
begin
  Result.FInstance := riNotNull;
  Result.FGCompraGov := GCompraGov;
end;

function OperacaoConsumoModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function OperacaoConsumoModel.NullInstance: OperacaoConsumoModel;
begin
  Result.FInstance := riNull;
  Result.FGCompraGov := CompraGovernamentalModel.NullInstance();
end;

end.
