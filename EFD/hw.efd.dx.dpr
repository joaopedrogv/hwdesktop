library hw.efd.dx;

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
  System.SysUtils,
  System.Classes,
  ACBRSpedFiscalUtilHw in 'fonte\ACBRSpedFiscalUtilHw.pas',
  ACBRSpedPISCOFINSUtilHw in 'fonte\ACBRSpedPISCOFINSUtilHw.pas',
  uClassesSpedFiscal in 'fonte\uClassesSpedFiscal.pas',
  uClassesSpedPISCOFINS in 'fonte\uClassesSpedPISCOFINS.pas',
  uCreditosPISCOFINS in 'fonte\uCreditosPISCOFINS.pas' {frmCreditoPISCOFNS},
  uDemostrativoCredRetPISCOFINS in 'fonte\uDemostrativoCredRetPISCOFINS.pas' {frmDemostrativoCredRetPISCOFINS},
  uDiferencaE310entreE316 in 'fonte\uDiferencaE310entreE316.pas' {frmDifE310eE316},
  uFormDefinirPISCOFINSCP in 'fonte\uFormDefinirPISCOFINSCP.pas' {frmDefinirPISCOFINSCP},
  uFormSpedFiscal in 'fonte\uFormSpedFiscal.pas' {frmSpedFiscal},
  uFormSpedPISCOFINS in 'fonte\uFormSpedPISCOFINS.pas' {frmSpedPISCOFINS},
  uHistCreditosPISCOFINS in 'fonte\uHistCreditosPISCOFINS.pas' {frmHistCreditosPISCOFINS},
  uHistRetencoesPISCOFINS in 'fonte\uHistRetencoesPISCOFINS.pas' {frmHistRetencoesPISCOFINS},
  UPesProsSPED in 'fonte\UPesProsSPED.pas' {FrmPesqProsSPED},
  uRetencoesPISCOFINS in 'fonte\uRetencoesPISCOFINS.pas' {frmRetencoesPISCOFINS},
  uSpedHw in 'fonte\uSpedHw.pas',
  Vcl.Forms,
  uFormSpedFiscal_bloco_K in 'fonte\uFormSpedFiscal_bloco_K.pas' {formSpedFiscal_bloco_K},
  config_sistema_class in '..\Ativos\fonte\config_sistema_class.pas',
  uClasseConexao in '..\Automacao Bpl\fonte\uClasseConexao.pas',
  hw_utils in '..\Ativos\fonte\hw_utils.pas',
  hw_audit_utils in '..\Ativos\fonte\hw_audit_utils.pas',
  hw_auditoria_class in '..\Ativos\fonte\hw_auditoria_class.pas',
  hw_processo_class in '..\Ativos\fonte\hw_processo_class.pas',
  senhas_class in '..\Ativos\fonte\senhas_class.pas',
  tabela_processos_class in '..\Ativos\fonte\tabela_processos_class.pas',
  tabela_processos_usuarios_class in '..\Ativos\fonte\tabela_processos_usuarios_class.pas',
  solicitacoes_acesso_class in '..\Ativos\fonte\solicitacoes_acesso_class.pas',
  uPesqPros_lote in '..\Ativos\fonte\uPesqPros_lote.pas' {frmPesqPros_lote},
  hw_lote_liberacao_class in '..\Ativos\fonte\hw_lote_liberacao_class.pas',
  hw_rest_compl_utils in '..\Ativos\fonte\hw_rest_compl_utils.pas',
  hw_win_utils in '..\Ativos\fonte\hw_win_utils.pas',
  uSpedHwClasses in 'fonte\uSpedHwClasses.pas',
  efd_icmsst_cr_apuracao_class in '..\Ativos\fonte\efd_icmsst_cr_apuracao_class.pas',
  basefb_class in '..\Ativos\fonte\basefb_class.pas',
  sped_lancamento_fiscal_class in '..\Ativos\fonte\sped_lancamento_fiscal_class.pas',
  uCalculoPISCOFINS in 'fonte\uCalculoPISCOFINS.pas',
  hw_strings in '..\Ativos\fonte\hw_strings.pas',
  opfiscal_confs in '..\Ativos\fonte\opfiscal_confs.pas',
  opfiscal_hw in '..\Ativos\fonte\opfiscal_hw.pas',
  opfiscal_model in '..\Ativos\fonte\opfiscal_model.pas',
  notafiscal_item_fb in '..\Ativos\fonte\notafiscal_item_fb.pas',
  produtos_tmp_fb in '..\Ativos\fonte\produtos_tmp_fb.pas',
  ItemNota_Model in 'fonte\ItemNota_Model.pas',
  hw_progress_utils in '..\Ativos\fonte\hw_progress_utils.pas' {FrmDoProgress},
  ean_utils in '..\Ativos\fonte\ean_utils.pas',
  Query_OOP in '..\Ativos\fonte\Query_OOP.pas',
  Types_OOP in '..\Ativos\fonte\Types_OOP.pas',
  hw_subapuracao_conf in '..\Ativos\fonte\hw_subapuracao_conf.pas',
  hw_const_types in '..\Ativos\fonte\hw_const_types.pas',
  hw_graphics_utils in '..\Ativos\fonte\hw_graphics_utils.pas',
  MyShellApi in '..\Ativos\fonte\MyShellApi.pas',
  hw_setconfig_base in '..\Ativos\fonte\hw_setconfig_base.pas',
  hw_setconfig_efd_piscofins in 'fonte\hw_setconfig_efd_piscofins.pas',
  USock in '..\Utils\USock.pas',
  ConfigGlobalNF_RTC in '..\Ativos\fonte\Fiscal\TributosDFe\ConfigGlobalNF_RTC.pas',
  SetupUnit in '..\Modern\Core\Infrastructure\SetupUnit.pas',
  SetupEFDUnit in 'Modern\SetupEFDUnit.pas',
  ContainerEFDUnit in '..\Modern\Core\Infrastructure\DI\ContainerEFDUnit.pas',
  ErpFeaturesFactoryEFDUnit in '..\Modern\ERP.Features\Infrastructure\ErpFeaturesFactoryEFDUnit.pas',
  IServiceFactoryUnit in '..\Modern\Core\Infrastructure\DI\IServiceFactoryUnit.pas',
  BaseClassUnit in '..\Modern\Core\Infrastructure\Base\BaseClassUnit.pas',
  BaseUseCaseUnit in '..\Modern\Core\Infrastructure\Base\BaseUseCaseUnit.pas',
  ISessionContextUnit in '..\Modern\Core\Domain\Ports\Shared\ISessionContextUnit.pas',
  BooleanNullableUnit in '..\Modern\Core\Domain\Types\Shared\BooleanNullableUnit.pas',
  CurrencyNullableUnit in '..\Modern\Core\Domain\Types\Shared\CurrencyNullableUnit.pas',
  DateAndTimeNullableUnit in '..\Modern\Core\Domain\Types\Shared\DateAndTimeNullableUnit.pas',
  DoubleNullableUnit in '..\Modern\Core\Domain\Types\Shared\DoubleNullableUnit.pas',
  IntegerNullableUnit in '..\Modern\Core\Domain\Types\Shared\IntegerNullableUnit.pas',
  StatusRegistroEnumUnit in '..\Modern\Core\Domain\Types\Shared\StatusRegistroEnumUnit.pas',
  StringNullableUnit in '..\Modern\Core\Domain\Types\Shared\StringNullableUnit.pas',
  TipoComunsUnit in '..\Modern\Core\Domain\Types\Shared\TipoComunsUnit.pas',
  BaseRepositoryUnit in '..\Modern\Core\Infrastructure\Base\BaseRepositoryUnit.pas',
  CacheableRepositoryUnit in '..\Modern\Core\Infrastructure\Base\CacheableRepositoryUnit.pas',
  EntityBaseUnit in '..\Modern\Core\Infrastructure\Base\EntityBaseUnit.pas',
  EntityMetadataUnit in '..\Modern\Core\Infrastructure\Base\EntityMetadataUnit.pas',
  ObjectCacheUnit in '..\Modern\Core\Infrastructure\Cache\ObjectCacheUnit.pas',
  SimpleRecordCacheUnit in '..\Modern\Core\Infrastructure\Cache\SimpleRecordCacheUnit.pas',
  FileConfigUnit in '..\Modern\Core\Infrastructure\Config\FileConfigUnit.pas',
  SetupConfigUnit in '..\Modern\Core\Infrastructure\Config\SetupConfigUnit.pas',
  ParameterValueUnit in '..\Modern\Core\Infrastructure\Data\ParameterValueUnit.pas',
  QueryResultUnit in '..\Modern\Core\Infrastructure\Data\QueryResultUnit.pas',
  ScalarResultUnit in '..\Modern\Core\Infrastructure\Data\ScalarResultUnit.pas',
  EValidacaoNegocioUnit in '..\Modern\Core\Infrastructure\Exceptions\EValidacaoNegocioUnit.pas',
  IDatabaseConnectionFactoryUnit in '..\Modern\Core\Infrastructure\Interfaces\IDatabaseConnectionFactoryUnit.pas',
  IDataBaseConnectionUnit in '..\Modern\Core\Infrastructure\Interfaces\IDataBaseConnectionUnit.pas',
  IErrorLoggerUnit in '..\Modern\Core\Infrastructure\Interfaces\IErrorLoggerUnit.pas',
  IObjectCacheUnit in '..\Modern\Core\Infrastructure\Interfaces\IObjectCacheUnit.pas',
  IRecordCacheUnit in '..\Modern\Core\Infrastructure\Interfaces\IRecordCacheUnit.pas',
  ISimpleLoggerUnit in '..\Modern\Core\Infrastructure\Interfaces\ISimpleLoggerUnit.pas',
  ISqlLoggerUnit in '..\Modern\Core\Infrastructure\Interfaces\ISqlLoggerUnit.pas',
  ITransactionUnit in '..\Modern\Core\Infrastructure\Interfaces\ITransactionUnit.pas',
  GuidServiceUnit in '..\Modern\Core\Infrastructure\Services\GuidServiceUnit.pas',
  NumberServiceUnit in '..\Modern\Core\Infrastructure\Services\NumberServiceUnit.pas',
  StringServiceUnit in '..\Modern\Core\Infrastructure\Services\StringServiceUnit.pas',
  BaseDatabaseConnectionUnit in '..\Modern\Adapters\Secondary\Database\BaseDatabaseConnectionUnit.pas',
  DatabaseConnectionFactoryUnit in '..\Modern\Adapters\Secondary\Database\DatabaseConnectionFactoryUnit.pas',
  IBXDatabaseConnectionUnit in '..\Modern\Adapters\Secondary\Database\Firebird\IBXDatabaseConnectionUnit.pas',
  IBXTransactionBaseUnit in '..\Modern\Adapters\Secondary\Database\Firebird\IBXTransactionBaseUnit.pas',
  IBXTransactionLegacyUnit in '..\Modern\Adapters\Secondary\Database\Firebird\IBXTransactionLegacyUnit.pas',
  IBXTransactionUnit in '..\Modern\Adapters\Secondary\Database\Firebird\IBXTransactionUnit.pas',
  FileErrorLoggerUnit in '..\Modern\Core\Infrastructure\Logging\FileErrorLoggerUnit.pas',
  SqlFileLoggerUnit in '..\Modern\Core\Infrastructure\Logging\SqlFileLoggerUnit.pas',
  BaseSqlLoggerUnit in '..\Modern\Core\Infrastructure\Logging\BaseSqlLoggerUnit.pas',
  SessionContextUnit in '..\Modern\Core\Application\Contexts\SessionContextUnit.pas',
  ResolverAjustesEFDRedBenefPcUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\RedBenefPC\ResolverAjustesEFDRedBenefPcUseCaseUnit.pas',
  ModelosDFeEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\DFe\ModelosDFeEnumUnit.pas',
  AjusteRedBenefPcEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\RedBenefPC\AjusteRedBenefPcEtdUnit.pas',
  RegraRedBenefPcEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\RedBenefPC\RegraRedBenefPcEtdUnit.pas',
  AjusteRedBenefPcModelUnit in '..\Modern\ERP.Features\Core\Domain\Models\RedBenefPC\AjusteRedBenefPcModelUnit.pas',
  ContextoDocTribPcModelUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\DFe\ContextoDocTribPcModelUnit.pas',
  ConsolidadorContextoFiscalPcServiceUnit in '..\Modern\ERP.Features\Core\Application\Services\RedBenefPC\ConsolidadorContextoFiscalPcServiceUnit.pas',
  IConsolidadorContextoFiscalPcServiceUnit in '..\Modern\ERP.Features\Core\Application\Services\RedBenefPC\IConsolidadorContextoFiscalPcServiceUnit.pas',
  AplicadorRedBenefPcServiceUnit in '..\Modern\ERP.Features\Core\Domain\Services\RedBenefPC\AplicadorRedBenefPcServiceUnit.pas',
  CalcularAjusteRedBenefPcServiceUnit in '..\Modern\ERP.Features\Core\Domain\Services\RedBenefPC\CalcularAjusteRedBenefPcServiceUnit.pas',
  IAplicadorRedBenefPcServiceUnit in '..\Modern\ERP.Features\Core\Domain\Services\RedBenefPC\IAplicadorRedBenefPcServiceUnit.pas',
  ICalcularAjusteRedBenefPcServiceUnit in '..\Modern\ERP.Features\Core\Domain\Services\RedBenefPC\ICalcularAjusteRedBenefPcServiceUnit.pas',
  CalcularPisCofinsServiceUnit in '..\Modern\ERP.Features\Core\Domain\Services\CalculoTributos\CalcularPisCofinsServiceUnit.pas',
  ICalcularPisCofinsServiceUnit in '..\Modern\ERP.Features\Core\Domain\Services\CalculoTributos\ICalcularPisCofinsServiceUnit.pas',
  INotasConsumidorRepositoryUnit in '..\Modern\ERP.Features\Core\Domain\Ports\INotasConsumidorRepositoryUnit.pas',
  INotasFiscaisRepositoryUnit in '..\Modern\ERP.Features\Core\Domain\Ports\INotasFiscaisRepositoryUnit.pas',
  IAjustesRedBenefPcRepositoryUnit in '..\Modern\ERP.Features\Core\Domain\Ports\IAjustesRedBenefPcRepositoryUnit.pas',
  IRegrasRedBenefPcRepositoryUnit in '..\Modern\ERP.Features\Core\Domain\Ports\IRegrasRedBenefPcRepositoryUnit.pas',
  CalculoPisCofinsInputUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\CalculoTributos\CalculoPisCofinsInputUnit.pas',
  CalculoPisCofinsResultUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\CalculoTributos\CalculoPisCofinsResultUnit.pas',
  UpdateDFeRedBenefPcCalcCommandsUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\Models\DFe\UpdateDFeRedBenefPcCalcCommandsUnit.pas',
  NotasFiscaisRepositoryUnit in '..\Modern\ERP.Features\Adapters\Secondary\Repositories\NotasFiscaisRepositoryUnit.pas',
  NotasConsumidorRepositoryUnit in '..\Modern\ERP.Features\Adapters\Secondary\Repositories\NotasConsumidorRepositoryUnit.pas',
  AjustesRedBenefPcRepositoryUnit in '..\Modern\ERP.Features\Adapters\Secondary\Repositories\AjustesRedBenefPcRepositoryUnit.pas',
  RegrasRedBenefPcRepositoryUnit in '..\Modern\ERP.Features\Adapters\Secondary\Repositories\RegrasRedBenefPcRepositoryUnit.pas',
  IConfiguracoesRepositoryUnit in '..\Modern\ERP.Features\Core\Domain\Ports\IConfiguracoesRepositoryUnit.pas',
  EmailConfigModelUnit in '..\Modern\Core\Domain\ValueObjects\Shared\EmailConfigModelUnit.pas',
  ConfiguracaoEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\ConfiguracaoEtdUnit.pas',
  ConfiguracaoTipoEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\ConfiguracaoTipoEnumUnit.pas',
  ConfigLegacyTypes in '..\Modern\ERP.Features\Core\Domain\ValueObjects\Configuracoes\ConfigLegacyTypes.pas',
  EmailConfigRemetenteEnumUnit in '..\Modern\Core\Domain\Types\Shared\EmailConfigRemetenteEnumUnit.pas',
  ConfiguracoesRepositoryUnit in '..\Modern\ERP.Features\Adapters\Secondary\Repositories\ConfiguracoesRepositoryUnit.pas',
  PeriodoEmpresaVOUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\PeriodoEmpresaVOUnit.pas',
  ResolverAjustesEFDRedBenefPcInputUnit in '..\Modern\ERP.Features\Core\Application\InputPorts\EFD\ResolverAjustesEFDRedBenefPcInputUnit.pas',
  ObterRegistrosDeAjusteEFDRedBenefPCUseCaseUnit in '..\Modern\ERP.Features\Core\Application\UseCases\RedBenefPC\ObterRegistrosDeAjusteEFDRedBenefPCUseCaseUnit.pas',
  RegistroAjusteEFDPCVOUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\EFD\PISCOFINS\RegistroAjusteEFDPCVOUnit.pas',
  RegistroAjusteDetalheEFDPCVOUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\EFD\PISCOFINS\RegistroAjusteDetalheEFDPCVOUnit.pas',
  CompilarRegistrosDeAjusteEFDRedBenefPCServiceUnit in '..\Modern\ERP.Features\Core\Domain\Services\RedBenefPC\CompilarRegistrosDeAjusteEFDRedBenefPCServiceUnit.pas',
  PeriodoMultiEmpresaVOUnit in '..\Modern\ERP.Features\Core\Domain\ValueObjects\PeriodoMultiEmpresaVOUnit.pas',
  ObterRegistrosDeAjusteEFDRedBenefPCOutputUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\EFD\ObterRegistrosDeAjusteEFDRedBenefPCOutputUnit.pas',
  ArrayServiceUnit in '..\Modern\Core\Infrastructure\Services\ArrayServiceUnit.pas',
  ICompilarRegistrosDeAjusteEFDRedBenefPCServiceUnit in '..\Modern\ERP.Features\Core\Domain\Services\RedBenefPC\ICompilarRegistrosDeAjusteEFDRedBenefPCServiceUnit.pas',
  NotaFiscalResumoModelUnit in '..\Modern\ERP.Features\Core\Domain\Models\NotaFiscal\NotaFiscalResumoModelUnit.pas',
  FormatoImpressaoDANFeEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\NotaFiscal\FormatoImpressaoDANFeEnumUnit.pas',
  TipoEmissaoNFeEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\NotaFiscal\TipoEmissaoNFeEnumUnit.pas',
  NaturezaNfEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\NotaFiscal\NaturezaNfEnumUnit.pas',
  TipoNfEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\NotaFiscal\TipoNfEnumUnit.pas',
  StatusNfEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\NotaFiscal\StatusNfEnumUnit.pas',
  SituacaoNFeEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\NotaFiscal\SituacaoNFeEnumUnit.pas',
  TipoAmbienteNFeEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\NotaFiscal\TipoAmbienteNFeEnumUnit.pas',
  NotaFiscalPendenciaSefEtdUnit in '..\Modern\ERP.Features\Core\Domain\Entities\NotaFiscal\NotaFiscalPendenciaSefEtdUnit.pas',
  StatusResolucaoNFeSefEnumUnit in '..\Modern\ERP.Features\Core\Domain\Types\NotaFiscal\StatusResolucaoNFeSefEnumUnit.pas',
  ConverterParaContingenciaResultUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\Models\NotaFiscal\ConverterParaContingenciaResultUnit.pas',
  UpdateNotaFiscalConverterParaContingenciaCommandUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\Models\NotaFiscal\UpdateNotaFiscalConverterParaContingenciaCommandUnit.pas',
  UpdateNotaFiscalItemContextoRtcCommandUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\Models\NotaFiscal\UpdateNotaFiscalItemContextoRtcCommandUnit.pas',
  UpdatePendenciaSefazAvancoCommandUnit in '..\Modern\ERP.Features\Core\Application\OutputPorts\Models\NotaFiscal\UpdatePendenciaSefazAvancoCommandUnit.pas',
  NotaFiscalItemContextoRtcModelUnit in '..\Modern\ERP.Features\Core\Domain\Models\NotaFiscal\NotaFiscalItemContextoRtcModelUnit.pas',
  NotaFiscalPendenciaSefModelUnit in '..\Modern\ERP.Features\Core\Domain\Models\NotaFiscal\NotaFiscalPendenciaSefModelUnit.pas';

{$R *.res}

procedure closeallAuditoria_DX ;stdcall; external 'hw.auditoria.dx.dll';

function hw_gerarEFD_ICMSIPI(ACodEmpresa, AEnderecoBanco, AUsuario, ANivel: WideString): Boolean; stdcall;
var
	ASped: TSpedFiscal;
begin

  vDadosIniSPED :=  TSingleton.GetInstance;
  vDadosIniSPED.vNomeUsuario := AUsuario;
  vDadosIniSPED.vCodEmpresa := ACodEmpresa;
  vDadosIniSPED.vNivel := StrToIntDef(ANivel, 1);

  try
  	ASped.abreFormSpedFiscal(ACodEmpresa, AEnderecoBanco);
  finally
    closeallAuditoria_DX;
//    FreeAndNil(vDadosIniSPED);
  end;
end;

function hw_gerarEFD_ICMSIPI_PAFECF(ACodEmpresa, AEnderecoBanco, ADataIni, ADataFim, ANomeArquivo, AUsuario, ANivel: WideString): string; stdcall;
var
  ASped : TSpedFiscal;
begin

  vDadosIniSPED :=  TSingleton.GetInstance;
  vDadosIniSPED.vNomeUsuario := AUsuario;
  vDadosIniSPED.vCodEmpresa := ACodEmpresa;
  vDadosIniSPED.vNivel := StrToIntDef(ANivel, 1);

  Application.CreateForm(TfrmSpedFiscal, frmSpedFiscal);
  Application.CreateForm(TfrmSpedFiscal, frmSpedFiscal);
  Application.CreateForm(TFrmPesqProsSPED, FrmPesqProsSPED);
  Application.CreateForm(TformSpedFiscal_bloco_K, formSpedFiscal_bloco_K);
  Application.CreateForm(TfrmPesqPros_lote, frmPesqPros_lote);
  Application.CreateForm(TFrmDoProgress, FrmDoProgress);
  //  Application.CreateForm(TFrmPesqPros, FrmPesqPros);
  try
    frmSpedFiscal.vCodEmpresa := ACodEmpresa;
    frmSpedFiscal.vEndBanco := AEnderecoBanco;

    ASped := TSpedFiscal.create;
    frmSpedFiscal.vTempoGasto := Now;
    frmSpedFiscal.Timer1.Enabled := True;
    try
      ASped.DataIni := ADataIni;
      ASped.DataFim := ADataFim;
      frmSpedFiscal.dtIni.Text := ASped.DataIni;
      frmSpedFiscal.dtFim.Text := ASped.DataFim;
      frmSpedFiscal.GroupBox3.Enabled := False;
      frmSpedFiscal.Panel1.Enabled := False;
      frmSpedFiscal.ckBlocoH.Checked := True;
			ASped.CodEmpresa:= ACodEmpresa;
			ASped.EnderecoBanco := AEnderecoBanco;
			ASped.Destino := ANomeArquivo;
      //ExtractFilePath(Application.ExeName)+'ArquivosDigitais\S'+
        //copy(StringReplace(ASped.DataIni,'/','',[rfReplaceAll]),3,6)+'.txt';

      frmSpedFiscal.edDestino.Text := ASped.Destino;
      ASped.DataInv := ASped.DataFim;
			frmSpedFiscal.dtInventario.Text := ASped.DataInv;
      ASped.Finalidade :=frmSpedFiscal.ComboBox1.Text;
      ASped.FLabelStatus := (frmSpedFiscal.lbStatus);
      ASped.FLabelBloco := (frmSpedFiscal.lbBloco);
      ASped.FLabelCupons := (frmSpedFiscal.lbCupons);
      ASped.FProgressBar := (frmSpedFiscal.ProgressBar1);
      ASped.FProgressBar2 := (frmSpedFiscal.ProgressBar2);

      ASped.vBloco0 := True;
      ASped.vBlocoC := True;
      ASped.vBlocoD := True;
      ASped.vBlocoE := True;
      ASped.vBlocoG := True;
      ASped.vBlocoH := True;
      ASped.vBloco1 := True;
      ASped.vBloco9 := True;

      frmSpedFiscal.dtIni.Text := ASped.DataIni;
      frmSpedFiscal.dtFim.Text := ASped.DataFim;

      frmSpedFiscal.Show;
      frmSpedFiscal.Refresh;

      ASped.iniciaSpedFiscal;
      Result := ASped.Destino;
    finally
      frmSpedFiscal.GroupBox3.Enabled := True;
      frmSpedFiscal.Panel1.Enabled := True;
      ASped.Free;
      frmSpedFiscal.Timer1.Enabled := False;
      frmSpedFiscal.lbTempo.Caption := 'Tempo Gasto: '+TimeToStr(Now - frmSpedFiscal.vTempoGasto);
      Application.MessageBox(pchar('Arquivo "SPED Fiscal Ato COTEPE ICMS 09/08: criado com sucesso'+ #13 +
        'O arquivo foi salvo em: ' + frmSpedFiscal.edDestino.Text),'Atenção',0+64);
      frmSpedFiscal.ProgressBar1.Position := 0;
      frmSpedFiscal.ProgressBar2.Position := 0;
    end;
  finally
    frmSpedFiscal.Free;
    frmSpedFiscal := nil;
  end;
end;

function hw_gerarEFD_Contribuicoes(AEnderecoBanco, ACNPJ, AUsuario, ACodEmpresa, ANivel: WideString): Boolean; stdcall;
var
  ASped: TSpedPISCOFINS;
begin
  vDadosIniSPED :=  TSingleton.GetInstance;
  vDadosIniSPED.vNomeUsuario := AUsuario;
  vDadosIniSPED.vCodEmpresa := ACodEmpresa;
  vDadosIniSPED.vNivel := StrToIntDef(ANivel, 1);
  try
    ASped.abreFormSPEDPISCOFINS(AEnderecoBanco, ACNPJ);
  finally
    closeallAuditoria_DX;
//    FreeAndNil(vDadosIniSPED);
  end;
end;

exports
  hw_gerarEFD_ICMSIPI,
  hw_gerarEFD_ICMSIPI_PAFECF,
  hw_gerarEFD_Contribuicoes;

begin
end.
