unit EventoDFe211130MetadataUnit;

interface

uses
  EntityMetadataUnit;

type
  TEventoDFe211130Metadata = class
  public
    class function GetMetadata: EntityMetadata; static;
  end;

implementation

{ TEventoDFe211130Metadata }

class function TEventoDFe211130Metadata.GetMetadata: EntityMetadata;
begin
  Result := EntityMetadata.Create('Evento DF-e 211130', 'EVENTOS_DFE');

  Result.RegisterField('Id', 'ID', 'ID');
  Result.RegisterField('SeqId', 'SEQID', 'Código');
  Result.RegisterField('FamiliaDocumento', 'FAMILIA_DOCUMENTO', 'Documento');
  Result.RegisterField('TipoEvento', 'TIPO_EVENTO', 'Tipo de evento');
  Result.RegisterField('ChaveDocumento', 'CHAVE_DOCUMENTO', 'Chave da NF-e');
  Result.RegisterField('Ativo', 'ATIVO', 'Situação');
  Result.RegisterAttributeOnly('Itens', 'Itens do evento');
end;

end.
