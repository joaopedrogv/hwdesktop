unit GrupoFiscalMetadataUnit;

interface

uses
  EntityMetadataUnit;

type
  TGrupoFiscalMetadata = class
  public
    class function GetMetadata: EntityMetadata; static;
  end;

implementation

{ TGrupoFiscalMetadata }

class function TGrupoFiscalMetadata.GetMetadata: EntityMetadata;
begin
  Result := EntityMetadata.Create('Grupo Fiscal', 'GRUPOS_FISCAIS');

  // Atributos vinculados
  Result.RegisterField('Id', 'ID', 'ID');
  Result.RegisterField('SeqId', 'SEQID', 'Sequência');
  Result.RegisterField('Descricao', 'DESCRICAO', 'Descrição');
  Result.RegisterField('TipoTributo', 'TIPO_TRIBUTO', 'Tipo de tributo');
  Result.RegisterField('DataCadastro', 'DATA_CADASTRO', 'Data de cadastro');
  Result.RegisterField('DataAlteracao', 'DATA_ALTERACAO', 'Data de alteração');
  Result.RegisterField('Ativo', 'ATIVO', 'Ativo');
  Result.RegisterField('GeridoPeloSistema', 'GERIDO_SISTEMA', 'Gerido pelo sistema');
  Result.RegisterField('Anexo', 'ANEXO', 'Anexo');

  // Atributos sem vinculo com a tabela
  Result.RegisterAttributeOnly('EmpresasId', 'Empresas');

  // Campos da tabela sem vinculo com a classe
end;

end.