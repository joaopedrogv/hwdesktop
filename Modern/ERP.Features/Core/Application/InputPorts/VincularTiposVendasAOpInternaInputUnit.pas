unit VincularTiposVendasAOpInternaInputUnit;

interface

uses
  OpInternaTpVendaVinculoModelUnit,
  BooleanNullableUnit;

type
  VincularTiposVendasAOpInternaInput = record
  private
    FOpInternaId: string;
    FTiposVendas: OpInternaTpVendaVinculoModelArray;
  public
    class function Create(
      const OpInternaId: string;
      const TiposVendas: OpInternaTpVendaVinculoModelArray
    ): VincularTiposVendasAOpInternaInput; static;

    property OpInternaId: string read FOpInternaId;
    property TiposVendas: OpInternaTpVendaVinculoModelArray read FTiposVendas;
  end;

implementation


{ VincularTiposVendasAOpInternaInput }

class function VincularTiposVendasAOpInternaInput.Create(
  const OpInternaId: string;
  const TiposVendas: OpInternaTpVendaVinculoModelArray
): VincularTiposVendasAOpInternaInput;
begin
  Result.FOpInternaId := OpInternaId;
  Result.FTiposVendas := TiposVendas;
end;

end.
