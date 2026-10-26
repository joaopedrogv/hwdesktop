unit AjusteRedBenefPcMetadataUnit;

interface

uses
  Classes, SysUtils, EntityMetadataUnit;

type
  AjusteRedBenefPcMetadata = class
  public
    class function GetMetadata: EntityMetadata; static;
  end;

implementation

{ AjusteRedBenefPcMetadata }

class function AjusteRedBenefPcMetadata.GetMetadata: EntityMetadata;
begin
  Result := EntityMetadata.Create('Ajuste Redução Benefício PC', 'AJ_REDBENEF');

  // Atributos vinculados
  Result.RegisterField('Id'        , 'ID'          , 'ID do Ajuste');
  Result.RegisterField('ChaveDfe'  , 'CHAVE_DFE'   , 'Chave do Documento Fiscal');
  Result.RegisterField('CodEmpresa', 'COD_EMPRESA' , 'Código da Empresa');
  Result.RegisterField('RegraId'   , 'REGRA_ID'    , 'ID da Regra');
  Result.RegisterField('IndAj'     , 'IND_AJ'      , 'Indicador de Ajuste');
  Result.RegisterField('CodAj'     , 'COD_AJ'      , 'Código do Ajuste');
  Result.RegisterField('DataRef'   , 'DATA_REF'    , 'Data de Referência');
  Result.RegisterField('Cst'       , 'CST'         , 'Código da Situação Tributária');
  Result.RegisterField('Vbc'       , 'VBC'         , 'Valor da Base de Cálculo');
  Result.RegisterField('PPisAj'    , 'PPIS_AJ'     , 'Alíquota do PIS');
  Result.RegisterField('VPPisAj'   , 'VPIS_AJ'     , 'Valor Ajuste do PIS');
  Result.RegisterField('PCofinsAj' , 'PCOFINS_AJ'  , 'Alíquota do COFINS');
  Result.RegisterField('VCofinsAj' , 'VCOFINS_AJ'  , 'Valor Ajuste do COFINS');
  Result.RegisterField('Automatico', 'AUTOMATICO'  , 'Criado pelo sistema');

  // Atributos sem vinculo com a tabela
  // Nenhum atributo adicional encontrado na classe

  // Campos da tabela sem vinculo com a classe
  Result.RegisterColumnOnly('DESCR_AJ'    , 'Descrição do Ajuste');
  Result.RegisterColumnOnly('INF_COMPL_AJ', 'Informação complementar do ajuste');
  Result.RegisterColumnOnly('COD_CTA'     , 'Código da conta contábil');
end;

end.
