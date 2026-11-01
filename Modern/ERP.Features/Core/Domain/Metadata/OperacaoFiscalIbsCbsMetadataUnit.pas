unit OperacaoFiscalIbsCbsMetadataUnit;

interface

uses
  EntityMetadataUnit;

type
  TOperacaoFiscalIbsCbsMetadata = class
  public
    class function GetMetadata: EntityMetadata; static;
  end;

implementation

{ TOperacaoFiscalIbsCbsMetadata }

class function TOperacaoFiscalIbsCbsMetadata.GetMetadata: EntityMetadata;
begin
  Result := EntityMetadata.Create('Operação Fiscal IBS/CBS', 'OP_FISCAIS_IBSCBS');

  // Atributos vinculados
  Result.RegisterField('Id', 'ID', 'ID');
  Result.RegisterField('OperacaoInternaId', 'OP_INTERNA_ID', 'Operação Interna');
  Result.RegisterField('RegraFiscalId', 'REGRA_FISCAL_ID', 'Regra Fiscal');
  Result.RegisterField('GrupoFiscalId', 'GRUPO_FISCAL_ID', 'Grupo Fiscal');
  Result.RegisterField('InicioVigencia', 'DATA_INI_VIGENCIA', 'Início da vigência');
  Result.RegisterField('FimVigencia', 'DATA_FIM_VIGENCIA', 'Fim da vigência');
  Result.RegisterField('DataCadastro', 'DATA_CADASTRO', 'Data de cadastro');
  Result.RegisterField('DataAlteracao', 'DATA_ALTERACAO', 'Data de alteração');
  Result.RegisterField('Ativo', 'ATIVO', 'Ativo');

  // Atributos sem vinculo com a tabela

  // Campos da tabela sem vinculo com a classe
end;

end.
