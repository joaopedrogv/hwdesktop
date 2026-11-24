unit EventoDFe112150MetadataUnit;

interface

uses
  EntityMetadataUnit;

type
  TEventoDFe112150Metadata = class
  public
    class function GetMetadata: EntityMetadata; static;
  end;

implementation

{ TEventoDFe112150Metadata }

class function TEventoDFe112150Metadata.GetMetadata: EntityMetadata;
begin
  Result := EntityMetadata.Create('Evento DF-e 112150', 'EVENTOS_DFE');

  Result.RegisterField('Id', 'ID', 'ID');
  Result.RegisterField('SeqId', 'SEQID', 'Código');
  Result.RegisterField('FamiliaDocumento', 'FAMILIA_DOCUMENTO', 'Documento');
  Result.RegisterField('TipoEvento', 'TIPO_EVENTO', 'Tipo de evento');
  Result.RegisterField('ChaveDocumento', 'CHAVE_DOCUMENTO', 'Chave da NF-e');
  Result.RegisterField('Ativo', 'ATIVO', 'Situação');
  Result.RegisterField('DataPrevisaoEntrega', 'DATA_PREVISAO_ENTREGA',
    'Data de previsão de entrega');
end;

end.
