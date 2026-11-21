unit EventoDFe211130ItemMetadataUnit;

interface

uses
  EntityMetadataUnit;

type
  TEventoDFe211130ItemMetadata = class
  public
    class function GetMetadata: EntityMetadata; static;
  end;

implementation

{ TEventoDFe211130ItemMetadata }

class function TEventoDFe211130ItemMetadata.GetMetadata: EntityMetadata;
begin
  Result := EntityMetadata.Create('Item do evento DF-e 211130');

  Result.RegisterAttributeOnly('NItem', 'nItem');
  Result.RegisterAttributeOnly('VIbs', 'Valor IBS');
  Result.RegisterAttributeOnly('VCbs', 'Valor CBS');
  Result.RegisterAttributeOnly('QImobilizado', 'Quantidade imobilizada');
  Result.RegisterAttributeOnly('UImobilizado', 'Unidade');
end;

end.