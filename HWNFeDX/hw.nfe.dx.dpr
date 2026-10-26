library hw.nfe.dx;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.Classes,
  Vcl.Forms,
  Vcl.StdCtrls,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Buttons,
  System.IniFiles,
  Vcl.Dialogs,
  Winapi.Messages,
  Winapi.windows,
  Vcl.Graphics,
  ACBrNFe,
  pcnConversao,
  pcnAuxiliar,
  ACBrMail,
  ACBrValidador,
  mimemess,
  Winapi.ActiveX,
  UAdmNFe in 'ArqsHw\UAdmNFe.pas' {FrmAdmNfe},
  UDtmHwNFE in 'ArqsHw\UDtmHwNFE.pas' {DtmNFEHW: TDataModule},
  UClasseNFe in 'ArqsHw\UClasseNFe.pas',
  ufrmStatus in 'ufrmStatus.pas' {frmStatus},
  uDataSet_OOP_DX in 'ArqsHw\uDataSet_OOP_DX.pas',
  UFuncoesDll in 'UFuncoesDll.pas',
  UInutilizarNFE in 'ArqsHw\UInutilizarNFE.pas' {FrmInutilizarNFes},
  UPesPros in 'ArqsHw\UPesPros.pas' {FrmPesqPros},
  UConfcontingencia in 'ArqsHw\UConfcontingencia.pas' {FrmConfContingencia},
  UFormconsCad in 'ArqsHw\UFormconsCad.pas' {FrmConsCad},
  UadmNFSe in 'ArqsHw\UadmNFSe.pas' {FrmAdmNFSe},
  UstatusNFSe in 'ArqsHw\UstatusNFSe.pas' {FrmStatusNFSe},
  UdetalhesRPS in 'ArqsHw\UdetalhesRPS.pas' {FrmDetalhesRPS},
  UmostrarErros in 'ArqsHw\UmostrarErros.pas' {FrmMostrarErros},
  UMotivoCancNFSe in 'ArqsHw\UMotivoCancNFSe.pas' {FrmMotivoCancNFSe},
  MD5 in 'ArqsHw\MD5.pas',
  uGerarChaveNFe in 'ArqsHw\uGerarChaveNFe.pas' {frmGerarChaveNFe},
  uDLL_ClassesNFC in 'NFC\fontes\uDLL_ClassesNFC.pas',
  uNFC_Types in 'NFC\fontes\uNFC_Types.pas',
  uClasseConexao in '..\Automacao Bpl\fonte\uClasseConexao.pas',
  hw.nfce.dx in 'NFC\fontes\hw.nfce.dx.pas',
  sigiss_ws in 'ArqsHw\sigiss_ws.pas',
  uEmail in 'ArqsHw\uEmail.pas' {frmEmail},
  produtos_class in '..\Ativos\fonte\produtos_class.pas',
  uVinculoProdutos in 'ArqsHw\uVinculoProdutos.pas' {frmVinculoProdutos},
  nfce_class in '..\Ativos\fonte\nfce_class.pas',
  nfce_dest_class in '..\Ativos\fonte\nfce_dest_class.pas',
  nfce_item_class in '..\Ativos\fonte\nfce_item_class.pas',
  nfce_pagamento_class in '..\Ativos\fonte\nfce_pagamento_class.pas',
  transp_nfce_class in '..\Ativos\fonte\transp_nfce_class.pas',
  config_sistema_class in '..\Ativos\fonte\config_sistema_class.pas',
  hw.nfe.export.dx in 'NF\hw.nfe.export.dx.pas',
  hw.nfe.classes.dx in 'NF\hw.nfe.classes.dx.pas',
  empresa_nfe_class in '..\Ativos\fonte\empresa_nfe_class.pas',
  notafiscal_class in '..\Ativos\fonte\notafiscal_class.pas',
  notafiscal_dup_class in '..\Ativos\fonte\notafiscal_dup_class.pas',
  notafiscal_item_class in '..\Ativos\fonte\notafiscal_item_class.pas',
  notafiscal_item_veiculo_class in '..\Ativos\fonte\notafiscal_item_veiculo_class.pas',
  notafiscal_pag_class in '..\Ativos\fonte\notafiscal_pag_class.pas',
  notafiscal_item_adi_class in '..\Ativos\fonte\notafiscal_item_adi_class.pas',
  notafiscal_item_di_class in '..\Ativos\fonte\notafiscal_item_di_class.pas',
  notafiscal_item_detexport_class in '..\Ativos\fonte\notafiscal_item_detexport_class.pas',
  notafiscal_item_exportind_class in '..\Ativos\fonte\notafiscal_item_exportind_class.pas',
  notafiscal_sped_c113_class in '..\Ativos\fonte\notafiscal_sped_c113_class.pas',
  notafiscal_sped_c114_class in '..\Ativos\fonte\notafiscal_sped_c114_class.pas',
  notafiscal_sped_c115_class in '..\Ativos\fonte\notafiscal_sped_c115_class.pas',
  transportador_class in '..\Ativos\fonte\transportador_class.pas',
  notafiscal_sped_c111_class in '..\Ativos\fonte\notafiscal_sped_c111_class.pas',
  notafiscal_carta_correcao_class in '..\Ativos\fonte\notafiscal_carta_correcao_class.pas',
  notafiscal_inut_class in '..\Ativos\fonte\notafiscal_inut_class.pas',
  notafiscal_coleta_entrega_class in '..\Ativos\fonte\notafiscal_coleta_entrega_class.pas',
  hw_win_utils in '..\Ativos\fonte\hw_win_utils.pas',
  basefb_class in '..\Ativos\fonte\basefb_class.pas',
  hw_utils in '..\Ativos\fonte\hw_utils.pas',
  nfce_status_servico_class in '..\Ativos\fonte\nfce_status_servico_class.pas',
  notafiscal_obscont_class in '..\Ativos\fonte\notafiscal_obscont_class.pas',
  CestVarianteMvaNcmUf_Model in '..\Ativos\fonte\CestVarianteMvaNcmUf_Model.pas',
  cest__class in '..\Ativos\fonte\cest__class.pas',
  cest_ambito_class in '..\Ativos\fonte\cest_ambito_class.pas',
  cest_item_class in '..\Ativos\fonte\cest_item_class.pas',
  cest_mva_class in '..\Ativos\fonte\cest_mva_class.pas',
  cest_mva_uf_class in '..\Ativos\fonte\cest_mva_uf_class.pas',
  cest_ncm_class in '..\Ativos\fonte\cest_ncm_class.pas',
  cest_variante_class in '..\Ativos\fonte\cest_variante_class.pas',
  hw_audit_utils in '..\Ativos\fonte\hw_audit_utils.pas',
  hw_auditoria_class in '..\Ativos\fonte\hw_auditoria_class.pas',
  hw_processo_class in '..\Ativos\fonte\hw_processo_class.pas',
  senhas_class in '..\Ativos\fonte\senhas_class.pas',
  solicitacoes_acesso_class in '..\Ativos\fonte\solicitacoes_acesso_class.pas',
  tabela_processos_class in '..\Ativos\fonte\tabela_processos_class.pas',
  tabela_processos_usuarios_class in '..\Ativos\fonte\tabela_processos_usuarios_class.pas',
  uPesqPros_lote in '..\Ativos\fonte\uPesqPros_lote.pas' {frmPesqPros_lote},
  hw_lote_liberacao_class in '..\Ativos\fonte\hw_lote_liberacao_class.pas',
  uVinculoProdutosCodigoEANEmb in 'ArqsHw\uVinculoProdutosCodigoEANEmb.pas' {frmVinculoProdutosCodigoEANEmb},
  doc_eletronico_class in '..\Ativos\fonte\doc_eletronico_class.pas',
  hw_strings in '..\Ativos\fonte\hw_strings.pas' {,
  hw.csharp.helper.export in 'hw.csharp.helper.export.pas'},
  hw.csharp.helper.export in 'hw.csharp.helper.export.pas',
  Types_OOP in '..\Ativos\fonte\Types_OOP.pas',
  uHandleFileACBrNFeServicos in 'uHandleFileACBrNFeServicos.pas',
  HelperDFe in 'HelperDFe.pas',
  FormHelperDFe in 'ConfigureSSL\FormHelperDFe.pas' {FrmHelperDFe},
  hw_undconv_utils in '..\Ativos\fonte\hw_undconv_utils.pas' {frmConversaUnidadeUtils},
  ProdutosConversao_Model in '..\Ativos\fonte\ProdutosConversao_Model.pas',
  UnidadeVenda_Model in '..\Ativos\fonte\UnidadeVenda_Model.pas',
  produtos_conversao_class in '..\Ativos\fonte\produtos_conversao_class.pas',
  produtos_conversao_saida_class in '..\Ativos\fonte\produtos_conversao_saida_class.pas',
  nf_xml_versao in '..\Ativos\fonte\nf_xml_versao.pas',
  unidades_class in '..\Ativos\fonte\unidades_class.pas',
  ean_utils in '..\Ativos\fonte\ean_utils.pas',
  Query_OOP in '..\Ativos\fonte\Query_OOP.pas',
  UClasseNFSe in 'ArqsHw\UClasseNFSe.pas',
  nfce_config_class in '..\Ativos\fonte\nfce_config_class.pas',
  notafiscal_guiatransito_class in '..\Ativos\fonte\notafiscal_guiatransito_class.pas',
  notafiscal_defensivo_class in '..\Ativos\fonte\notafiscal_defensivo_class.pas',
  HelperTags in '..\Utilitario\HW.UTILS.DX\helpers\HelperTags.pas',
  BaseDatabaseConnectionUnit in '..\Modern\Adapters\Secondary\Database\BaseDatabaseConnectionUnit.pas',
  DatabaseConnectionFactoryUnit in '..\Modern\Adapters\Secondary\Database\DatabaseConnectionFactoryUnit.pas',
  IBXDatabaseConnectionUnit in '..\Modern\Adapters\Secondary\Database\Firebird\IBXDatabaseConnectionUnit.pas',
  IBXTransactionUnit in '..\Modern\Adapters\Secondary\Database\Firebird\IBXTransactionUnit.pas',
  ZeosLibCompatibilityWithERPUnit in '..\Modern\Adapters\Secondary\Database\SQLite\ZeosLibCompatibilityWithERPUnit.pas',
  ZeosLibDatabaseConnectionUnit in '..\Modern\Adapters\Secondary\Database\SQLite\ZeosLibDatabaseConnectionUnit.pas',
  ZeosLibTransactionUnit in '..\Modern\Adapters\Secondary\Database\SQLite\ZeosLibTransactionUnit.pas',
  ValidacaoItemOutputUnit in '..\Modern\Core\Domain\ValueObjects\Shared\ValidacaoItemOutputUnit.pas',
  ValidacaoOutputUnit in '..\Modern\Core\Application\OutputPorts\Shared\ValidacaoOutputUnit.pas',
  BooleanNullableUnit in '..\Modern\Core\Domain\Types\Shared\BooleanNullableUnit.pas',
  DateAndTimeNullableUnit in '..\Modern\Core\Domain\Types\Shared\DateAndTimeNullableUnit.pas',
  DoubleNullableUnit in '..\Modern\Core\Domain\Types\Shared\DoubleNullableUnit.pas',
  IntegerNullableUnit in '..\Modern\Core\Domain\Types\Shared\IntegerNullableUnit.pas',
  StringNullableUnit in '..\Modern\Core\Domain\Types\Shared\StringNullableUnit.pas',
  TipoComunsUnit in '..\Modern\Core\Domain\Types\Shared\TipoComunsUnit.pas',
  SetupUnit in '..\Modern\Core\Infrastructure\SetupUnit.pas',
  BaseClassUnit in '..\Modern\Core\Infrastructure\Base\BaseClassUnit.pas',
  BaseRepositoryUnit in '..\Modern\Core\Infrastructure\Base\BaseRepositoryUnit.pas',
  BaseUseCaseUnit in '..\Modern\Core\Infrastructure\Base\BaseUseCaseUnit.pas',
  CacheableRepositoryUnit in '..\Modern\Core\Infrastructure\Base\CacheableRepositoryUnit.pas',
  EntityBaseUnit in '..\Modern\Core\Infrastructure\Base\EntityBaseUnit.pas',
  ObjectCacheUnit in '..\Modern\Core\Infrastructure\Cache\ObjectCacheUnit.pas',
  SimpleRecordCacheUnit in '..\Modern\Core\Infrastructure\Cache\SimpleRecordCacheUnit.pas',
  FileConfigUnit in '..\Modern\Core\Infrastructure\Config\FileConfigUnit.pas',
  SetupConfigUnit in '..\Modern\Core\Infrastructure\Config\SetupConfigUnit.pas',
  ParameterValueUnit in '..\Modern\Core\Infrastructure\Data\ParameterValueUnit.pas',
  QueryResultUnit in '..\Modern\Core\Infrastructure\Data\QueryResultUnit.pas',
  ScalarResultUnit in '..\Modern\Core\Infrastructure\Data\ScalarResultUnit.pas',
  IDatabaseConnectionFactoryUnit in '..\Modern\Core\Infrastructure\Interfaces\IDatabaseConnectionFactoryUnit.pas',
  IDataBaseConnectionUnit in '..\Modern\Core\Infrastructure\Interfaces\IDataBaseConnectionUnit.pas',
  IObjectCacheUnit in '..\Modern\Core\Infrastructure\Interfaces\IObjectCacheUnit.pas',
  IProgressObserverUnit in '..\Modern\Core\Infrastructure\Interfaces\IProgressObserverUnit.pas',
  IRecordCacheUnit in '..\Modern\Core\Infrastructure\Interfaces\IRecordCacheUnit.pas',
  ISqlLoggerUnit in '..\Modern\Core\Infrastructure\Interfaces\ISqlLoggerUnit.pas',
  ITransactionUnit in '..\Modern\Core\Infrastructure\Interfaces\ITransactionUnit.pas',
  BaseSqlLoggerUnit in '..\Modern\Core\Infrastructure\Logging\BaseSqlLoggerUnit.pas',
  SqlConsoleLoggerUnit in '..\Modern\Core\Infrastructure\Logging\SqlConsoleLoggerUnit.pas',
  SqlFileLoggerUnit in '..\Modern\Core\Infrastructure\Logging\SqlFileLoggerUnit.pas',
  UIProgressObserverUnit in '..\Modern\Core\Infrastructure\Logging\UIProgressObserverUnit.pas',
  DateTimeServiceUnit in '..\Modern\Core\Infrastructure\Services\DateTimeServiceUnit.pas',
  NumberServiceUnit in '..\Modern\Core\Infrastructure\Services\NumberServiceUnit.pas',
  StatusRegistroEnumUnit in '..\Modern\Core\Domain\Types\Shared\StatusRegistroEnumUnit.pas',
  TipoTributoFiscalEnumUnit in '..\Modern\Core\Domain\Types\Shared\TipoTributoFiscalEnumUnit.pas',
  ValidationEntityOutputUnit in '..\Modern\Core\Application\OutputPorts\Shared\ValidationEntityOutputUnit.pas',
  EntityValidatorFactoryUnit in '..\Modern\Core\Infrastructure\Services\EntityValidatorFactoryUnit.pas',
  IEntityValidatorUnit in '..\Modern\Core\Infrastructure\Interfaces\IEntityValidatorUnit.pas',
  IErrorLoggerUnit in '..\Modern\Core\Infrastructure\Interfaces\IErrorLoggerUnit.pas',
  FileErrorLoggerUnit in '..\Modern\Core\Infrastructure\Logging\FileErrorLoggerUnit.pas',
  IServiceFactoryUnit in '..\Modern\Core\Infrastructure\DI\IServiceFactoryUnit.pas',
  StringServiceUnit in '..\Modern\Core\Infrastructure\Services\StringServiceUnit.pas',
  ArrayServiceUnit in '..\Modern\Core\Infrastructure\Services\ArrayServiceUnit.pas',
  EValidacaoNegocioUnit in '..\Modern\Core\Infrastructure\Exceptions\EValidacaoNegocioUnit.pas',
  LimitesBasicosUnit in '..\Modern\Core\Domain\Constants\Shared\LimitesBasicosUnit.pas',
  TributoDFeTransfCredIbsCbsEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\TributosDFe\TributoDFeTransfCredIbsCbsEtdUnit.pas',
  TributoDFeAjusteCompetIbsCbsEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\TributosDFe\TributoDFeAjusteCompetIbsCbsEtdUnit.pas',
  TributoDFeContextEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\TributosDFe\TributoDFeContextEtdUnit.pas',
  TributoDFeCredPresOpIbsCbsEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\TributosDFe\TributoDFeCredPresOpIbsCbsEtdUnit.pas',
  TributoDFeCredPresZfmIbsCbsEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\TributosDFe\TributoDFeCredPresZfmIbsCbsEtdUnit.pas',
  TributoDFeGrupoIbsCbsEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\TributosDFe\TributoDFeGrupoIbsCbsEtdUnit.pas',
  TributoDFeIbsCbsCompraGovEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\TributosDFe\TributoDFeIbsCbsCompraGovEtdUnit.pas',
  TributoDFeIbsCbsTribRegEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\TributosDFe\TributoDFeIbsCbsTribRegEtdUnit.pas',
  TributoDFeIbsCbsEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\TributosDFe\TributoDFeIbsCbsEtdUnit.pas',
  TributoDFeImpostoSeletivoEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\TributosDFe\TributoDFeImpostoSeletivoEtdUnit.pas',
  TributoDFeMonofasiaIbsCbsEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\TributosDFe\TributoDFeMonofasiaIbsCbsEtdUnit.pas',
  ITributosDFeRepositoryUnit in '..\Modern\ERP.Features\Core\Domain\Ports\ITributosDFeRepositoryUnit.pas',
  TributosDFeRepositoryUnit in '..\Modern\ERP.Features\Adapters\Secondary\Repositories\TributosDFeRepositoryUnit.pas',
  ListarTributosDFePorDocFiscalUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\TributosDFe\ListarTributosDFePorDocFiscalUseCaseUnit.pas',
  GuidServiceUnit in '..\Modern\Core\Infrastructure\Services\GuidServiceUnit.pas',
  IBXTransactionBaseUnit in '..\Modern\Adapters\Secondary\Database\Firebird\IBXTransactionBaseUnit.pas',
  IBXTransactionLegacyUnit in '..\Modern\Adapters\Secondary\Database\Firebird\IBXTransactionLegacyUnit.pas',
  TributoDFeOrigemEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\TributoDFeOrigemEnumUnit.pas',
  TipoRegraTributoDFeEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\TipoRegraTributoDFeEnumUnit.pas',
  SincNuvemHwExport in 'Modern\Exports\SincNuvemHwExport.pas',
  ContainerDFeUnit in '..\Modern\Core\Infrastructure\DI\ContainerDFeUnit.pas',
  ErpFeaturesFactoryDFeUnit in '..\Modern\ERP.Features\Infrastructure\ErpFeaturesFactoryDFeUnit.pas',
  TributosDFeFactoryUnit in 'Modern\Services\TributosDFeFactoryUnit.pas',
  SalvarTributoDFeUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\TributosDFe\SalvarTributoDFeUseCaseUnit.pas',
  CreateEntityUseCaseOutputUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\CreateEntityUseCaseOutputUnit.pas',
  TributosDFePersistentHandler in '..\Ativos\fonte\Fiscal\TributosDFe\TributosDFePersistentHandler.pas',
  ISalvarTributoDFeUseCaseUnit in '..\Modern\ERP.Features\Core\Domain\Ports\ISalvarTributoDFeUseCaseUnit.pas',
  RemoverTributoDFeUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\TributosDFe\RemoverTributoDFeUseCaseUnit.pas',
  IRemoverTributoDFeUseCaseUnit in '..\Modern\ERP.Features\Core\Domain\Ports\IRemoverTributoDFeUseCaseUnit.pas',
  FilesServiceUnit in '..\Modern\Core\Infrastructure\Services\FilesServiceUnit.pas',
  SetupDFeUnit in 'Modern\Infrastructure\SetupDFeUnit.pas',
  IDadosFiscaisReaderUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Domain\Ports\IDadosFiscaisReaderUnit.pas',
  IDadosFiscaisWriterUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Domain\Ports\IDadosFiscaisWriterUnit.pas',
  AliquotaAdRemEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\AliquotaAdRemEtdUnit.pas',
  AliquotaAdRemProdutoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\AliquotaAdRemProdutoEtdUnit.pas',
  AliquotaAdRemServicoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\AliquotaAdRemServicoEtdUnit.pas',
  AliquotaAdValoremEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\AliquotaAdValoremEtdUnit.pas',
  AliquotaAdValoremProdutoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\AliquotaAdValoremProdutoEtdUnit.pas',
  AliquotaAdValoremServicoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\AliquotaAdValoremServicoEtdUnit.pas',
  AliquotaPadraoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\AliquotaPadraoEtdUnit.pas',
  AliquotaReferenciaEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\AliquotaReferenciaEtdUnit.pas',
  AnexoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\AnexoEtdUnit.pas',
  ClassificacaoTributariaEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\ClassificacaoTributariaEtdUnit.pas',
  EstadoEtdUnit in '..\Modern\Core\Domain\Entities\Shared\EstadoEtdUnit.pas',
  ExcecaoAdRemProdutoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\ExcecaoAdRemProdutoEtdUnit.pas',
  ExcecaoAdRemServicoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\ExcecaoAdRemServicoEtdUnit.pas',
  ExcecaoAdValoremProdutoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\ExcecaoAdValoremProdutoEtdUnit.pas',
  ExcecaoAdValoremServicoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\ExcecaoAdValoremServicoEtdUnit.pas',
  ExcecaoNbsAplicavelEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\ExcecaoNbsAplicavelEtdUnit.pas',
  ExcecaoNcmAplicavelEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\ExcecaoNcmAplicavelEtdUnit.pas',
  FundamentacaoClassificacaoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\FundamentacaoClassificacaoEtdUnit.pas',
  FundamentacaoLegalEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\FundamentacaoLegalEtdUnit.pas',
  ModalidadeTributoEnumUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\ModalidadeTributoEnumUnit.pas',
  MunicipioEtdUnit in '..\Modern\Core\Domain\Entities\Shared\MunicipioEtdUnit.pas',
  NbsAplicavelEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\NbsAplicavelEtdUnit.pas',
  NbsEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\NbsEtdUnit.pas',
  NcmAplicavelEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\NcmAplicavelEtdUnit.pas',
  NcmEtdUnit in '..\Modern\Core\Domain\Entities\Shared\NcmEtdUnit.pas',
  PercentualReducaoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\PercentualReducaoEtdUnit.pas',
  SituacaoTributariaEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\SituacaoTributariaEtdUnit.pas',
  TipoDfeClassificacaoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\TipoDfeClassificacaoEtdUnit.pas',
  TipoDfeEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\TipoDfeEtdUnit.pas',
  TipoTributoEnumUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\TipoTributoEnumUnit.pas',
  TomadorEspecificoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\TomadorEspecificoEtdUnit.pas',
  TratamentoClassificacaoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\TratamentoClassificacaoEtdUnit.pas',
  TratamentoTributarioEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\TratamentoTributarioEtdUnit.pas',
  TributoSituacaoTributariaEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\TributoSituacaoTributariaEtdUnit.pas',
  UnidadeMedidaEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\UnidadeMedidaEtdUnit.pas',
  VersaoSerproEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\VersaoSerproEtdUnit.pas',
  ConfiguracaoRtcFactoryUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Domain\Services\ConfiguracaoRtcFactoryUnit.pas',
  ISincronizacaoCalculadoraLockServiceUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Domain\Services\ISincronizacaoCalculadoraLockServiceUnit.pas',
  SincronizacaoCalculadoraLockServiceUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Domain\Services\SincronizacaoCalculadoraLockServiceUnit.pas',
  ObterAtualizacaoCalculadoraUseCaseUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Application\UseCases\ObterAtualizacaoCalculadora\ObterAtualizacaoCalculadoraUseCaseUnit.pas',
  SincronizarCalculadoraUseCaseUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Application\UseCases\SincronizarCalculadora\SincronizarCalculadoraUseCaseUnit.pas',
  ERPWriterUnit in '..\Modern\Fiscal.Sinc.SICOMEX\Adapters\Secondary\ERPWriter\ERPWriterUnit.pas',
  ProgressWithLogFrameUnit in '..\Modern\UI\Frames\Componentes\Progress\ProgressWithLogFrameUnit.pas' {ProgressWithLogFrame: TFrame},
  UDownloadArquivosFiscaisForm in '..\Modern\UI\Forms\DownloadArquivosFiscais\UDownloadArquivosFiscaisForm.pas' {DownloadArquivosFiscaisForm},
  UIUtilsUnit in '..\Modern\UI\Utils\UIUtilsUnit.pas',
  IUIFormValidatorUnit in '..\Modern\UI\Infrastructure\Interfaces\IUIFormValidatorUnit.pas',
  MessageTransferType in '..\Modern\UI\Infrastructure\Types\MessageTransferType.pas',
  UIFormValidatorFactoryUnit in '..\Modern\UI\Infrastructure\Components\UIFormValidatorFactoryUnit.pas',
  SimpleStringDictionaryUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Services\SimpleStringDictionaryUnit.pas',
  USock in '..\Utils\USock.pas',
  DFeDLLExport in 'Modern\Exports\DFeDLLExport.pas',
  ResultadoOperacaoDFeUnit in '..\Modern\ERP.Features\Core\Domain\Types\DFe\ResultadoOperacaoDFeUnit.pas',
  INFSeRepositoryUnit in '..\Modern\ERP.Features\Core\Domain\Ports\INFSeRepositoryUnit.pas',
  NFSeEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\NFSe\NFSeEtdUnit.pas',
  CurrencyNullableUnit in '..\Modern\Core\Domain\Types\Shared\CurrencyNullableUnit.pas',
  TipoServicoEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\TipoServicoEtdUnit.pas',
  NFSeTypesUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\NFSeTypesUnit.pas',
  DFeTypesUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\DFeTypesUnit.pas',
  NFSeParticipanteEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\NFSe\NFSeParticipanteEtdUnit.pas',
  NFSeRepositoryUnit in '..\Modern\ERP.Features\Adapters\Secondary\Repositories\NFSeRepositoryUnit.pas',
  TipoServicoFactoryUnit in '..\Modern\ERP.Features\Core\Domain\Services\TiposServicos\TipoServicoFactoryUnit.pas',
  ConfiguracaoNFSeModelUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\ConfiguracaoNFSeModelUnit.pas',
  ConfiguracaoNFSeServiceUnit in '..\Modern\ERP.Features\Core\Domain\Services\NFSe\ConfiguracaoNFSeServiceUnit.pas',
  IConfiguracoesRepositoryUnit in '..\Modern\ERP.Features\Core\Domain\Ports\IConfiguracoesRepositoryUnit.pas',
  ConfiguracaoEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\ConfiguracaoEtdUnit.pas',
  ConfiguracaoTipoEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\ConfiguracaoTipoEnumUnit.pas',
  ConfigLegacyTypes in '..\Modern\ERP.Features\Core\Domain\ValueObjects\Configuracoes\ConfigLegacyTypes.pas',
  ConfigFactoryUnit in '..\Modern\ERP.Features\Core\Domain\Services\Configuracao\ConfigFactoryUnit.pas',
  IConfigReaderAndWriterUnit in '..\Modern\ERP.Features\Core\Domain\Services\Configuracao\IConfigReaderAndWriterUnit.pas',
  IniConfigReaderAndWriterUnit in '..\Modern\ERP.Features\Core\Domain\Services\Configuracao\IniConfigReaderAndWriterUnit.pas',
  ConfiguracoesRepositoryUnit in '..\Modern\ERP.Features\Adapters\Secondary\Repositories\ConfiguracoesRepositoryUnit.pas',
  IACBrNFSeAdapterUnit in '..\Modern\ERP.Features\Adapters\Secondary\ACBr\IACBrNFSeAdapterUnit.pas',
  ACBrNFSeAdapterUnit in '..\Modern\ERP.Features\Adapters\Secondary\ACBr\ACBrNFSeAdapterUnit.pas',
  CertificadoDigitalConfigUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\CertificadoDigitalConfigUnit.pas',
  ISimpleLoggerUnit in '..\Modern\Core\Infrastructure\Interfaces\ISimpleLoggerUnit.pas',
  SimpleFileLoggerUnit in '..\Modern\Core\Infrastructure\Logging\SimpleFileLoggerUnit.pas',
  IEmpresasRepositoryUnit in '..\Modern\ERP.Features\Core\Domain\Ports\IEmpresasRepositoryUnit.pas',
  EmpresaEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\EmpresaEtdUnit.pas',
  EmpresasRepositoryUnit in '..\Modern\ERP.Features\Adapters\Secondary\Repositories\EmpresasRepositoryUnit.pas',
  WebServiceDFeModelUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\WebServiceDFeModelUnit.pas',
  NFSeConverterUnit in '..\Modern\ERP.Features\Core\Domain\Services\NFSe\NFSeConverterUnit.pas',
  DpsEmitirModelUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\DpsEmitirModelUnit.pas',
  INFSeConverterUnit in '..\Modern\ERP.Features\Core\Domain\Services\NFSe\INFSeConverterUnit.pas',
  NFSeAtualizarSituacaoTypesUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\NFSeAtualizarSituacaoTypesUnit.pas',
  NFSeDocEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\NFSe\NFSeDocEtdUnit.pas',
  WebServiceResponseTypesUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\WebServiceResponseTypesUnit.pas',
  NFSeResponseTypesUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\NFSeResponseTypesUnit.pas',
  UStatusProcessamentoSimplesFormUnit in '..\Modern\UI\Forms\Componentes\UStatusProcessamentoSimplesFormUnit.pas' {StatusProcessamentoSimplesForm},
  UIFormObserverFactoryUnit in '..\Modern\UI\Infrastructure\Components\UIFormObserverFactoryUnit.pas',
  NFSeHistoricoEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\NFSe\NFSeHistoricoEtdUnit.pas',
  ListarRegimesEspeciaisDeTributacaoNFSeUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NFSe\ListarRegimesEspeciaisDeTributacaoNFSeUseCaseUnit.pas',
  ACBrNFSeAdapterTypes in '..\Modern\ERP.Features\Adapters\Secondary\ACBr\ACBrNFSeAdapterTypes.pas',
  ConsultarEmissaoWsNFSeUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NFSe\ConsultarEmissaoWsNFSeUseCaseUnit.pas',
  NFSeComACBrUseCaseBaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NFSe\NFSeComACBrUseCaseBaseUnit.pas',
  ImprimirNFSeUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NFSe\ImprimirNFSeUseCaseUnit.pas',
  SalvarPdfNFSeUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NFSe\SalvarPdfNFSeUseCaseUnit.pas',
  CancelarWsNFSeUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NFSe\CancelarWsNFSeUseCaseUnit.pas',
  NFSeEventoEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\NFSe\NFSeEventoEtdUnit.pas',
  NFSeDocModelUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\NFSeDocModelUnit.pas',
  NFSeEventoModelUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\NFSeEventoModelUnit.pas',
  NFSeResumoModelUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\NFSeResumoModelUnit.pas',
  VersaoAplicacaoUnit in '..\Modern\Core\Domain\Constants\Shared\VersaoAplicacaoUnit.pas',
  ConfiguracaoRtcUnit in '..\Modern\Core\Domain\Constants\Shared\ConfiguracaoRtcUnit.pas',
  NFSeEventoResumoModelUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\NFSeEventoResumoModelUnit.pas',
  NFSeAtualizarSituacaoEventoTypesUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\NFSeAtualizarSituacaoEventoTypesUnit.pas',
  NFSeSubstEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\NFSe\NFSeSubstEtdUnit.pas',
  AtualizarSituacaoNFSeServiceUnit in '..\Modern\ERP.Features\Core\Application\Services\NFSe\AtualizarSituacaoNFSeServiceUnit.pas',
  IConfiguracaoNFSeServiceUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NFSe\IConfiguracaoNFSeServiceUnit.pas',
  IAtualizarSituacaoNFSeServiceUnit in '..\Modern\ERP.Features\Core\Application\Services\NFSe\IAtualizarSituacaoNFSeServiceUnit.pas',
  EnumServiceUnit in '..\Modern\Core\Infrastructure\Services\EnumServiceUnit.pas',
  NFSeHistoricoTypesUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\NFSeHistoricoTypesUnit.pas',
  EmailComposerServiceUnit in '..\Modern\Core\Domain\Services\Shared\EmailComposerServiceUnit.pas',
  IEmailServiceUnit in '..\Modern\Core\Domain\Ports\Shared\IEmailServiceUnit.pas',
  EnviarEmailNFSeUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NFSe\EnviarEmailNFSeUseCaseUnit.pas',
  ACBrEmailServiceUnit in '..\Modern\ERP.Features\Adapters\Secondary\ACBr\ACBrEmailServiceUnit.pas',
  EmailMessageTypesUnit in '..\Modern\Core\Domain\ValueObjects\Shared\EmailMessageTypesUnit.pas',
  IEnviarEmailUseCaseUnit in '..\Modern\Core\Application\Interfaces\Shared\IEnviarEmailUseCaseUnit.pas',
  EnviarEmailUseCaseUnit in '..\Modern\Core\Application\UseCases\Shared\EnviarEmailUseCaseUnit.pas',
  IEmailComposerServiceUnit in '..\Modern\Core\Domain\Services\Shared\IEmailComposerServiceUnit.pas',
  EmailConfigModelUnit in '..\Modern\Core\Domain\ValueObjects\Shared\EmailConfigModelUnit.pas',
  EmailNFSeInputUnit in '..\Modern\Core\Domain\ValueObjects\Shared\EmailNFSeInputUnit.pas',
  EmailConfigRemetenteEnumUnit in '..\Modern\Core\Domain\Types\Shared\EmailConfigRemetenteEnumUnit.pas',
  DFeDLLHeader in '..\Modern\ERP.Features\Adapters\Secondary\DFeDLL\DFeDLLHeader.pas',
  NFSeTypesDisplayUnit in '..\Modern\UI\Infrastructure\Services\NFSeTypesDisplayUnit.pas',
  ResultadoExecucaoTransmissaoDFeOutputUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\DFe\ResultadoExecucaoTransmissaoDFeOutputUnit.pas',
  ICSVReaderUnit in '..\Modern\Core\Domain\Ports\Shared\ICSVReaderUnit.pas',
  CSVFileReaderUnit in '..\Modern\Adapters\Secondary\Files\CSVFileReaderUnit.pas',
  IIbptReaderUnit in '..\Modern\Fiscal.Sinc.IBPT\Core\Domain\Ports\IIbptReaderUnit.pas',
  ItemIbptEtdUnit in '..\Modern\Core\Domain\Entities\Shared\ItemIbptEtdUnit.pas',
  SincronizadorTabelaIbptServiceUnit in '..\Modern\Fiscal.Sinc.IBPT\Core\Domain\Services\SincronizadorTabelaIbptServiceUnit.pas',
  CompatibilidadeRtcModelUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Domain\ValueObjects\CompatibilidadeRtcModelUnit.pas',
  PublicacaoRtcModelUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Domain\ValueObjects\PublicacaoRtcModelUnit.pas',
  AtualizacaoCalculadoraModelUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Domain\ValueObjects\AtualizacaoCalculadoraModelUnit.pas',
  SincronizacaoCalculadoraLeaseUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Domain\ValueObjects\SincronizacaoCalculadoraLeaseUnit.pas',
  SincronizacaoCalculadoraSnapshotUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Domain\ValueObjects\SincronizacaoCalculadoraSnapshotUnit.pas',
  IControleVersaoCalculadoraApiUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Domain\Ports\IControleVersaoCalculadoraApiUnit.pas',
  ControleVersaoCalculadoraApiUnit in '..\Modern\Fiscal.Sinc.SERPRO\Adapters\Secondary\ControleVersaoCalculadoraApi\ControleVersaoCalculadoraApiUnit.pas',
  JsonQueryResultUnit in '..\Modern\Fiscal.Sinc.SERPRO\Adapters\Secondary\CalculadoraApiReader\JsonQueryResultUnit.pas',
  CalculadoraApiReaderUnit in '..\Modern\Fiscal.Sinc.SERPRO\Adapters\Secondary\CalculadoraApiReader\CalculadoraApiReaderUnit.pas',
  IItensIbptRepositoryUnit in '..\Modern\Core\Domain\Ports\Shared\IItensIbptRepositoryUnit.pas',
  IbptCsvReaderUnit in '..\Modern\Fiscal.Sinc.IBPT\Adapters\Secondary\IbptCsvReaderUnit.pas',
  SincronizarDadosFiscaisUseCaseUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Application\UseCases\SincronizarDadosFiscais\SincronizarDadosFiscaisUseCaseUnit.pas',
  ObterArquivosFiscaisModificadosUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NuvemHW\Fiscal\ObterArquivosFiscaisModificadosUseCaseUnit.pas',
  ISincronizadorCalculadoraServiceUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Domain\Services\ISincronizadorCalculadoraServiceUnit.pas',
  SincronizadorCalculadoraServiceUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Domain\Services\SincronizadorCalculadoraServiceUnit.pas',
  IDownloadServiceUnit in '..\Modern\Core\Domain\Ports\Services\Shared\IDownloadServiceUnit.pas',
  IHttpJsonClientUnit in '..\Modern\Core\Domain\Ports\Services\Shared\IHttpJsonClientUnit.pas',
  DownloadServiceUnit in '..\Modern\Adapters\Secondary\Services\DownloadServiceUnit.pas',
  NetHttpJsonClientUnit in '..\Modern\Adapters\Secondary\Services\HttpJsonClient\NetHttpJsonClientUnit.pas',
  ISincronizadorNCMsSICOMEXServiceUnit in '..\Modern\Fiscal.Sinc.SICOMEX\Core\Domain\Services\ISincronizadorNCMsSICOMEXServiceUnit.pas',
  SincronizadorNCMsSICOMEXServiceUnit in '..\Modern\Fiscal.Sinc.SICOMEX\Core\Domain\Services\SincronizadorNCMsSICOMEXServiceUnit.pas',
  ArquivosSICOMEXInputUnit in '..\Modern\Fiscal.Sinc.SICOMEX\Core\Application\InputPorts\Sincronizacao\ArquivosSICOMEXInputUnit.pas',
  INcmReaderUnit in '..\Modern\Fiscal.Sinc.SICOMEX\Core\Domain\Ports\INcmReaderUnit.pas',
  NCMJsonReaderUnit in '..\Modern\Fiscal.Sinc.SICOMEX\Adapters\Secondary\NCMReader\NCMJsonReaderUnit.pas',
  INcmWriterUnit in '..\Modern\Fiscal.Sinc.SICOMEX\Core\Domain\Ports\INcmWriterUnit.pas',
  ISincronizadorTabelaIbptServiceUnit in '..\Modern\Fiscal.Sinc.IBPT\Core\Domain\Services\ISincronizadorTabelaIbptServiceUnit.pas',
  IIbptWriterUnit in '..\Modern\Fiscal.Sinc.IBPT\Core\Domain\Ports\IIbptWriterUnit.pas',
  NcmSicomexModelUnit in '..\Modern\Fiscal.Sinc.SICOMEX\Core\Domain\ValueObjects\NcmSicomexModelUnit.pas',
  ManifestFilesModelUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\NuvemHW\ManifestFilesModelUnit.pas',
  ArquivoDownloadModel in '..\Modern\ERP.Features\Core\Domain\ValueObjects\NuvemHW\ArquivoDownloadModel.pas',
  ISincronizadorFiscalNFSeServiceUnit in '..\Modern\Fiscal.Sinc.GovNFSe\Core\Domain\Services\ISincronizadorFiscalNFSeServiceUnit.pas',
  SincronizadorFiscalNFSeServiceUnit in '..\Modern\Fiscal.Sinc.GovNFSe\Core\Domain\Services\SincronizadorFiscalNFSeServiceUnit.pas',
  ITabelasFiscaisNFSeWriterUnit in '..\Modern\Fiscal.Sinc.GovNFSe\Core\Domain\Ports\ITabelasFiscaisNFSeWriterUnit.pas',
  CorrelacaoFiscalNFSeEtdUnit in '..\Modern\Core\Domain\Entities\Shared\CorrelacaoFiscalNFSeEtdUnit.pas',
  ITabelasFiscaisNFSeReaderUnit in '..\Modern\Fiscal.Sinc.GovNFSe\Core\Domain\Ports\ITabelasFiscaisNFSeReaderUnit.pas',
  TabelasFiscaisNFSeCsvReaderUnit in '..\Modern\Fiscal.Sinc.GovNFSe\Adapters\Secondary\TabelasFiscaisNFSeCsvReaderUnit.pas',
  CodigoTributacaoNacionalNFSeEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\FiscalNFSe\CodigoTributacaoNacionalNFSeEtdUnit.pas',
  CodigoIndicadorOperacaoNFSeEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\FiscalNFSe\CodigoIndicadorOperacaoNFSeEtdUnit.pas',
  NFSeModelUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\NFSeModelUnit.pas',
  RegraFiscalIbsCbsEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\RegraFiscalIbsCbsEtdUnit.pas',
  DpsEmitirIbsCbsNacionalModelUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\DpsEmitirIbsCbsNacionalModelUnit.pas',
  EmitirWsNFSeUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NFSe\EmitirWsNFSeUseCaseUnit.pas',
  NFSeOSEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\NFSe\NFSeOSEtdUnit.pas',
  IPedVendaRepositoryUnit in '..\Modern\ERP.Features\Core\Domain\Ports\IPedVendaRepositoryUnit.pas',
  OSItemFiscalEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\PedVenda\OSItemFiscalEtdUnit.pas',
  PedVendaRepositoryUnit in '..\Modern\ERP.Features\Adapters\Secondary\Repositories\PedVendaRepositoryUnit.pas',
  EntityMetadataUnit in '..\Modern\Core\Infrastructure\Base\EntityMetadataUnit.pas',
  UpdatePedvendaEmissaoNFSeCommandsUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\Models\PedVenda\UpdatePedvendaEmissaoNFSeCommandsUnit.pas',
  ISessionContextUnit in '..\Modern\Core\Domain\Ports\Shared\ISessionContextUnit.pas',
  SessionContextUnit in '..\Modern\Core\Application\Contexts\SessionContextUnit.pas',
  SessionExport in 'Modern\Exports\SessionExport.pas',
  UpdatePedvendaVinculoNFSeCommandsUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\Models\PedVenda\UpdatePedvendaVinculoNFSeCommandsUnit.pas',
  UpdatePedvendaVinculoDpsNFSeCommandUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\Models\PedVenda\UpdatePedvendaVinculoDpsNFSeCommandUnit.pas',
  UpdatePedvendaVinculoNFSeSubstituidaCommandUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\Models\PedVenda\UpdatePedvendaVinculoNFSeSubstituidaCommandUnit.pas',
  IFormasPagamentoRepositoryUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\IFormasPagamentoRepositoryUnit.pas',
  FormaPagamentoEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\FormaPagamento\FormaPagamentoEtdUnit.pas',
  UpdateFormaPagamentoVincularNFCommandsUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\Models\FormasPagamento\UpdateFormaPagamentoVincularNFCommandsUnit.pas',
  IControleCreditosRepositoryUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\IControleCreditosRepositoryUnit.pas',
  ControleCreditoEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\ControleCreditos\ControleCreditoEtdUnit.pas',
  UpdateControleCreditoNumDocumentoCommandUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\Models\ControleCreditos\UpdateControleCreditoNumDocumentoCommandUnit.pas',
  FormasPagamentoRepositoryUnit in '..\Modern\ERP.Features\Adapters\Secondary\Repositories\FormasPagamentoRepositoryUnit.pas',
  ControleCreditosRepositoryUnit in '..\Modern\ERP.Features\Adapters\Secondary\Repositories\ControleCreditosRepositoryUnit.pas',
  RatearRetencoesNFSeOSServiceUnit in '..\Modern\ERP.Features\Core\Domain\Services\NFSe\RatearRetencoesNFSeOSServiceUnit.pas',
  IRatearRetencoesNFSeOSServiceUnit in '..\Modern\ERP.Features\Core\Domain\Services\NFSe\IRatearRetencoesNFSeOSServiceUnit.pas',
  EstadosServiceUnit in '..\Modern\Core\Domain\Services\Shared\EstadosServiceUnit.pas',
  IZipCompressorServiceUnit in '..\Modern\Core\Domain\Services\Shared\IZipCompressorServiceUnit.pas',
  ZipCompressorServiceUnit in '..\Modern\Core\Domain\Services\Shared\ZipCompressorServiceUnit.pas',
  INFSeAnexosServiceUnit in '..\Modern\ERP.Features\Core\Application\Services\NFSe\INFSeAnexosServiceUnit.pas',
  CriarAnexosDxNFSeUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NFSe\CriarAnexosDxNFSeUseCaseUnit.pas',
  NFSeAnexosServiceUnit in '..\Modern\ERP.Features\Core\Application\Services\NFSe\NFSeAnexosServiceUnit.pas',
  ManifestSincServiceUnit in '..\Modern\ERP.Features\Core\Application\Services\NuvemHW\ManifestSincServiceUnit.pas',
  HashComparatorServiceUnit in '..\Modern\ERP.Features\Core\Application\Services\NuvemHW\HashComparatorServiceUnit.pas',
  IHashComparatorServiceUnit in '..\Modern\ERP.Features\Core\Application\Services\NuvemHW\IHashComparatorServiceUnit.pas',
  IManifestSincServiceUnit in '..\Modern\ERP.Features\Core\Application\Services\NuvemHW\IManifestSincServiceUnit.pas',
  LocalManifestHashesServiceUnit in '..\Modern\ERP.Features\Core\Application\Services\NuvemHW\LocalManifestHashesServiceUnit.pas',
  IConsultasSqlRepositoryUnit in '..\Modern\ERP.Features\Core\Domain\Ports\IConsultasSqlRepositoryUnit.pas',
  ConsultaSqlEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\ConsultaSqlEtdUnit.pas',
  ConsultasSqlRepositoryUnit in '..\Modern\ERP.Features\Adapters\Secondary\Repositories\ConsultasSqlRepositoryUnit.pas',
  ConsoleObserverFactoryUnit in '..\Modern\UI\Infrastructure\Components\ConsoleObserverFactoryUnit.pas',
  SincronizarConsultasSqlUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NuvemHW\ConsultasSQL\SincronizarConsultasSqlUseCaseUnit.pas',
  ExisteAtualizacaoConsultasSqlUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NuvemHW\ConsultasSQL\ExisteAtualizacaoConsultasSqlUseCaseUnit.pas',
  ArquivosERPConstsUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NuvemHW\Models\ArquivosERPConstsUnit.pas',
  ILocalManifestHashesServiceUnit in '..\Modern\ERP.Features\Core\Application\Services\NuvemHW\ILocalManifestHashesServiceUnit.pas',
  DFeNTManageUnit in '..\Ativos\fonte\Fiscal\Utils\DFeNTManageUnit.pas',
  DFeAlertaEdtUnit in '..\Modern\ERP.Features\Core\Domain\Entities\FiscalDFe\DFeAlertaEdtUnit.pas',
  DFeAlertaMetadataUnit in '..\Modern\ERP.Features\Core\Domain\Metadata\DFeAlertaMetadataUnit.pas',
  IDFeAlertasRepositoryUnit in '..\Modern\ERP.Features\Core\Domain\Ports\IDFeAlertasRepositoryUnit.pas',
  DFeAlertasRepositoryUnit in '..\Modern\ERP.Features\Adapters\Secondary\Repositories\DFeAlertasRepositoryUnit.pas',
  RegistrarDFeAlertasUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\DFe\RegistrarDFeAlertasUseCaseUnit.pas',
  RegistrarDFeAlertasInputUnit in '..\Modern\ERP.Features\Core\Application\InputPorts\DFe\RegistrarDFeAlertasInputUnit.pas',
  RegistradorAlertasDFeUtils in 'Comum\RegistradorAlertasDFeUtils.pas',
  ConverterNFeParaContingenciaUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NotaFiscal\ConverterNFeParaContingenciaUseCaseUnit.pas',
  NotasFiscaisRepositoryUnit in '..\Modern\ERP.Features\Adapters\Secondary\Repositories\NotasFiscaisRepositoryUnit.pas',
  INotasFiscaisRepositoryUnit in '..\Modern\ERP.Features\Core\Domain\Ports\INotasFiscaisRepositoryUnit.pas',
  ContextoDocTribPcModelUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\ContextoDocTribPcModelUnit.pas',
  ModelosDFeEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\DFe\ModelosDFeEnumUnit.pas',
  PeriodoEmpresaVOUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\PeriodoEmpresaVOUnit.pas',
  NotaFiscalResumoModelUnit in '..\Modern\ERP.Features\Core\Domain\Models\NotaFiscal\NotaFiscalResumoModelUnit.pas',
  UpdateDFeRedBenefPcCalcCommandsUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\Models\DFe\UpdateDFeRedBenefPcCalcCommandsUnit.pas',
  NotaFiscalPendenciaSefEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\NotaFiscal\NotaFiscalPendenciaSefEtdUnit.pas',
  UpdateNotaFiscalConverterParaContingenciaCommandUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\Models\NotaFiscal\UpdateNotaFiscalConverterParaContingenciaCommandUnit.pas',
  FormatoImpressaoDANFeEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\NotaFiscal\FormatoImpressaoDANFeEnumUnit.pas',
  NaturezaNfEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\NotaFiscal\NaturezaNfEnumUnit.pas',
  SituacaoNFeEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\NotaFiscal\SituacaoNFeEnumUnit.pas',
  StatusNfEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\NotaFiscal\StatusNfEnumUnit.pas',
  StatusResolucaoNFeSefEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\NotaFiscal\StatusResolucaoNFeSefEnumUnit.pas',
  TipoAmbienteNFeEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\NotaFiscal\TipoAmbienteNFeEnumUnit.pas',
  TipoEmissaoNFeEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\NotaFiscal\TipoEmissaoNFeEnumUnit.pas',
  TipoNfEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\NotaFiscal\TipoNfEnumUnit.pas',
  DocumentoEletronicoEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\DocEletronico\DocumentoEletronicoEtdUnit.pas',
  IDocumentosEletronicosRepositoryUnit in '..\Modern\ERP.Features\Core\Domain\Ports\IDocumentosEletronicosRepositoryUnit.pas',
  DocumentosEletronicosRepositoryUnit in '..\Modern\ERP.Features\Adapters\Secondary\Repositories\DocumentosEletronicosRepositoryUnit.pas',
  ObterPendenciaNFeSefazUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NotaFiscal\ObterPendenciaNFeSefazUseCaseUnit.pas',
  UpdatePendenciaSefazAvancoCommandUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\Models\NotaFiscal\UpdatePendenciaSefazAvancoCommandUnit.pas',
  ConverterParaContingenciaResultUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\Models\NotaFiscal\ConverterParaContingenciaResultUnit.pas',
  uHelperPosPrinter in 'NFC\fontes\uHelperPosPrinter.pas',
  NotaFiscalItemContextoRtcModelUnit in '..\Modern\ERP.Features\Core\Domain\Models\NotaFiscal\NotaFiscalItemContextoRtcModelUnit.pas',
  UpdateNotaFiscalItemContextoRtcCommandUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\Models\NotaFiscal\UpdateNotaFiscalItemContextoRtcCommandUnit.pas',
  AvancarPendenciaSefazUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\NotaFiscal\AvancarPendenciaSefazUseCaseUnit.pas',
  NotaFiscalPendenciaSefModelUnit in '..\Modern\ERP.Features\Core\Domain\Models\NotaFiscal\NotaFiscalPendenciaSefModelUnit.pas',
  AvancarPendenciaSefazInputUnit in '..\Modern\ERP.Features\Core\Application\InputPorts\NotasFiscais\AvancarPendenciaSefazInputUnit.pas',
  RedutorCompraGovernamentalEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\RedutorCompraGovernamentalEtdUnit.pas',
  TransferenciaCBSEnteGovEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\TransferenciaCBSEnteGovEtdUnit.pas',
  ITokenDecryptorUnit in '..\Modern\Core\Domain\Ports\Services\Shared\ITokenDecryptorUnit.pas',
  TwofishTokenDecryptorUnit in '..\Modern\Core\Infrastructure\Security\TwofishTokenDecryptorUnit.pas',
  ISincronizarDadosFiscaisUseCaseUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Application\UseCases\SincronizarDadosFiscais\ISincronizarDadosFiscaisUseCaseUnit.pas',
  ISincronizarCalculadoraUseCaseUnit in '..\Modern\Fiscal.Sinc.SERPRO\Core\Application\UseCases\SincronizarCalculadora\ISincronizarCalculadoraUseCaseUnit.pas',
  TwofishTokenEncryptorUnit in '..\Modern\Core\Infrastructure\Security\TwofishTokenEncryptorUnit.pas',
  ITokenEncryptorUnit in '..\Modern\Core\Domain\Ports\Services\Shared\ITokenEncryptorUnit.pas',
  ErpFeaturesFactoryBaseUnit in '..\Modern\ERP.Features\Infrastructure\ErpFeaturesFactoryBaseUnit.pas',
  ListaServicosLC116EtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\ListaServicosLC116EtdUnit.pas',
  IndicadorOperacaoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\IndicadorOperacaoEtdUnit.pas',
  LocalIncidenciaEnumUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\LocalIncidenciaEnumUnit.pas',
  IndicadorOpNbsClassificacaoEtdUnit in '..\Modern\Fiscal.Calculos\Core\Domain\Entities\IndicadorOpNbsClassificacaoEtdUnit.pas';

type

   ArrayBi = array of array of shortstring;

{$R *.res}

procedure CreateFormAdmNFe;
begin
  DtmNFEHW := TDtmNFEHW.create(nil);
  Application.CreateForm(TFrmAdmNfe, FrmAdmNfe);
  Application.CreateForm(TfrmPesqPros_lote, frmPesqPros_lote);
  Application.CreateForm(TfrmVinculoProdutosCodigoEANEmb, frmVinculoProdutosCodigoEANEmb);
  end;

procedure ReleaseFormAdmNFe;
begin
  if Assigned(FrmAdmNfe) then
    FreeAndNil(FrmAdmNfe);
  if Assigned(DtmNFEHW) then
    FreeAndNil(DtmNFEHW);
end;

procedure SetAttrFormAdmNFe(comveic, vendBanco: WideString; codempresa: integer;vversao: WideString; vusuario: WideString);
begin
  if Assigned(FrmAdmNfe) then
  begin
    FrmAdmNfe.CadNfeVenda.CadEmpresa.codempresa:=codempresa;
    FrmAdmNfe.CadNfeVenda.vcaminhobanco:=string(vendBanco);
    FrmAdmNfe.CadNfeVenda.vccomveic:=string(comveic);
    FrmAdmNfe.CadNfeVenda.vfversao:=string(vversao);
    FrmAdmNfe.CadNfeVenda.vusuario := vusuario;
  end;
end;

function VisualizaNFe(comveic, vendBanco: WideString; codempresa: integer;vversao: WideString;vusuario: WideString): longbool; stdcall;
begin
  CreateFormAdmNFe();
  try
    SetAttrFormAdmNFe(comveic, vendBanco, codempresa, vversao, vusuario);

    FrmAdmNfe.CadNfeVenda.conectaBanco;
    FrmAdmNfe.CadNfeVenda.CadEmpresa.dadosGNfe;

    FrmAdmNfe.ShowModal;

  finally
    ReleaseFormAdmNFe;
  end;
end;


function EnviarNFeHW(comveic: WideString;vendBanco: WideString;codempresa: integer;vversao: WideString;vnumnf: integer;tipoNF: WideString;tpop: WideString;vsubserie:WideString;vusuario: WideString): longbool; stdcall;
var
  AAnexos: TStrings;
  I: Integer;
begin
  Result := True;

  CreateFormAdmNFe();
  try
    SetAttrFormAdmNFe(comveic, vendBanco, codempresa, vversao, vusuario);

    if not FrmAdmNfe.CadNfeVenda.conectaBanco then
      Exit;

    FrmAdmNfe.CadNfeVenda.CadEmpresa.dadosGNfe;

    with FrmAdmNfe do
    begin
      FrmAdmNfe.DBText2.DataField := 'CIDADE';
      FrmAdmNfe.DBText1.DataField := 'NOME_CLIENTE';

      CadNfevenda.pesquisaNF(vnumnf,codempresa,vsubserie);
      CadNfevenda.marcaSel;

      case StrToIntDef(tpop, -1) of
        1 :
          begin
            CadNfeVenda.Imprimir := False;
            CadNfeVenda.SendMail := False;
            Result := enviaNFe;
            if Result then
            begin
              CadNfeVenda.Imprimir := True;
              Result := ImprimirNFe;
            end;
            {
            if Result then
            begin
              if UFuncoesDll.ACBrNFe1.NotasFiscais.Count > 0 then
              begin
                CadNfeVenda.SendMail := True;

                Aanexos := CadNfeVenda.getArquivosBoletoParaAnexos;

                CadNfeVenda.enviaEmail(UFuncoesDll.ACBrNFe1, 1, 0, '0', AAnexos );

                if Assigned(Aanexos) then
                  for I := 0 to Aanexos.Count - 1  do
                    DeleteFile(PWideChar(Aanexos[I]));
              end;
            end;
            }
          end;
        2 :
          begin
            if (Trim(CadNfevenda.dataSet.FieldByName('situacao_nfe').AsString) = '') and
               (Trim(CadNfevenda.dataSet.FieldByName('nfe_dpec_nregdpec').AsString) <> '') then
            begin
               leconfigNFE(CadNfevenda);
               Result := CadNfevenda.cadCCe.ImprimirEventoEPEC(CadNfevenda.dataSet.FieldByName('cod_nf').AsInteger, codempresa, ACBrNFe1);
            end
            else
              Result := ImprimirNFe;
          end;
        3 :
          begin
            Result := CancelarNFE;
          end;
      end;
    end;

  finally
    ReleaseFormAdmNFe;
  end;
end;

function ConsultaSefazOr(vUF: WideString;vChave: WideString;vserie: WideString;vusuario: WideString;codempresa: integer;vendbanco: WideString): longbool; stdcall;
begin
  Result := True;

  CreateFormAdmNFe();
  try
    SetAttrFormAdmNFe('', vendBanco, codempresa, '', vusuario);

    if not FrmAdmNfe.CadNfeVenda.conectaBanco then
      Exit;

    FrmAdmNfe.CadNfeVenda.CadEmpresa.dadosGNfe;

    Result := FrmAdmNfe.Mconsultasefazor(vUF,vChave,vserie);

  finally
    ReleaseFormAdmNFe;
  end;
end;

function ConsNFEDLL(vendBanco: WideString;codempresa: integer;vversao: WideString;vnumnf: integer;tipoNF: WideString;vsubserie:WideString;vusuario: WideString): longbool; stdcall;
var
 vflg: integer;
begin
  Result := True;

  CreateFormAdmNFe();
  try
    SetAttrFormAdmNFe('', vendBanco, codempresa, vversao, vusuario);

    if not FrmAdmNfe.CadNfeVenda.conectaBanco then
      Exit;

    FrmAdmNfe.CadNfeVenda.CadEmpresa.dadosGNfe;

    with FrmAdmNfe do
    begin
      CadNfevenda.pesquisaNF(vnumnf,codempresa,vsubserie);
      CadNfevenda.marcaSel;

      Result := ConsultaNFEDLL;
    end;

  finally
    ReleaseFormAdmNFe;
  end;
end;

function EnviarEmailNFe(vendBanco: WideString; codempresa: integer; vversao: WideString; vnumnf: integer; tipoNF: WideString;vsubserie:WideString;vusuario: WideString): LongBool; stdcall;
begin
  Result := True;

  CreateFormAdmNFe();
  try
    SetAttrFormAdmNFe('', vendBanco, codempresa, vversao, vusuario);

    if not FrmAdmNfe.CadNfeVenda.conectaBanco then
      Exit;

    FrmAdmNfe.CadNfeVenda.CadEmpresa.dadosGNfe;

    with FrmAdmNfe do
    begin
      CadNfevenda.pesquisaNF(vnumnf,codempresa,vsubserie);
      CadNfevenda.marcaSel;

      Result := EnviarEmail_NFe;
    end;

  finally
    ReleaseFormAdmNFe;
  end;
end;

procedure CreateFormAdmNFSe;
begin
  DtmNFEHW := TDtmNFEHW.create(nil);
  Application.CreateForm(TFrmAdmNFSe, FrmAdmNFSe);
end;

procedure ReleaseFormAdmNFSe;
begin
  if Assigned(FrmAdmNFSe) then
    FreeAndNil(FrmAdmNFSe);
  if Assigned(DtmNFEHW) then
    FreeAndNil(DtmNFEHW);
end;

procedure SetAttrFormAdmNFSe(vendBanco: WideString; codempresa: integer; vusuario: WideString);
begin
  if Assigned(FrmAdmNFSe) then
  begin
    FrmAdmNFSe.CadNFSe.CadEmpresa.codempresa:=codempresa;
    FrmAdmNFSe.CadNFSe.vcaminhobanco:=string(vendBanco);
    FrmAdmNFSe.CadNFSe.vccomveic:='';
    FrmAdmNFSe.CadNFSe.vfversao:='';
    FrmAdmNFSe.CadNFSe.vusuario := vusuario;
  end;
end;

function VisualizaNFSe(vendBanco: WideString;codempresa: integer;vusuario: WideString): longbool; stdcall;
begin
  Result := True;

  CreateFormAdmNFSe();
  try
    SetAttrFormAdmNFSe(vendBanco, codempresa, vusuario);

    if not FrmAdmNFSe.CadNFSe.conectaBanco then
      Exit;

    FrmAdmNFSe.CadNFSe.CadEmpresa.dadosGNfe;

    FrmAdmNfSe.ShowModal;
  finally
    ReleaseFormAdmNFSe;
  end;
  Exit;

  if DtmNFEHW = nil then
   DtmNFEHW:=TDtmNFEHW.create(nil);
  if FrmAdmNfe = nil then
  Application.CreateForm(TFrmAdmNFSe, FrmAdmNFSe);
  FrmAdmNFSe.cadnfgeralconf:=TClassNfe.create;
  FrmAdmNFSe.cadnfgeralconf.CadEmpresa.codempresa:=codempresa;
  FrmAdmNFSe.cadnfgeralconf.vcaminhobanco:=string(vendBanco);
  FrmAdmNFSe.cadnfgeralconf.cadempresa.codempresa:=codempresa;
  FrmAdmNFSe.cadnfgeralconf.vccomveic:='';
  FrmAdmNFSe.cadnfgeralconf.vfversao:='';
  FrmAdmNFSe.cadnfgeralconf.conectaBanco;
  FrmAdmNFSe.cadnfgeralconf.CadEmpresa.dadosGNfe;
  frmAdmNFSe.cadnfgeralconf.vusuario:=vusuario;
  FrmAdmNfSe.ShowModal;
  FrmAdmNfSe.cadnfgeralconf.DesconectaBanco;
  FrmAdmNfse.cadnfgeralconf.Free;
  FrmAdmNfse.cadnfgeralconf:=nil;
  FrmAdmNfse.Release;
  FrmAdmNfe:=nil;
  FreeAndNil(DtmNFEHW);
end;

function EnviaOSNFSe(vendBanco: WideString;codempresa: integer;vusuario: WideString;vos: integer): longbool; stdcall;
begin
  Result := True;

  CreateFormAdmNFSe();
  try
    SetAttrFormAdmNFSe(vendBanco, codempresa, vusuario);

    if not FrmAdmNFSe.CadNFSe.conectaBanco then
      Exit;

    FrmAdmNFSe.CadNFSe.CadEmpresa.dadosGNfe;
    FrmAdmNFSe.CadNFSe.vercidadeNFSe;
    frmAdmNFSe.cadnfse.vospesq := IntToStr(vos);

    Result := FrmAdmNFSe.EnviarNFSe(vos);
  finally
    ReleaseFormAdmNFSe;
  end;
  Exit;


  if DtmNFEHW = nil then
   DtmNFEHW:=TDtmNFEHW.create(nil);
  if FrmAdmNfe = nil then
  Application.CreateForm(TFrmAdmNFSe, FrmAdmNFSe);
  FrmAdmNFSe.cadnfgeralconf:=TClassNfe.create;
  FrmAdmNFSe.cadnfgeralconf.CadEmpresa.codempresa:=codempresa;
  FrmAdmNFSe.cadnfgeralconf.vcaminhobanco:=string(vendBanco);
  FrmAdmNFSe.cadnfgeralconf.cadempresa.codempresa:=codempresa;
  FrmAdmNFSe.cadnfgeralconf.vccomveic:='';
  FrmAdmNFSe.cadnfgeralconf.vfversao:='';
  FrmAdmNFSe.cadnfgeralconf.conectaBanco;
  FrmAdmNFSe.cadnfgeralconf.CadEmpresa.dadosGNfe;
  frmAdmNFSe.cadnfgeralconf.vusuario:=vusuario;
  FrmAdmNFSe.cadnfse:=TClassNfSe.create;
  frmAdmNFSe.cadnfse.cadempresa:=frmAdmNFSe.cadnfgeralconf.cadempresa;
  frmAdmNFSe.cadnfse.vusuario:=vusuario;
  FrmAdmNFSe.cadnfse.vercidadeNFSe;
  frmAdmNFSe.cadnfse.vospesq := IntToStr(vos);
  FrmAdmNFSe.EnviarNFSe(vos);
  FrmAdmNfSe.cadnfgeralconf.DesconectaBanco;
  FrmAdmNfse.cadnfgeralconf.Free;
  FrmAdmNfse.cadnfgeralconf:=nil;
  FrmAdmNfse.Release;
  FrmAdmNfe:=nil;
  FreeAndNil(DtmNFEHW);
end;

function EnviaOSNFSe_Silent(vendBanco: WideString;codempresa: integer;vusuario: WideString; vos: integer; var AEnviarEmail, AEnviarBoleto, AImprimir: Boolean): LongBool; stdcall;
var
  Aret_SendMail: Boolean;
  Aanexos: TStrings;
  I: Integer;
begin
  Result := True;

  CreateFormAdmNFSe();
  try
    SetAttrFormAdmNFSe(vendBanco, codempresa, vusuario);

    if not FrmAdmNFSe.CadNFSe.conectaBanco then
      Exit;

    with FrmAdmNFSe.CadNFSe do
    begin
      SilentMode := True;
      SendMail   := False;
      SendBoleto := False;

      CadEmpresa.dadosGNfe;
      vercidadeNFSe;
      vospesq := IntToStr(vos);

      if pesqOsNFSe(vos) then
      begin
        iniciaNFSE;
        nomecliente := dataSet.FieldByName('NOME_CLIENTE').AsString;
        Result := montarRPSEnv(dataSet.FieldByName('NPED').AsInteger);
        if not Result then
          Exit;
      end
      else
        Exit(False);

      Aret_SendMail := True;//controla se o email foi enviado com sucesso
      SendMail   := AEnviarEmail;
      SendBoleto := AEnviarBoleto;
      Imprimir   := AImprimir;

      if SendMail or SendBoleto or Imprimir then
        dataSet.Refresh
      else
        Exit;

      dataSet.First;
      while not dataSet.Eof do
      begin
        if dataSet.FieldByName('COD_RPS').AsInteger > 0 then
        begin
          iniciaNFSE;
          abrirRPSDireto;
          nomecliente := dataSet.FieldByName('NOME_CLIENTE').AsString;

          if AEnviarEmail then
          begin
            Aanexos := getArquivosBoletoParaAnexos;
            enviaemailNFSe(3, AAnexos);
            if Aret_SendMail then
              Aret_SendMail := not ErrorSendEmail;

            if Assigned(Aanexos) then
              for I := 0 to Aanexos.Count - 1  do
                DeleteFile(PWideChar(Aanexos[I]));
          end;

          if AImprimir then
            imprimedireto(2);
        end;

        dataSet.Next;
      end;

      AEnviarEmail  := SendMail and Aret_SendMail;
      AEnviarBoleto := SendBoleto;
      AImprimir     := Imprimir;
    end;

  finally
    ReleaseFormAdmNFSe;
  end;
end;


function EnviarEmailNFSe(vendBanco: WideString;codempresa: integer;vusuario: WideString; vos: integer; var AEnviarEmail, AEnviarBoleto, AImprimir: Boolean): LongBool; stdcall;
var
  Aret_SendMail: Boolean;
  Aanexos: TStrings;
  I: Integer;
begin
  Result := True;

  CreateFormAdmNFSe();
  try
    SetAttrFormAdmNFSe(vendBanco, codempresa, vusuario);

    if not FrmAdmNFSe.CadNFSe.conectaBanco then
      Exit;

    with FrmAdmNFSe.CadNFSe do
    begin
      SilentMode := True;
      SendMail   := False;
      SendBoleto := False;

      CadEmpresa.dadosGNfe;
      vercidadeNFSe;
      vospesq := IntToStr(vos);

      if pesqOsNFSe(vos) then
      begin
        iniciaNFSE;
        nomecliente := dataSet.FieldByName('NOME_CLIENTE').AsString;
//        Result := montarRPSEnv(dataSet.FieldByName('NPED').AsInteger, dataSet.FieldByName('ALIQ_ISS').AsInteger, '', 0);
//        if not Result then
//          Exit;
      end
      else
        Exit(False);

      Aret_SendMail := True;//controla se o email foi enviado com sucesso
      SendMail   := AEnviarEmail;
      SendBoleto := AEnviarBoleto;
      Imprimir   := AImprimir;

      if SendMail or SendBoleto or Imprimir then
        dataSet.Refresh
      else
        Exit;

      dataSet.First;
      while not dataSet.Eof do
      begin
        var iRPS := dataSet.FieldByName('COD_RPS').AsInteger;
        var iNF := dataSet.FieldByName('N_NF').AsLargeInt;
        if (iRPS > 0)and (iNF > 0) then
        begin
          iniciaNFSE;
          abrirRPSDireto;
          nomecliente := dataSet.FieldByName('NOME_CLIENTE').AsString;

          if AEnviarEmail then
          begin
            Aanexos := getArquivosBoletoParaAnexos;
            enviaemailNFSe(3, AAnexos);
            if Aret_SendMail then
              Aret_SendMail := not ErrorSendEmail;

            if Assigned(Aanexos) then
              for I := 0 to Aanexos.Count - 1  do
                DeleteFile(PWideChar(Aanexos[I]));
          end;

          if AImprimir then
            imprimedireto(2);
        end;

        dataSet.Next;
      end;

      AEnviarEmail  := SendMail and Aret_SendMail;
      AEnviarBoleto := SendBoleto;
      AImprimir     := Imprimir;
    end;

  finally
    ReleaseFormAdmNFSe;
  end;
end;

function GerarPdfNFSe(parametros: WideString): WideString; stdcall;
var
  Aanexos: TStrings;
  valores: TStrings;
begin

  CreateFormAdmNFSe();
  try
    try
      valores := NewStringList(parametros, ';');
      Aanexos := NewStringList('', ';');

      SetAttrFormAdmNFSe(valores.Values['databaseName'], StrToInt(valores.Values['codempresa']), valores.Values['usuario']);

      if not FrmAdmNFSe.CadNFSe.conectaBanco then
        raise Exception.Create('Erro ao conectar ao banco de dados');

      with FrmAdmNFSe.CadNFSe do
      begin

        CadEmpresa.dadosGNfe;
        vercidadeNFSe;
        vospesq := valores.Values['nped'];

        if pesqOsNFSe(StrToInt(valores.Values['nped'])) then
        begin
          iniciaNFSE;
        end
        else
          raise Exception.Create('O.S. não encontrada');

        dataSet.First;
        while not dataSet.Eof do
        begin
          if dataSet.FieldByName('COD_RPS').AsInteger > 0 then
          begin
            iniciaNFSE;
            abrirRPSDireto;
            nomecliente := dataSet.FieldByName('NOME_CLIENTE').AsString;

            Aanexos := getArquivosBoletoParaAnexos;

            valores := getArquivosNFSeParaAnexos(True);

            for var item in valores do
              Aanexos.Add(item);
          end;

          dataSet.Next;
        end;

      end;

      Result := Aanexos.Text;

    except on E: Exception do
      begin
        LogApp.Error('hw.nfe.dx.dll GerarPdfNFSe ' + E.Message);
        ShowAtencao('Erro ao gerar arquivos ' + sLineBreak + e.Message);
      end;
    end;

  finally
    ReleaseFormAdmNFSe;
  end;
end;

function Modulo11(Valor: string; Base: Integer = 9; Resto: Boolean = False): string;
{
  Rotina muito usada para calcular dígitos verificadores
  Pega-se cada um dos dígitos contidos no parâmetro VALOR, da direita para a
  esquerda e multiplica-se pela seqüência de pesos 2, 3, 4 ... até BASE.
  Por exemplo: se a base for 9, os pesos serão 2,3,4,5,6,7,8,9,2,3,4,5...
  Se a base for 7, os pesos serão 2,3,4,5,6,7,2,3,4...
  Soma-se cada um dos subprodutos.
  Divide-se a soma por 11.
  Faz-se a operação 11-Resto da divisão e devolve-se o resultado dessa
operação
  como resultado da função Modulo11.
  Obs.: Caso o resultado seja maior que 9, deverá ser substituído por 0
(ZERO).
}

var
  Soma, Contador, Peso, Digito: Integer;
begin
  Soma := 0;
  Peso := 2;
  for Contador := Length(Valor) downto 1 do
  begin
    Soma := Soma + (StrToInt(Valor[Contador]) * Peso);
    if Peso < Base then
      Peso := Peso + 1 else
      Peso := 2;
  end;

  if Resto then
    Result := IntToStr(Soma mod 11)
  else
  begin
    Digito := 11 - (Soma mod 11);
    if (Digito > 9) then
      Digito := 0;
    Result := IntToStr(Digito);
  end;
end;

function ValidaChaveNFe(vchave: WideString): longbool; stdcall;
var
 vdigito: string;
begin
  Result := True;
  if Length(Trim(vchave)) <> 44 then
    Result := False;
  vdigito := Copy(vchave, 44, 1);
  if Modulo11(Copy(vchave, 1, 43)) <> vdigito then
    Result := False;
end;

function EnviarEvento(vendBanco: WideString; codempresa, idLote: integer; vusuario: WideString;tpop: WideString): longbool; stdcall;
begin
  Result := True;

  CreateFormAdmNFe();
  try
    SetAttrFormAdmNFe('', vendBanco, codempresa, '', vusuario);

    if not FrmAdmNfe.CadNfeVenda.conectaBanco then
      Exit;

    FrmAdmNfe.CadNfeVenda.CadEmpresa.dadosGNfe;

    case StrToIntDef(tpop, -1) of
      1 : // Enviar Evento
        begin
          Result := FrmAdmNfe.enviaEvento(idlote);
        end;
      2 : // Imprimir Evento
        begin
          with FrmAdmNfe do
          begin
            CadNfevenda.cadCCe.buscaEvento(idLote,codempresa);
            CadNfevenda.pesquisaNF(strtoint(CadNfevenda.cadCCe.vnumnf),codempresa,CadNfevenda.cadCCe.vserie);

             if (Trim(CadNfevenda.cadCCe.dataSet.FieldByName('tipo_evento').AsString) = 'EPE') then
             begin
               leconfigNFE(CadNfevenda);
               Result := CadNfevenda.cadCCe.ImprimirEventoEPEC(CadNfevenda.dataSet.FieldByName('cod_nf').AsInteger, codempresa, ACBrNFe1);
             end
             else
               Result := ImprimirEvento(CadNfevenda.cadCCe.codigoEvento);
          end;
        end;
      3 : // Enviar email para o cliente do evento...
        begin
          with FrmAdmNfe do
          begin
            CadNfevenda.cadCCe.buscaEvento(idLote,codempresa);
            CadNfevenda.pesquisaNF(strtoint(CadNfevenda.cadCCe.vnumnf),codempresa,CadNfevenda.cadCCe.vserie);
            enviaEventoEmail(CadNfevenda.cadCCe.codigoEvento);
          end;
        end;
      4 : // Quando for 4 será envio de evento para nfdestinadas
        begin
          with FrmAdmNfe do
          begin
            if CadNfevenda.buscaNFDestinada(idLote, codempresa, '') then
              Result := enviaeventoNFeDestinadas(idLote)
            else
              Result := false;
            CadNfevenda.datasetnfdest.Close;
          end;
        end;
    end;
  finally
    ReleaseFormAdmNFe;
  end;
end;

function NFDestinadas(vendBanco: WideString; codempresa:integer; vusuario: WideString;indNFe,indemi: WideString;vtpultnsu: integer;vtpcons: integer;nsuespec: string): longbool; stdcall;
begin
  Result := True;

  CreateFormAdmNFe();
  try
    SetAttrFormAdmNFe('', vendBanco, codempresa, '', vusuario);

    if not FrmAdmNfe.CadNfeVenda.conectaBanco then
      Exit;

    FrmAdmNfe.CadNfeVenda.CadEmpresa.dadosGNfe;

    Result := FrmAdmNfe.verificaNFedestinadas(indNFe,indemi,vtpultnsu,nsuespec);
  finally
    ReleaseFormAdmNFe;
  end;
end;

function NFDownload(vendBanco: WideString; codempresa:integer; vusuario: WideString;vchave: WideString): longbool; stdcall;
begin
  Result := True;

  CreateFormAdmNFe();
  try
    SetAttrFormAdmNFe('', vendBanco, codempresa, '', vusuario);

    if not FrmAdmNfe.CadNfeVenda.conectaBanco then
      Exit;

    FrmAdmNfe.CadNfeVenda.CadEmpresa.dadosGNfe;

    Result := FrmAdmNfe.NFDownload(vchave);
  finally
    ReleaseFormAdmNFe;
  end;
end;

function SendMailByACBr(Host, Port, From, UserName, PassWord, FromName, Subject,
  Body, AttachmentList, AddressList, ReplyToList, CCList, BCCList, Priority: WideString;
  IsHTML, SetSSL, SetTLS, ReadingConfirmation, UseThread, ShowError, OnlyAttachmentByMail: LongBool): WideString; stdcall;
var
  ACBrMail1: TACBrMail;
  List: TStringList;
  Anexos: TStringList;
  I, J: Integer;

  function GetListaEmailValida(AText: string): TStringList;
  var
    Astr: string;
  begin
    Result := TStringList.Create;
    for Astr in AText.Split([' ', ',', ';', '|', Result.LineBreak]) do
      if not Astr.Trim.IsEmpty then
        Result.Add(Astr);
  end;

begin
  Result := WideString('OK');
  try
    ACBrMail1 := TACBrMail.Create(nil);
    try
      List   := TStringList.Create;
      Anexos := TStringList.Create;

      if OnlyAttachmentByMail then
      begin
        try
          if Trim(From).ToLower() = 'nfe@hwsistemas.com.br' then
          begin
            Result := 'Não é possível enviar único anexo por e-mail utilizando o email: ' + Trim(From);
            Exit;
          end;

          Anexos.Text := string(AttachmentList);
          for J := 0 to Anexos.Count - 1 do
          begin
            ACBrMail1.Clear;
            ACBrMail1.Host := string(Host);
            ACBrMail1.Port := string(Port);
            ACBrMail1.From := string(From);
            ACBrMail1.Username := string(UserName);
            ACBrMail1.Password := string(PassWord);
            ACBrMail1.FromName := string(FromName);
            ACBrMail1.Subject := string(Subject);
            if string(Priority) = '0' then
              ACBrMail1.Priority := MP_high
            else if string(Priority) = '2' then
              ACBrMail1.Priority := MP_low
            else
              ACBrMail1.Priority := MP_normal;
            List.Text := string(Body);
            if IsHTML then
              ACBrMail1.Body.Text := List.Text
            else
              ACBrMail1.AltBody.Text := List.Text;
            List.Text := string(Anexos[J]);
            for I := 0 to List.Count - 1 do ACBrMail1.AddAttachment(List[I], '', adAttachment);
            List := GetListaEmailValida(string(AddressList));
            for I := 0 to List.Count - 1 do ACBrMail1.AddAddress(List[I]);
            List := GetListaEmailValida(string(ReplyToList));
            for I := 0 to List.Count - 1 do ACBrMail1.AddReplyTo(List[I]);
            List := GetListaEmailValida(string(CCList));
            for I := 0 to List.Count - 1 do ACBrMail1.AddCC(List[I]);
            List := GetListaEmailValida(string(BCCList));
            for I := 0 to List.Count - 1 do ACBrMail1.AddBCC(List[I]);
            ACBrMail1.IsHTML := IsHTML;
            ACBrMail1.SetSSL := SetSSL;
            ACBrMail1.SetTLS := SetTLS;
            ACBrMail1.ReadingConfirmation := ReadingConfirmation;
            ACBrMail1.UseThread := UseThread;
            ACBrMail1.Send;
          end;
        finally
          FreeAndNil(List);
          FreeAndNil(Anexos);
        end;
      end
      else
      begin
        try
          ACBrMail1.Clear;
          ACBrMail1.Host := string(Host);
          ACBrMail1.Port := string(Port);
          ACBrMail1.From := string(From);
          ACBrMail1.Username := string(UserName);
          ACBrMail1.Password := string(PassWord);
          ACBrMail1.FromName := string(FromName);
          ACBrMail1.Subject := string(Subject);
          if string(Priority) = '0' then
            ACBrMail1.Priority := MP_high
          else if string(Priority) = '2' then
            ACBrMail1.Priority := MP_low
          else
            ACBrMail1.Priority := MP_normal;
          List.Text := string(Body);
          if IsHTML then
            ACBrMail1.Body.Text := List.Text
          else
            ACBrMail1.AltBody.Text := List.Text;
          List.Text := string(AttachmentList);
          for I := 0 to List.Count - 1 do ACBrMail1.AddAttachment(List[I], '', adAttachment);
          List := GetListaEmailValida(string(AddressList));
          for I := 0 to List.Count - 1 do ACBrMail1.AddAddress(List[I]);
          List := GetListaEmailValida(string(ReplyToList));
          for I := 0 to List.Count - 1 do ACBrMail1.AddReplyTo(List[I]);
          List := GetListaEmailValida(string(CCList));
          for I := 0 to List.Count - 1 do ACBrMail1.AddCC(List[I]);
          List := GetListaEmailValida(string(BCCList));
          for I := 0 to List.Count - 1 do ACBrMail1.AddBCC(List[I]);
          ACBrMail1.IsHTML := IsHTML;
          ACBrMail1.SetSSL := SetSSL;
          ACBrMail1.SetTLS := SetTLS;
          ACBrMail1.ReadingConfirmation := ReadingConfirmation;
          ACBrMail1.UseThread := UseThread;
          ACBrMail1.Send;
        finally
          FreeAndNil(List);
          FreeAndNil(Anexos);
        end;
      end;
    finally
      FreeAndNil(ACBrMail1);
    end;
  except on E: Exception do
    begin
      Result := WideString(e.Message);
      if ShowError then
        Application.MessageBox(PWideChar(E.Message), 'Erro', MB_ICONERROR + MB_OK);
    end;
  end;
end;

function hw_LerXMLNFe( AInput: PAnsiChar; out AOutput: PAnsiChar): Integer; stdcall;
//function hw_LerXMLNFe(AListParams: WideString): WideString; stdcall;
//var
//  ANFe: TClassNfVenda;
//begin
//  DtmNFEHW := TDtmNFEHW.create(nil);
//  ANFe := TClassNfVenda.create;
//  try
//    Result := ANFe.AddNFeInDBFromXML(AListParams);
//  finally
//    FreeAndNil(ANFe);
//    FreeAndNil(DtmNFEHW);
//  end;
var
  InputStr, OutputStr: AnsiString;
  ANFe: TClassNfVenda;
begin
  DtmNFEHW := TDtmNFEHW.create(nil);
  ANFe := TClassNfVenda.create;
  try

    try
      InputStr := AnsiString(AInput);
      // ... seu processamento ...
      OutputStr := AnsiString(ANFe.AddNFeInDBFromXML( InputStr ));

      // Aloca com API do Windows (compatível entre versões)
      AOutput := CoTaskMemAlloc(Length(OutputStr) + 1);
      StrCopy(AOutput, PAnsiChar(OutputStr));
      Result := 0; // sucesso
    except
      on E: Exception do
      begin
        AOutput := CoTaskMemAlloc(Length(E.Message) + 1);
        StrCopy(AOutput, PAnsiChar(AnsiString(E.Message)));
        Result := 1; // erro
      end;
    end;
  finally
    FreeAndNil(ANFe);
    FreeAndNil(DtmNFEHW);
  end;
end;

function hw_LerXMLNFeSaida(AListParams: WideString): WideString; stdcall;
var
  ANFe: TClassNfVenda;
begin
  DtmNFEHW := TDtmNFEHW.create(nil);
  ANFe := TClassNfVenda.create;
  try
    Result := ANFe.AddNFeInDBFromXMLSaida(AListParams);
  finally
    FreeAndNil(ANFe);
    FreeAndNil(DtmNFEHW);
  end;
end;

function nfse_get_regime_especial_trib(vendBanco: WideString; codempresa: integer): WideString; stdcall;
begin
  DtmNFEHW := TDtmNFEHW.create(nil);
  var nfse := TClassNfSe.create;
  try
    nfse.CadEmpresa.codempresa := codempresa;
    nfse.vcaminhobanco := string(vendBanco);

    if not nfse.conectaBanco then
      Exit;

    Result := nfse.GetListaRegimeEspecialTributacao();

  finally
    nfse.Free;
    DtmNFEHW.Free;
  end;
end;

function ConsisteInscricaoEstadual(const Insc, UF: WideString; Silent: Boolean): Integer; stdcall;
begin
  Result := 1;

  var validador := TACBrValidador.Create(nil);
  try
    validador.TipoDocto := TACBrValTipoDocto.docInscEst;
    validador.Documento := Insc;
    validador.Complemento := UF;

    if validador.Validar then
      Result := 0

    else if not Silent then
      ShowErro(validador.MsgErro);

  finally
    validador.Free();
  end;
end;

exports
   VisualizaNFe,
   EnviarNFeHW,
   ConsultaSefazOr,
   ConsNFEDLL,
   EnviarEmailNFe,
   VisualizaNFSe,
   EnviaOSNFSe,
   EnviaOSNFSe_Silent,
   EnviarEmailNFSe,
   GerarPdfNFSe,
   ValidaChaveNFe,
   EnviarEvento,
   NFDestinadas,
   NFDownload,
   SendMailByACBr,
   hw_LerXMLNFe,
   hw_LerXMLNFeSaida,
   nfse_get_regime_especial_trib,
   ConsisteInscricaoEstadual;

begin
end.
