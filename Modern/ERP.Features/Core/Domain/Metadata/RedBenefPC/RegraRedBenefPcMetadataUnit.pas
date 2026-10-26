unit RegraRedBenefPcMetadataUnit;

interface

uses
  Classes, SysUtils, EntityMetadataUnit;

type
  RegraRedBenefPcMetadata = class
  public
    class function GetMetadata: EntityMetadata; static;
  end;

implementation

{ RegraAjustePcLC214Metadata }

class function RegraRedBenefPcMetadata.GetMetadata: EntityMetadata;
begin
  Result := EntityMetadata.Create('Regra Ajuste PC LC 224', 'REGRAS_REDBENEF_PC');

  // Atributos vinculados
  Result.RegisterField('Id'                        , 'ID'               , 'ID da Regra');
  Result.RegisterField('SeqId'                     , 'SEQID'            , 'Código sequencial');
  Result.RegisterField('Cst'                       , 'CST'              , 'Código da Situação Tributária');
  Result.RegisterField('Descricao'                 , 'DESCRICAO'        , 'Descrição da Regra');
  Result.RegisterField('PercReducao'               , 'PRED'             , 'Percentual Redução');
  Result.RegisterField('IndAjusteEFD'              , 'IND_AJ'           , 'Indicador de Ajuste EFD');
  Result.RegisterField('CodAjusteEFD'              , 'COD_AJ'           , 'Código do Ajuste EFD');
  Result.RegisterField('DescricaoAjusteEFD'        , 'DESCR_AJ'         , 'Descrição do Ajuste EFD');
  Result.RegisterField('InfComplementarAjusteEFD'  , 'INF_COMPL_AJ'     , 'Informação Complementar do Ajuste EFD');
  Result.RegisterField('CodContaContabil'          , 'COD_CTA'          , 'Código conta contábil do PISCOFINS');
  Result.RegisterField('InicioVigencia'            , 'DATA_INI_VIGENCIA', 'Inicio da Vigencia');
  Result.RegisterField('FimVigencia'               , 'DATA_FIM_VIGENCIA', 'Fim da Vigencia');
  Result.RegisterField('Ativo'                     , 'ATIVO'            , 'Status da Regra');

  // Atributos sem vinculo com a tabela
  Result.RegisterAttributeOnly('EmpresasId'      , 'Empresas Vinculadas');
  Result.RegisterAttributeOnly('NaturezasReceita', 'Naturezas da Receita');
  Result.RegisterAttributeOnly('RestricoesNcm'   , 'Restrições de NCM');

  // Campos sem vinculo na classe
  Result.RegisterColumnOnly('nat_rec'       , 'Naturezas da receita');
  Result.RegisterColumnOnly('restricoes_ncm', 'Restrições de NCM');
  Result.RegisterColumnOnly('empresas'      , 'Empresas');
end;

end.
