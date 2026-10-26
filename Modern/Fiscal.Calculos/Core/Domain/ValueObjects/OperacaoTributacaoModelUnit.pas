unit OperacaoTributacaoModelUnit;

interface

uses
  ItemCalculoInputUnit,
  TratamentoOperacaoModelUnit,
  TipoEnteGovernamentalEnumUnit;

type
  /// <summary>
  ///   Equivale a OperacaoModel.java
  /// </summary>
  // Java: source\src\main\java\br\gov\serpro\rtc\domain\service\calculotributo\model\OperacaoModel.java
  OperacaoTributacaoModel = record
  private
    FData: TDateTime;
    FCodigoMunicipio: Integer;
    FCodigoUF: Integer;
    FNCM: string;
    FNBS: string;
    FTpEnteGov: TipoEnteGovernamental;
    FPRedutor: Currency;
    FItem: ItemCalculoInput;
    FTratamentoClassificacao: TratamentoOperacaoModel;
  public
    class function Create(
      Data: TDateTime; CodigoMunicipio, CodigoUF: Integer;
      const NCM, NBS: string;
      const Item: ItemCalculoInput;
      const TratamentoClassificacao: TratamentoOperacaoModel;
      TpEnteGov: TipoEnteGovernamental = tegUnassigned;
      PRedutor: Currency = 0
    ): OperacaoTributacaoModel; static;

    property Data: TDateTime read FData write FData;
    property CodigoMunicipio: Integer read FCodigoMunicipio write FCodigoMunicipio;
    property CodigoUF: Integer read FCodigoUF write FCodigoUF;
    property NCM: string read FNCM write FNCM;
    property NBS: string read FNBS write FNBS;
    property TpEnteGov: TipoEnteGovernamental read FTpEnteGov write FTpEnteGov;
    property PRedutor: Currency read FPRedutor write FPRedutor;
    property Item: ItemCalculoInput read FItem write FItem;
    property TratamentoClassificacao: TratamentoOperacaoModel read FTratamentoClassificacao write FTratamentoClassificacao;
  end;

implementation

{ OperacaoTributacaoModel }

class function OperacaoTributacaoModel.Create(
  Data: TDateTime; CodigoMunicipio, CodigoUF: Integer;
  const NCM, NBS: string;
  const Item: ItemCalculoInput;
  const TratamentoClassificacao: TratamentoOperacaoModel;
  TpEnteGov: TipoEnteGovernamental;
  PRedutor: Currency
): OperacaoTributacaoModel;
begin
  Result.FData := Data;
  Result.FCodigoMunicipio := CodigoMunicipio;
  Result.FCodigoUF := CodigoUF;
  Result.FNCM := NCM;
  Result.FNBS := NBS;
  Result.FTpEnteGov := TpEnteGov;
  Result.FPRedutor := PRedutor;
  Result.FItem := Item;
  Result.FTratamentoClassificacao := TratamentoClassificacao;
end;

end.
