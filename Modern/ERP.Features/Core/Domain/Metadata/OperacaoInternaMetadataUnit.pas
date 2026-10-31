unit OperacaoInternaMetadataUnit;

interface

uses
  EntityMetadataUnit;

type
  TOperacaoInternaMetadata = class
  public
    class function GetMetadata: EntityMetadata; static;
  end;

implementation

{ TOperacaoInternaMetadata }

class function TOperacaoInternaMetadata.GetMetadata: EntityMetadata;
begin
  Result := EntityMetadata.Create('Operação Interna', 'OP_INTERNAS');

  // Atributos vinculados
  Result.RegisterField('Id', 'ID', 'ID');
  Result.RegisterField('SeqId', 'SEQID', 'Sequência');
  Result.RegisterField('Descricao', 'DESCRICAO', 'Descrição');
  Result.RegisterField('DataCadastro', 'DATA_CADASTRO', 'Data de cadastro');
  Result.RegisterField('DataAlteracao', 'DATA_ALTERACAO', 'Data de alteração');
  Result.RegisterField('Ativo', 'ATIVO', 'Ativo');

  // Atributos sem vinculo com a tabela
  Result.RegisterAttributeOnly('EmpresasId', 'Empresas');

  // Campos da tabela sem vinculo com a classe
end;

end.
