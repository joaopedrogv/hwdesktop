unit ErpFeaturesFactoryUnit;

interface     

uses
  ErpFeaturesFactoryBaseUnit,
  IServiceFactoryUnit,
  ISessionContextUnit,
  IDatabaseConnectionUnit,
  ISharedFactoryUnit,
  ObterGruposFiscaisUseCaseUnit,
  RemoverGrupoFiscalUseCaseUnit,
  SalvarGrupoFiscalUseCaseUnit,
  ListarGruposFiscaisUseCaseUnit,
  ListarEmpresasUseCaseUnit,
  ObterOperacaoInternaPorIdUseCaseUnit,
  SalvarOperacaoInternaUseCaseUnit,
  RemoverOperacaoInternaUseCaseUnit,
  ListarOperacoesInternasUseCaseUnit,
  ObterRegraFiscalIbsCbsPorIdUseCaseUnit,
  SalvarRegraFiscalIbsCbsUseCaseUnit,
  RemoverRegraFiscalIbsCbsUseCaseUnit,
  ListarRegrasFiscaisUseCaseUnit,
  ResolverRegraFiscalIbsCbsUseCaseUnit,
  ObterOperacaoFiscalIbsCbsPorIdUseCaseUnit,
  SalvarOperacaoFiscalIbsCbsUseCaseUnit,
  RemoverOperacaoFiscalIbsCbsUseCaseUnit,
  ListarOpIntComTpVendasUseCaseUnit,
  VincularOpInternasATipoVendaUseCaseUnit,
  VincularTiposVendasAOpInternaUseCaseUnit,
  ListarTiposVendasUseCaseUnit,
  ObterTiposVendasUseCaseUnit,
  ListarTributosDFePorDocFiscalUseCaseUnit,
  ISalvarTributoDFeUseCaseUnit,
  IRemoverTributoDFeUseCaseUnit,
  ListarMunicipiosUseCaseUnit,
  ObterVersaoDadosFiscaisUseCaseUnit,
  ObterResumoDadosFiscaisUseCaseUnit,
  CriarGruposFiscaisDeAnexosUseCaseUnit,
  ListarAnexosUseCaseUnit,
  AtualizarGruposFiscaisNoProdutoEmLoteUseCaseUnit,
  ObterNcmUseCaseUnit,
  ExcluirRascunhoNFSeUseCaseUnit,
  IniciarDpsVazioUseCaseUnit,
  IniciarSubstuicaoNFSeUseCaseUnit,
  ObterClienteUseCaseUnit,
	ObterTipoServicoUseCaseUnit,
  AtualizarFiscalNFSeUseCaseUnit,
	CalcularTributosNFSeUseCaseUnit,
  CalcularTotaisNFSeUseCaseUnit,
  SalvarNFSeUseCaseUnit,
  ObterNFSeUseCaseUnit,
  EmitirNFSeUseCaseUnit,
  SalvarConfiguracaoNFSeUseCaseUnit,
  IConfiguracaoNFSeServiceUnit,
  CancelarNFSeUseCaseUnit,
  ReverterCancelamentoPortalNFSeUseCaseUnit,
  ReverterAutorizacaoPortalNFSeUseCaseUnit,
  ExcluirCancelamentoNFSeUseCaseUnit,
  ObterNFSeEventoUseCaseUnit,
  ConcluirDoPortalNFSeUseCaseUnit,
  IProgressObserverUnit,
  CriarEmitirNFSeAgrupadasUseCaseUnit,
  ICalcularTributosNFSeServiceUnit,
  IResolverRegraFiscalIbsCbsServiceUnit,
  ObterConfiguracaoNFSeUseCaseUnit,
  IEmitirNFSeServiceUnit,
  IAtualizarSituacaoNFSeServiceUnit,
  RemoverNFSeOSUseCaseUnit,
  NFSExecutorCoordinatorUnit,
  ICriarEmitirNFSeAgrupadasUseCaseUnit,
  ICriarAnexosEmailUseCaseUnit,
  IPrepararNFSeParaEmissaoServiceUnit, ConsultarEmissaoNFSeUseCaseUnit, ChecarPossivelRetencaoNFSeUseCaseUnit,
  IParametrosFiscaisNFSeServiceUnit, AlternarNaturezaEmissaoPropiaNFSeUseCaseUnit, ObterNFSeOSsUseCaseUnit,
  SalvarRegraRedBenefPcUseCaseUnit,
  ObterSituacaoEmissaoNFSeDeOrdemServUseCaseUnit, ObterRegraRedBenefPcUseCaseUnit, RemoverRegraRedBenefPcUseCaseUnit,
  IRegistrarAjusteRedBenefPcUseCaseUnit, IOperacaoPassivelDeRedBenefPcUseCaseUnit, ListarInfComplPorTipoPcUseCaseUnit,
  SalvarAjusteRedBenefPcUseCaseUnit, ObterAjusteRedBenefPcPorIdUseCaseUnit, RemoverAjusteRedBenefPcUseCaseUnit,
  ListarRegrasRedBenefPcUseCaseUnit, ListarDFeAlertasUseCaseUnit, ResolverManualmentePendenciaSefazUseCaseUnit,
  ObterQuantidadePendenciasSefazUseCaseUnit, ObterRetencoesNFSeDaOSUseCaseUnit, IInicializarDpsServiceUnit;

type
  IListarTodasEmpresasUseCase = ListarEmpresasUseCase;
  IListarEmpresasPermitidasUseCase = ListarEmpresasUseCase;
  IObterGrupoFiscalPorIdUseCase = ObterGrupoFiscalPorIdUseCase;
  ISalvarGrupoFiscalUseCase = SalvarGrupoFiscalUseCase;
  IRemoverGrupoFiscalUseCase = RemoverGrupoFiscalUseCase;
  IObterOperacaoInternaPorIdUseCase = ObterOperacaoInternaPorIdUseCase;
  ISalvarOperacaoInternaUseCase = SalvarOperacaoInternaUseCase;
  IRemoverOperacaoInternaUseCase = RemoverOperacaoInternaUseCase;
  IListarAtualeTodasOperacoesInternasUseCase = ListarOperacoesInternasUseCase;
  IObterRegraFiscalIbsCbsPorIdUseCase = ObterRegraFiscalIbsCbsPorIdUseCase;
  ISalvarRegraFiscalIbsCbsUseCase = SalvarRegraFiscalIbsCbsUseCase;
  IRemoverRegraFiscalIbsCbsUseCase = RemoverRegraFiscalIbsCbsUseCase;
  IListarAtualeTodosRegrasFiscaisUseCase = ListarRegrasFiscaisUseCase;
  IObterOperacaoFiscalIbsCbsPorIdUseCase = ObterOperacaoFiscalIbsCbsPorIdUseCase;
  ISalvarOperacaoFiscalIbsCbsUseCase = SalvarOperacaoFiscalIbsCbsUseCase;
  IRemoverOperacaoFiscalIbsCbsUseCase = RemoverOperacaoFiscalIbsCbsUseCase;
  IListarOpInternasComTpVendasPorTpVendaUseCase = ListarOpInternasComTpVendasUseCase;
  IListarOpInternasComTpVendasPorOpInternaUseCase = ListarOpInternasComTpVendasUseCase;
  IListarOpInternasComTpVendasPorVendaUseCase = ListarOpInternasComTpVendasUseCase;
  IVincularOpInternasATipoVendaUseCase = VincularOpInternasATipoVendaUseCase;
  IVincularTiposVendasAOpInternaUseCase = VincularTiposVendasAOpInternaUseCase;
  IListarTiposVendasPermitidasUseCase = ListarTiposVendasUseCase;
  IObterTipoVendaPorIdUseCase = ObterTiposVendasUseCase;
  IListarTributosNFePorIdUseCase = ListarTributosNFe;
  IListarTributosNFePorItemUseCase = ListarTributosNFe;
  IListarTodosMunicipiosUseCase = ListarMunicipiosUseCase;

  /// <summary>
  ///   Factory de UseCases, de uso exclusivo do módulo legado do ERP, Delphi 2006
  /// </summary>
  ErpFeaturesFactory = class(ErpFeaturesFactoryBase)
  private
    FDatabaseConnection: IDatabaseConnection;
    FSharedFactory: ISharedFactory;
    //FSession: ISessionContext;
  private
    function CreateObterConfiguracaoNFSeService(): IConfiguracaoNFSeService;
    function CreateResolverRegraFiscalIbsCbsService(): IResolverRegraFiscalIbsCbsService;
    function CreateCalcularTributosNFSeService(): ICalcularTributosNFSeService;
    function CreatePrepararNFSeParaEmissaoService(): IPrepararNFSeParaEmissaoService;
    function CreateEmitirNFSeService(): IEmitirNFSeService;
    function CreateAtualizarSituacaoNFSeService(): IAtualizarSituacaoNFSeService;
    function CreateParametrosFiscaisNFSeService(): IParametrosFiscaisNFSeService;
    function CreateInicializarDpsService(): IInicializarDpsService;
  public
    constructor Create(const DatabaseConnection: IDatabaseConnection; SharedFactory: ISharedFactory; Session: ISessionContext);

    //Empresas
    function CreateListarTodasEmpresasUseCase(): IListarTodasEmpresasUseCase;
    function CreateListarEmpresasPermitidasUseCase(): IListarEmpresasPermitidasUseCase;

    //Grupos fiscais
    function CreateObterGruposFiscaisUseCase(): IObterGrupoFiscalPorIdUseCase;
    function CreateSalvarGruposFiscaisUseCase(): ISalvarGrupoFiscalUseCase;
    function CreateRemoverGruposFiscaisUseCase(): IRemoverGrupoFiscalUseCase;
    function CreateListarAtualeTodosGruposFiscaisUseCase(): IListarAtualeTodosGruposFiscaisUseCase;
    function CreateListarGruposFiscaisComAnexoVinculadoUseCase(): IListarGruposFiscaisComAnexoVinculadoUseCase;
    function CreateCriarGruposFiscaisDeAnexosUseCase(): ICriarGruposFiscaisDeAnexosUseCase;

    //Operacoes Internas
    function CreateObterOperacaoInternaPorIdUseCase(): IObterOperacaoInternaPorIdUseCase;
    function CreateSalvarOperacaoInternaUseCase(): ISalvarOperacaoInternaUseCase;
    function CreateRemoverOperacaoInternaUseCase(): IRemoverOperacaoInternaUseCase;
    function CreateListarAtualeTodasOperacoesInternasUseCase: IListarAtualeTodasOperacoesInternasUseCase;

    //Regras Fiscais
    function CreateObterRegraFiscalIbsCbsPorIdUseCase(): IObterRegraFiscalIbsCbsPorIdUseCase;
    function CreateSalvarRegraFiscalIbsCbsUseCase(): ISalvarRegraFiscalIbsCbsUseCase;
    function CreateRemoverRegraFiscalIbsCbsUseCase(): IRemoverRegraFiscalIbsCbsUseCase;
    function CreateListarAtualeTodosRegrasFiscaisUseCase(): IListarAtualeTodosRegrasFiscaisUseCase;
    function CreateResolverRegraFiscalIbsCbsUseCase(): IResolverRegraFiscalIbsCbsUseCase;

    //Operacoes Fiscais
    function CreateObterOperacaoFiscalIbsCbsPorIdUseCase(): IObterOperacaoFiscalIbsCbsPorIdUseCase;
    function CreateSalvarOperacaoFiscalIbsCbsUseCase(): ISalvarOperacaoFiscalIbsCbsUseCase;
    function CreateRemoverOperacaoFiscalIbsCbsUseCase(): IRemoverOperacaoFiscalIbsCbsUseCase;

    //Operacoes Internas Com Tipos Vendas
    function CreateListarOpInternasComTpVendasPorTpVendaUSeCase(): IListarOpInternasComTpVendasPorTpVendaUseCase;
    function CreateListarOpInternasComTpVendasPorOpInternaUseCase(): IListarOpInternasComTpVendasPorOpInternaUseCase;
    function CreateListarOpInternasComTpVendasPorVendaUseCase(): IListarOpInternasComTpVendasPorVendaUseCase;
    function CreateVincularOpInternasATipoVendaUseCase(): IVincularOpInternasATipoVendaUseCase;
    function CreateVincularTiposVendasAOpInternaUseCase(): IVincularTiposVendasAOpInternaUseCase;

    // TiposVendas
    function CreateListarTiposVendasPermitidasUseCase(): IListarTiposVendasPermitidasUseCase;
    function CreateObterTipoVendaPorIdUseCase(): IObterTipoVendaPorIdUseCase;

    //Tributos DFe
    function CreateListarTributosNFePorIdUseCase(): IListarTributosNFePorIdUseCase;
    function CreateListarTributosNFePorItemUseCase(): IListarTributosNFePorItemUseCase;
    function CreateSalvarTributoDFeUseCase(): ISalvarTributoDFeUseCase;
    function CreateRemoverTributoDFeUseCase(): IRemoverTributoDFeUseCase;

    //Municipios IBGE
    function CreateListarTodosMunicipiosUseCase(): IListarTodosMunicipiosUseCase;

    //Central de Dados Fiscais
    function CreateObterVersaoDadosFiscaisUseCase(): IObterVersaoDadosFiscaisUseCase;
    function CreateObterResumoDadosFiscaisUseCase(): IObterResumoDadosFiscaisUseCase;

    // Anexos
    function CreateListarAnexosUseCase(): IListarAnexosUseCase;
    function CreateListarAnexosCompativeisUseCase(): IListarAnexosCompativeisUseCase;

    // Produtos
    function CreateAtualizarGruposFiscaisNoProdutoEmLoteUseCase(const Observer: IProgressObserver): IAtualizarGruposFiscaisNoProdutoEmLoteUseCase;
    function CreateAtualizarGruposFiscaisNoProdutoPorNcmEmLoteUseCase(const Observer: IProgressObserver): IAtualizarGruposFiscaisNoProdutoPorNcmEmLoteUseCase;

    //Tipo Servico
    function CreateObterTipoServicoPorIdUseCase(): IObterTipoServicoPorIdUseCase;
    function CreateAtualizarFiscalNFSeUseCase(): IAtualizarFiscalNFSeUseCase;

    // NCMs
    function CreateObterNcmMaisRecenteUseCase(): IObterNcmMaisRecenteUseCase;

    //NFSe / DPS
    function CreateExcluirRascunhoNFSeUseCase(): IExcluirRascunhoNFSeUseCase;
		function CreateIniciarDpsVazioUseCase(): IIniciarDpsVazioUseCase;
		function CreateIniciarSubstuicaoNFSeUseCase(): IIniciarSubstuicaoNFSeUseCase;
		function CreateCalcularTributosNFSeUseCase(): ICalcularTributosNFSeUseCase;
    function CreateCalcularTotaisNFSeUseCase(): ICalcularTotaisNFSeUseCase;
    function CreateSalvarNFSeUseCase(): ISalvarNFSeUseCase;
    function CreateObterNFSeUseCase(): IObterNFSeUseCase;
    function CreateEmitirNFSeUseCase(): IEmitirNFSeUseCase;
    function CreateConsultarEmissaoNFSeUseCase(): IConsultarEmissaoNFSeUseCase;
    function CreateEmitirLoteNFSeUseCase(): IEmitirLoteNFSeUseCase;
    function CreateCancelarNFSeUseCase(): ICancelarNFSeUseCase;
    function CreateReverterCancelamentoPortalNFSeUseCase(): IReverterCancelamentoPortalNFSeUseCase;
    function CreateReverterAutorizacaoPortalNFSeUseCase(): IReverterAutorizacaoPortalNFSeUseCase;
    function CreateObterNFSeResumoUseCase(): IObterNFSeResumoUseCase;
    function CreateConcluirDoPortalNFSeUseCase(): IConcluirDoPortalNFSeUseCase;
    function CreateCriarEmitirNFSeAgrupadasUseCase(): ICriarEmitirNFSeAgrupadasUseCase;
    function CreateRemoverNFSeOSUseCase(): IRemoverNFSeOSUseCase;
    function CreateNFSExecutorCoordinator(): INFSExecutorCoordinator;
    function CreateCriarAnexosEmailPorOSUseCase(): ICriarAnexosEmailPorOSUseCase;
    function CreateCriarAnexosEmailPorNFSeIdUseCase(): ICriarAnexosEmailPorNFSeIDsUseCase;
    function CreateChecarPossivelRetencaoNFSeUseCase(): IChecarPossivelRetencaoNFSeUseCase;
    function CreateAlternarNaturezaEmissaoPropiaNFSeUseCase(): IAlternarNaturezaEmissaoPropiaNFSeUseCase;
    //NFSe / Eventos
    function CreateObterNFSeEventoUseCase(): IObterNFSeEventoUseCase;
    function CreateObterNFSeEventoResumoUseCase(): IObterNFSeEventoResumoUseCase;
    function CreateExcluirCancelamentoNFSeUseCase(): IExcluirCancelamentoNFSeUseCase;
    //NFSe / OS
    function CreateObterNFSeOSsUseCase(): IObterNFSeOSsUseCase;
    function CreateObterRetencoesNFSeDaOSUseCase(): IObterRetencoesNFSeDaOSUseCase;

		//Clientes
		function CreateObterClientePorIdUseCase(): IObterClientePorIdUseCase;

    // Configurações
    function CreateObterConfiguracaoNFSeUseCase(): IObterConfiguracaoNFSeUseCase;
    function CreateSalvarConfiguracaoNFSeUseCase(): ISalvarConfiguracaoNFSeUseCase;

    // PedVenda
    function CreateObterSituacaoEmissaoNFSeDeOrdemServUseCase(): IObterSituacaoEmissaoNFSeDeOrdemServUseCase;

    // Regras de Redução Beneficios Fiscais do PIS COFINS
    function CreateSalvarRegraRedBenefPcUseCase(): ISalvarRegraRedBenefPcUseCase;
    function CreateObterRegraRedBenefPcPorIdUseCase(): IObterRegraRedBenefPcPorIdUseCase;
    function CreateRemoverRegraRedBenefPcUseCase(): IRemoverRegraRedBenefPcUseCase;
    function CreateOperacaoPassivelDeRedBenefPcUseCase(): IOperacaoPassivelDeRedBenefPcUseCase;
    function CreateListarRegrasRedBenefPcVigentesEAtualUseCase(): IListarRegrasRedBenefPcVigentesEAtualUseCase;

    // Ajustes de Redução Beneficios Fiscais do PIS COFINS
    function CreateRegistrarAjusteRedBenefPcUseCase(): IRegistrarAjusteRedBenefPcUseCase;
    function CreateSalvarAjusteRedBenefPcUseCase(): ISalvarAjusteRedBenefPcUseCase;
    function CreateObterAjusteRedBenefPcPorIdUseCase(): IObterAjusteRedBenefPcPorIdUseCase;
    function CreateRemoverAjusteRedBenefPcUseCase(): IRemoverAjusteRedBenefPcUseCase;

    // FiscalDFe, Inf Complementar
    function CreateListarInfComplPorTipoPcUseCase(): IListarInfComplPorTipoPcUseCase;

    // Alertas DFe
    function CreateListarDFeAlertasUseCase(): IListarDFeAlertasUseCase;

    // Nota Fiscal
    function CreateObterQuantidadePendenciasSefazUseCase(): IObterQuantidadePendenciasSefazUseCase;
    function CreateResolverManualmentePendenciaSefazUseCase(): IResolverManualmentePendenciaSefazUseCase;
	end;

implementation

uses
	SharedRepoContainerUnit,
	ErpFeaturesRepoContainerUnit,
	FiscalRepoContainerUnit,
	SalvarTributoDFeUseCaseUnit,
	RemoverTributoDFeUseCaseUnit,
	ICalcularISSQNServiceUnit,
	ICalcularPisCofinsServiceUnit,
	ICalcularRetenFederalServiceUnit,
	CalcularISSQNServiceUnit,
	CalcularPisCofinsServiceUnit,
	CalcularRetenFederalServiceUnit,
  ConfiguracaoNFSeServiceUnit,
  ICalculoTotaisNFSeServiceUnit,
  CalculoTotaisNFSeServiceUnit, ResolverRegraFiscalIbsCbsServiceUnit,
  IFinalizarNFSeServiceUnit, FinalizarNFSeServiceUnit, ICalcularTributosAproximadosServiceUnit,
  CalcularTributosAproximadosServiceUnit, InicializarDpsServiceUnit,
  CalcularTributosNFSeServiceUnit, INFSeAgrupamentoServiceUnit,
  NFSeAgrupamentoServiceUnit, EmitirNFSeServiceUnit, INFSeCalculoAplicadorServiceUnit, NFSeCalculoAplicadorServiceUnit,
  AtualizarSituacaoNFSeServiceUnit, NFSExecutorLegadoUnit, NFSExecutorNovoUnit, INFSExecutorUnit,
  CriarAnexosEmailUseCaseUnit, PrepararNFSeParaEmissaoServiceUnit, ParametrosFiscaisNFSeServiceUnit,
  IAplicarRegrasTributosNFSeServiceUnit, AplicarRegrasTributosNFSeServiceUnit, IRatearRetencoesNFSeOSServiceUnit,
  RatearRetencoesNFSeOSServiceUnit, OperacaoPassivelDeRedBenefPcUseCaseUnit, IConsolidadorContextoFiscalPcServiceUnit,
  ICalcularAjusteRedBenefPcServiceUnit, ConsolidadorContextoFiscalPcServiceUnit, CalcularAjusteRedBenefPcServiceUnit,
  AplicadorRedBenefPcServiceUnit, IAplicadorRedBenefPcServiceUnit, RegistrarAjusteRedBenefPcUseCaseUnit,
  ITokenDecryptorUnit, DFeDLLAdapterUnit, ITokenEncryptorUnit;

{ ErpFeaturesFactory }

constructor ErpFeaturesFactory.Create(
  const DatabaseConnection: IDatabaseConnection; SharedFactory: ISharedFactory; Session: ISessionContext
);
begin
  FDatabaseConnection := DatabaseConnection;
  FSharedFactory := SharedFactory;
  FSession := Session;

  ErpFeaturesRepoContainer.GetInstance().Setup( FDatabaseConnection, FSession );
end;

function ErpFeaturesFactory.CreateListarAtualeTodosGruposFiscaisUseCase: IListarAtualeTodosGruposFiscaisUseCase;
begin
  Result := IListarAtualeTodosGruposFiscaisUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().GruposFiscaisRepo
  );
end;

function ErpFeaturesFactory.CreateListarAtualeTodosRegrasFiscaisUseCase: IListarAtualeTodosRegrasFiscaisUseCase;
begin
  Result := ListarRegrasFiscaisUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().RegrasFiscaisIbsCbsRepo
  );
end;

function ErpFeaturesFactory.CreateListarDFeAlertasUseCase: IListarDFeAlertasUseCase;
begin
  Result := ListarDFeAlertasUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().DFeAlertasRepo
  );
end;

function ErpFeaturesFactory.CreateListarGruposFiscaisComAnexoVinculadoUseCase: IListarGruposFiscaisComAnexoVinculadoUseCase;
begin
  Result := IListarGruposFiscaisComAnexoVinculadoUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().GruposFiscaisRepo
  );
end;

function ErpFeaturesFactory.CreateListarInfComplPorTipoPcUseCase: IListarInfComplPorTipoPcUseCase;
begin
  Result := ListarInfComplPorTipoPcUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().InfComplementarDFeRepo
  );
end;

function ErpFeaturesFactory.CreateAlternarNaturezaEmissaoPropiaNFSeUseCase: IAlternarNaturezaEmissaoPropiaNFSeUseCase;
begin
   Result := AlternarNaturezaEmissaoPropiaNFSeUseCase.Create(
    FSession,
    FDatabaseConnection,
    ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo
  );
end;

function ErpFeaturesFactory.CreateAtualizarFiscalNFSeUseCase: IAtualizarFiscalNFSeUseCase;
begin
  Result := AtualizarFiscalNFSeUseCase.Create(
    FDatabaseConnection,
    ErpFeaturesRepoContainer.GetInstance().TiposServicosRepo
  );
end;

function ErpFeaturesFactory.CreateAtualizarGruposFiscaisNoProdutoEmLoteUseCase(
  const Observer: IProgressObserver
): IAtualizarGruposFiscaisNoProdutoEmLoteUseCase;
begin
  Result := IAtualizarGruposFiscaisNoProdutoEmLoteUseCase.Create(
    FDatabaseConnection,
    ErpFeaturesRepoContainer.GetInstance().ProdutosRepo,
    Observer
  );
end;

function ErpFeaturesFactory.CreateAtualizarGruposFiscaisNoProdutoPorNcmEmLoteUseCase(
  const Observer: IProgressObserver): IAtualizarGruposFiscaisNoProdutoPorNcmEmLoteUseCase;
begin
  Result := IAtualizarGruposFiscaisNoProdutoPorNcmEmLoteUseCase.Create(
    FDatabaseConnection,
    ErpFeaturesRepoContainer.GetInstance().ProdutosRepo,
    Observer
  );
end;

function ErpFeaturesFactory.CreateAtualizarSituacaoNFSeService: IAtualizarSituacaoNFSeService;
var
  RateionRetencoesServ: IRatearRetencoesNFSeOSService;
begin
  RateionRetencoesServ := RatearRetencoesNFSeOSService.Create();

  Result := AtualizarSituacaoNFSeService.Create(
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo,
    ErpFeaturesRepoContainer.GetInstance().PedVendaRepo,
    ErpFeaturesRepoContainer.GetInstance().FormasPagamentoRepo,
    ErpFeaturesRepoContainer.GetInstance().ControleCreditosRepo,
    RateionRetencoesServ
  );
end;

function ErpFeaturesFactory.CreateResolverManualmentePendenciaSefazUseCase: IResolverManualmentePendenciaSefazUseCase;
begin
  Result := ResolverManualmentePendenciaSefazUseCase.Create(
    FDatabaseConnection,
		ErpFeaturesRepoContainer.GetInstance().NotasFiscaisRepo,
		ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo
  );
end;

function ErpFeaturesFactory.CreateCalcularTotaisNFSeUseCase: ICalcularTotaisNFSeUseCase;
var
  CalculoTotais: ICalculoTotaisNFSeService;
begin
  CalculoTotais := CalculoTotaisNFSeService.Create();

  Result := CalcularTotaisNFSeUseCase.Create( CalculoTotais );
end;

function ErpFeaturesFactory.CreateCalcularTributosNFSeService: ICalcularTributosNFSeService;
var
	CalcularISSQN: ICalcularISSQNService;
	CalcularPISCOFINS: ICalcularPisCofinsService;
	CalcularRetenFederal: ICalcularRetenFederalService;
  CalcularTriAproximados: ICalcularTributosAproximadosService;
  CalculoTotais: ICalculoTotaisNFSeService;
  AplicarRegrasTributos: IAplicarRegrasTributosNFSeService;
begin
  CalculoTotais := CalculoTotaisNFSeService.Create();
	CalcularISSQN := CalcularISSQNService.Create();
	CalcularPISCOFINS := CalcularPisCofinsService.Create();
	CalcularRetenFederal := CalcularRetenFederalService.Create();
  CalcularTriAproximados := CalcularTributosAproximadosService.Create(
    SharedRepoContainer.GetInstance().ItensIbptRepo
  );
  AplicarRegrasTributos := AplicarRegrasTributosNFSeService.Create();

  Result := CalcularTributosNFSeService.Create(
		ErpFeaturesRepoContainer.GetInstance().TiposServicosRepo,
		ErpFeaturesRepoContainer.GetInstance().ClientesRepo,
		ErpFeaturesRepoContainer.GetInstance().ConfiguracoesRepo,
		ErpFeaturesRepoContainer.GetInstance().RegrasFiscaisIbsCbsRepo,
    CreateParametrosFiscaisNFSeService(),
    AplicarRegrasTributos,
    CalculoTotais,
		CalcularISSQN,
		CalcularPISCOFINS,
		CalcularRetenFederal,
    FSharedFactory.CreateCalculadorROCService(),
    FSharedFactory.CreateCalculadorBaseCalculoService(),
    CalcularTriAproximados,
    CreateResolverRegraFiscalIbsCbsService()
	);
end;

function ErpFeaturesFactory.CreateCalcularTributosNFSeUseCase: ICalcularTributosNFSeUseCase;
var
	CalcularISSQN: ICalcularISSQNService;
	CalcularPISCOFINS: ICalcularPisCofinsService;
	CalcularRetenFederal: ICalcularRetenFederalService;
  CalcularTriAproximados: ICalcularTributosAproximadosService;
  CalculoTotais: ICalculoTotaisNFSeService;
  CalcularTributosNFSe: ICalcularTributosNFSeService;
  CalculoAplicador: INFSeCalculoAplicadorService;
  AplicarRegrasTributos: IAplicarRegrasTributosNFSeService;
begin
  CalculoTotais := CalculoTotaisNFSeService.Create();
	CalcularISSQN := CalcularISSQNService.Create();
	CalcularPISCOFINS := CalcularPisCofinsService.Create();
	CalcularRetenFederal := CalcularRetenFederalService.Create();
  CalcularTriAproximados := CalcularTributosAproximadosService.Create(
    SharedRepoContainer.GetInstance().ItensIbptRepo
  );
  AplicarRegrasTributos := AplicarRegrasTributosNFSeService.Create();

	CalcularTributosNFSe := CalcularTributosNFSeService.Create(
		ErpFeaturesRepoContainer.GetInstance().TiposServicosRepo,
		ErpFeaturesRepoContainer.GetInstance().ClientesRepo,
		ErpFeaturesRepoContainer.GetInstance().ConfiguracoesRepo,
		ErpFeaturesRepoContainer.GetInstance().RegrasFiscaisIbsCbsRepo,
    CreateParametrosFiscaisNFSeService(),
    AplicarRegrasTributos,
    CalculoTotais,
		CalcularISSQN,
		CalcularPISCOFINS,
		CalcularRetenFederal,
    FSharedFactory.CreateCalculadorROCService(),
    FSharedFactory.CreateCalculadorBaseCalculoService(),
    CalcularTriAproximados,
    CreateResolverRegraFiscalIbsCbsService()
	);

  CalculoAplicador := NFSeCalculoAplicadorService.Create();

  Result := CalcularTributosNFSeUseCase.Create( CalcularTributosNFSe, CalculoAplicador );
end;

function ErpFeaturesFactory.CreateCancelarNFSeUseCase: ICancelarNFSeUseCase;
begin
	Result := CancelarNFSeUseCase.Create(
    FDatabaseConnection,
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo,
    CreateAtualizarSituacaoNFSeService()
  );
end;

function ErpFeaturesFactory.CreateChecarPossivelRetencaoNFSeUseCase: IChecarPossivelRetencaoNFSeUseCase;
var
  Agrupamento: INFSeAgrupamentoService;
  AplicarRegrasTributos: IAplicarRegrasTributosNFSeService;
  CalcularISSQN: ICalcularISSQNService;
  CalcularRetenFederal: ICalcularRetenFederalService;
begin
  Agrupamento := NFSeAgrupamentoService.Create();
	CalcularISSQN := CalcularISSQNService.Create();
	CalcularRetenFederal := CalcularRetenFederalService.Create();
  AplicarRegrasTributos := AplicarRegrasTributosNFSeService.Create();

  Result := ChecarPossivelRetencaoNFSeUseCase.Create(
    FSession,
    ErpFeaturesRepoContainer.GetInstance().PedVendaRepo,
    CreateObterConfiguracaoNFSeService(),
    CreateParametrosFiscaisNFSeService(),
    Agrupamento,
    CalcularISSQN,
    CalcularRetenFederal,
    AplicarRegrasTributos
  );
end;

function ErpFeaturesFactory.CreateConcluirDoPortalNFSeUseCase: IConcluirDoPortalNFSeUseCase;
begin
  Result := ConcluirDoPortalNFSeUseCase.Create(
    FDatabaseConnection,
    FSession,
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo,
		ErpFeaturesRepoContainer.GetInstance().ClientesRepo,
    CreateAtualizarSituacaoNFSeService()
  );
end;

function ErpFeaturesFactory.CreateConsultarEmissaoNFSeUseCase: IConsultarEmissaoNFSeUseCase;
begin
	Result := ConsultarEmissaoNFSeUseCase.Create(
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo,
    CreateEmitirNFSeService()
  );
end;

function ErpFeaturesFactory.CreateCriarGruposFiscaisDeAnexosUseCase: ICriarGruposFiscaisDeAnexosUseCase;
begin
  Result := CriarGruposFiscaisDeAnexosUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().GruposFiscaisRepo,
    SharedRepoContainer.GetInstance().AnexosRepo,
    ErpFeaturesRepoContainer.GetInstance().EmpresasRepo
  );
end;

function ErpFeaturesFactory.CreateCriarAnexosEmailPorNFSeIdUseCase: ICriarAnexosEmailPorNFSeIDsUseCase;
begin
  Result := CriarAnexosEmailUseCase.Create( FSession, ErpFeaturesRepoContainer.GetInstance().NFSeRepo );
end;

function ErpFeaturesFactory.CreateCriarAnexosEmailPorOSUseCase: ICriarAnexosEmailPorOSUseCase;
begin
  Result := CriarAnexosEmailUseCase.Create( FSession, ErpFeaturesRepoContainer.GetInstance().NFSeRepo );
end;

function ErpFeaturesFactory.CreateCriarEmitirNFSeAgrupadasUseCase: ICriarEmitirNFSeAgrupadasUseCase;
var
  Agrupamento: INFSeAgrupamentoService;
  ConfigNFSe: IConfiguracaoNFSeService;
  CalcularTributosNFSe: ICalcularTributosNFSeService;
  CalculoAplicador: INFSeCalculoAplicadorService;
begin
  Agrupamento := NFSeAgrupamentoService.Create();

  ConfigNFSe := CreateObterConfiguracaoNFSeService();

  CalcularTributosNFSe := CreateCalcularTributosNFSeService();

  CalculoAplicador := NFSeCalculoAplicadorService.Create();

  Result := CriarEmitirNFSeAgrupadasUseCase.Create(
    FDatabaseConnection,
    FSession,
    ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo,
    ErpFeaturesRepoContainer.GetInstance().PedVendaRepo,
    Agrupamento,
    ConfigNFSe,
    CreateInicializarDpsService(),
    CalcularTributosNFSe,
    CalculoAplicador,
    CreatePrepararNFSeParaEmissaoService(),
    CreateEmitirNFSeService()
  );
end;

function ErpFeaturesFactory.CreateEmitirLoteNFSeUseCase: IEmitirLoteNFSeUseCase;
begin
	Result := EmitirNFSeUseCase.Create(
    FDatabaseConnection,
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo,
    CreateObterConfiguracaoNFSeService(),
    CreatePrepararNFSeParaEmissaoService(),
    CreateEmitirNFSeService()
  );
end;

function ErpFeaturesFactory.CreateEmitirNFSeService: IEmitirNFSeService;
begin
	Result := EmitirNFSeService.Create(
//    FDatabaseConnection,
    FSession,
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo//,
//    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo,
//		ErpFeaturesRepoContainer.GetInstance().ClientesRepo,
//    CreateObterConfiguracaoNFSeService()
  );
end;

function ErpFeaturesFactory.CreateEmitirNFSeUseCase: IEmitirNFSeUseCase;
begin
	Result := EmitirNFSeUseCase.Create(
    FDatabaseConnection,
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo,
    CreateObterConfiguracaoNFSeService(),
    CreatePrepararNFSeParaEmissaoService(),
    CreateEmitirNFSeService()
  );
end;

function ErpFeaturesFactory.CreateNFSExecutorCoordinator: INFSExecutorCoordinator;
var
  ExecutorLegado: INFSExecutor;
  ExecutorNovo: INFSExecutor;
  EmitirUseCase: ICriarEmitirNFSeAgrupadasUseCase;
  CriadorAnexosUseCase: ICriarAnexosEmailPorOSUseCase;
begin
  EmitirUseCase := CreateCriarEmitirNFSeAgrupadasUseCase();
  CriadorAnexosUseCase := CreateCriarAnexosEmailPorOSUseCase();

  ExecutorLegado := NFSExecutorLegado.Create(FSession);
  ExecutorNovo := NFSExecutorNovo.Create(
    FSession,
    ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
    EmitirUseCase,
    CriadorAnexosUseCase
  );

  Result := NFSExecutorCoordinator.Create(
    ErpFeaturesRepoContainer.GetInstance().ConfiguracoesRepo,
    ErpFeaturesRepoContainer.GetInstance().PedVendaRepo,
    ExecutorLegado,
    ExecutorNovo
  );
end;

function ErpFeaturesFactory.CreateExcluirCancelamentoNFSeUseCase: IExcluirCancelamentoNFSeUseCase;
begin
  Result := ExcluirCancelamentoNFSeUseCase.Create(
    FDatabaseConnection,
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo
  );
end;

function ErpFeaturesFactory.CreateExcluirRascunhoNFSeUseCase: IExcluirRascunhoNFSeUseCase;
begin
	Result := ExcluirRascunhoNFSeUseCase.Create(
    FDatabaseConnection,
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
    CreateAtualizarSituacaoNFSeService()
  );
end;

function ErpFeaturesFactory.CreateInicializarDpsService: IInicializarDpsService;
begin
  Result := InicializarDpsService.Create(
    ErpFeaturesRepoContainer.GetInstance().ClientesRepo,
		ErpFeaturesRepoContainer.GetInstance().TiposServicosRepo,
    CreateResolverRegraFiscalIbsCbsService(),
    CreateObterConfiguracaoNFSeService()
  );
end;

function ErpFeaturesFactory.CreateIniciarDpsVazioUseCase: IIniciarDpsVazioUseCase;
begin
	Result := IniciarDpsVazioUseCase.Create(
    FSession,
    CreateInicializarDpsService()
  );
end;

function ErpFeaturesFactory.CreateIniciarSubstuicaoNFSeUseCase: IIniciarSubstuicaoNFSeUseCase;
begin
	Result := IniciarSubstuicaoNFSeUseCase.Create(
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
		ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo,
    CreateObterConfiguracaoNFSeService()
  );
end;

function ErpFeaturesFactory.CreateListarAnexosCompativeisUseCase: IListarAnexosCompativeisUseCase;
begin
  Result := ListarAnexosUseCase.Create(
    SharedRepoContainer.GetInstance().AnexosRepo
  );
end;

function ErpFeaturesFactory.CreateListarAnexosUseCase: IListarAnexosUseCase;
begin
  Result := ListarAnexosUseCase.Create(
    SharedRepoContainer.GetInstance().AnexosRepo
  );
end;

function ErpFeaturesFactory.CreateListarAtualeTodasOperacoesInternasUseCase: IListarAtualeTodasOperacoesInternasUseCase;
begin
  Result := ListarOperacoesInternasUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().OperacoesInternasRepo
  );
end;

function ErpFeaturesFactory.CreateListarRegrasRedBenefPcVigentesEAtualUseCase: IListarRegrasRedBenefPcVigentesEAtualUseCase;
begin
  Result := ListarRegrasRedBenefPcUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().RegrasRedBenefPcRepo
  );
end;

function ErpFeaturesFactory.CreateListarEmpresasPermitidasUseCase: IListarEmpresasPermitidasUseCase;
begin
  Result := ListarEmpresasUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().EmpresasRepo
  );
end;

function ErpFeaturesFactory.CreateListarOpInternasComTpVendasPorOpInternaUseCase: IListarOpInternasComTpVendasPorOpInternaUseCase;
begin
  Result := ListarOpInternasComTpVendasUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().OpInternasComTpVendasRepo
  );
end;

function ErpFeaturesFactory.CreateListarOpInternasComTpVendasPorTpVendaUSeCase: IListarOpInternasComTpVendasPorTpVendaUseCase;
begin
  Result := ListarOpInternasComTpVendasUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().OpInternasComTpVendasRepo
  );
end;

function ErpFeaturesFactory.CreateListarOpInternasComTpVendasPorVendaUseCase: IListarOpInternasComTpVendasPorVendaUseCase;
begin
  Result := ListarOpInternasComTpVendasUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().OpInternasComTpVendasRepo
  );
end;

function ErpFeaturesFactory.CreateListarTiposVendasPermitidasUseCase: IListarTiposVendasPermitidasUseCase;
begin
  Result := ListarTiposVendasUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().TiposVendasRepo
  );
end;

function ErpFeaturesFactory.CreateListarTodasEmpresasUseCase: IListarTodasEmpresasUseCase;
begin
  Result := ListarEmpresasUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().EmpresasRepo
  );
end;

function ErpFeaturesFactory.CreateListarTodosMunicipiosUseCase: IListarTodosMunicipiosUseCase;
begin
  Result := ListarMunicipiosUseCase.Create(
    SharedRepoContainer.GetInstance().MunicipiosRepo
  );
end;

function ErpFeaturesFactory.CreateListarTributosNFePorIdUseCase(): IListarTributosNFePorIdUseCase;
begin
  Result := ListarTributosNFe.Create(
    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo
  );          
end;

function ErpFeaturesFactory.CreateListarTributosNFePorItemUseCase: IListarTributosNFePorItemUseCase;
begin
  Result := ListarTributosNFe.Create(
    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo
  );
end;

function ErpFeaturesFactory.CreateObterVersaoDadosFiscaisUseCase: IObterVersaoDadosFiscaisUseCase;
begin
  Result := ObterVersaoDadosFiscaisUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().ConfiguracoesRepo
  );
end;

function ErpFeaturesFactory.CreateParametrosFiscaisNFSeService: IParametrosFiscaisNFSeService;
begin
  Result := ParametrosFiscaisNFSeService.Create(
    ErpFeaturesRepoContainer.GetInstance().TiposServicosRepo,
    ErpFeaturesRepoContainer.GetInstance().ClientesRepo,
    ErpFeaturesRepoContainer.GetInstance().ConfiguracoesRepo
  );
end;

function ErpFeaturesFactory.CreatePrepararNFSeParaEmissaoService: IPrepararNFSeParaEmissaoService;
begin
	Result := PrepararNFSeParaEmissaoService.Create(
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
		ErpFeaturesRepoContainer.GetInstance().PedVendaRepo
  );
end;

function ErpFeaturesFactory.CreateObterResumoDadosFiscaisUseCase: IObterResumoDadosFiscaisUseCase;
begin
  Result := ObterResumoDadosFiscaisUseCase.Create(
    SharedRepoContainer.GetInstance().AnexosRepo,
    ErpFeaturesRepoContainer.GetInstance().GruposFiscaisRepo,
    //SharedRepoContainer.GetInstance().NcmsRepo,
    ErpFeaturesRepoContainer.GetInstance().ProdutosRepo
  );
end;

function ErpFeaturesFactory.CreateObterRetencoesNFSeDaOSUseCase: IObterRetencoesNFSeDaOSUseCase;
begin
  Result := ObterRetencoesNFSeDaOSUseCase.Create(ErpFeaturesRepoContainer.GetInstance().NFSeRepo);
end;

function ErpFeaturesFactory.CreateObterSituacaoEmissaoNFSeDeOrdemServUseCase: IObterSituacaoEmissaoNFSeDeOrdemServUseCase;
begin
  Result := ObterSituacaoEmissaoNFSeDeOrdemServUseCase.Create( ErpFeaturesRepoContainer.GetInstance().PedVendaRepo );
end;

function ErpFeaturesFactory.CreateObterAjusteRedBenefPcPorIdUseCase: IObterAjusteRedBenefPcPorIdUseCase;
begin
  Result := ObterAjusteRedBenefPcPorIdUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().AjustesRedBenefPcRepo
  );
end;

function ErpFeaturesFactory.CreateObterClientePorIdUseCase: IObterClientePorIdUseCase;
begin
  Result := ObterClienteUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().ClientesRepo
  );
end;

function ErpFeaturesFactory.CreateObterConfiguracaoNFSeService: IConfiguracaoNFSeService;
var
  Decryptor: ITokenDecryptor;
begin
  Decryptor := TDFeDLLCypher.Create(CreateSecretPorEmpresaNFSe());
  Result := ConfiguracaoNFSeService.Create(
    ErpFeaturesRepoContainer.GetInstance().ConfiguracoesRepo,
    Decryptor
  );
end;

function ErpFeaturesFactory.CreateObterConfiguracaoNFSeUseCase: IObterConfiguracaoNFSeUseCase;
begin
  Result := ObterConfiguracaoNFSeUseCase.Create(
    CreateObterConfiguracaoNFSeService()
  );
end;

function ErpFeaturesFactory.CreateObterNFSeEventoResumoUseCase: IObterNFSeEventoResumoUseCase;
begin
  Result := ObterNFSeEventoResumoUseCase.Create(
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo
  );
end;

function ErpFeaturesFactory.CreateObterNFSeEventoUseCase: IObterNFSeEventoUseCase;
begin
	Result := ObterNFSeEventoUseCase.Create(
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo
  );
end;

function ErpFeaturesFactory.CreateObterNFSeOSsUseCase: IObterNFSeOSsUseCase;
begin
  Result := ObterNFSeOSsUseCase.Create(ErpFeaturesRepoContainer.GetInstance().NFSeRepo);
end;

function ErpFeaturesFactory.CreateObterNFSeResumoUseCase: IObterNFSeResumoUseCase;
begin
	Result := ObterNFSeResumoUseCase.Create(
    FSession,
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo
  );
end;

function ErpFeaturesFactory.CreateObterNFSeUseCase: IObterNFSeUseCase;
begin
	Result := ObterNFSeUseCase.Create(
    FSession,
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo
  );
end;

function ErpFeaturesFactory.CreateObterRegraRedBenefPcPorIdUseCase: IObterRegraRedBenefPcPorIdUseCase;
begin
  Result := ObterRegraRedBenefPcUseCasePorId.Create(
    ErpFeaturesRepoContainer.GetInstance().RegrasRedBenefPcRepo
  );
end;

function ErpFeaturesFactory.CreateObterGruposFiscaisUseCase: IObterGrupoFiscalPorIdUseCase;
begin
  Result := ObterGrupoFiscalPorIdUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().GruposFiscaisRepo
  );
end;

function ErpFeaturesFactory.CreateOperacaoPassivelDeRedBenefPcUseCase: IOperacaoPassivelDeRedBenefPcUseCase;
begin
  Result := OperacaoPassivelDeRedBenefPcUseCase.Create(
    FSession,
    ErpFeaturesRepoContainer.GetInstance().RegrasRedBenefPcRepo
  );
end;

function ErpFeaturesFactory.CreateObterNcmMaisRecenteUseCase: IObterNcmMaisRecenteUseCase;
begin
  Result := ObterNcmUseCase.Create(
    SharedRepoContainer.GetInstance().NcmsRepo
  );
end;

function ErpFeaturesFactory.CreateObterOperacaoFiscalIbsCbsPorIdUseCase: IObterOperacaoFiscalIbsCbsPorIdUseCase;
begin
  Result := ObterOperacaoFiscalIbsCbsPorIdUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().OperacoesFiscaisIbsCbsRepo
  );
end;

function ErpFeaturesFactory.CreateObterOperacaoInternaPorIdUseCase: IObterOperacaoInternaPorIdUseCase;
begin
  Result := ObterOperacaoInternaPorIdUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().OperacoesInternasRepo
  );
end;

function ErpFeaturesFactory.CreateObterQuantidadePendenciasSefazUseCase: IObterQuantidadePendenciasSefazUseCase;
begin
  Result := ObterQuantidadePendenciasSefazUseCase.Create(
    FSession,
    ErpFeaturesRepoContainer.GetInstance().NotasFiscaisRepo
  );
end;

function ErpFeaturesFactory.CreateObterRegraFiscalIbsCbsPorIdUseCase: IObterRegraFiscalIbsCbsPorIdUseCase;
begin
  Result := ObterRegraFiscalIbsCbsPorIdUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().RegrasFiscaisIbsCbsRepo
  );
end;

function ErpFeaturesFactory.CreateObterTipoServicoPorIdUseCase: IObterTipoServicoPorIdUseCase;
begin
  Result := ObterTipoServicoUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().TiposServicosRepo
  );
end;

function ErpFeaturesFactory.CreateObterTipoVendaPorIdUseCase: IObterTipoVendaPorIdUseCase;
begin
  Result := ObterTiposVendasUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().TiposVendasRepo
  );
end;

function ErpFeaturesFactory.CreateRegistrarAjusteRedBenefPcUseCase: IRegistrarAjusteRedBenefPcUseCase;
var
  Consolidador: IConsolidadorContextoFiscalPcService;
  CalculadorAjuste: ICalcularAjusteRedBenefPcService;
  CalcularPISCOFINS: ICalcularPisCofinsService;
  AplicadorReducao: IAplicadorRedBenefPcService;
begin
  Consolidador := ConsolidadorContextoFiscalPcService.Create(
    ErpFeaturesRepoContainer.GetInstance().NotasFiscaisRepo,
    ErpFeaturesRepoContainer.GetInstance().NotasConsumidorRepo
  );

  CalcularPISCOFINS := CalcularPisCofinsService.Create();

  AplicadorReducao := AplicadorRedBenefPcService.Create();

  CalculadorAjuste := CalcularAjusteRedBenefPcService.Create(
    ErpFeaturesRepoContainer.GetInstance().RegrasRedBenefPcRepo,
    CalcularPISCOFINS,
    AplicadorReducao,
    ErpFeaturesRepoContainer.GetInstance().ConfiguracoesRepo
  );

  Result := RegistrarAjusteRedBenefPcUseCase.Create(
    FDatabaseConnection,
    ErpFeaturesRepoContainer.GetInstance().AjustesRedBenefPcRepo,
    Consolidador,
    CalculadorAjuste
  );
end;

function ErpFeaturesFactory.CreateRemoverAjusteRedBenefPcUseCase: IRemoverAjusteRedBenefPcUseCase;
begin
  Result := RemoverAjusteRedBenefPcUseCase.Create(
    FDatabaseConnection,
    ErpFeaturesRepoContainer.GetInstance().AjustesRedBenefPcRepo
  );
end;

function ErpFeaturesFactory.CreateRemoverGruposFiscaisUseCase: IRemoverGrupoFiscalUseCase;
begin
  Result := RemoverGrupoFiscalUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().GruposFiscaisRepo
  );
end;

function ErpFeaturesFactory.CreateRemoverNFSeOSUseCase: IRemoverNFSeOSUseCase;
var
  CalcularTributosNFSe: ICalcularTributosNFSeService;
  CalculoAplicador: INFSeCalculoAplicadorService;
begin
  CalcularTributosNFSe := CreateCalcularTributosNFSeService();

  CalculoAplicador := NFSeCalculoAplicadorService.Create();

  Result := RemoverNFSeOSUseCase.Create(
    FDatabaseConnection,
    ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo,
    ErpFeaturesRepoContainer.GetInstance().PedVendaRepo,
    CalcularTributosNFSe,
    CalculoAplicador
  );
end;

function ErpFeaturesFactory.CreateRemoverOperacaoFiscalIbsCbsUseCase: IRemoverOperacaoFiscalIbsCbsUseCase;
begin
  Result := RemoverOperacaoFiscalIbsCbsUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().OperacoesFiscaisIbsCbsRepo
  );
end;

function ErpFeaturesFactory.CreateRemoverOperacaoInternaUseCase: IRemoverOperacaoInternaUseCase;
begin
  Result := RemoverOperacaoInternaUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().OperacoesInternasRepo
  );
end;

function ErpFeaturesFactory.CreateRemoverRegraFiscalIbsCbsUseCase: IRemoverRegraFiscalIbsCbsUseCase;
begin
  Result := RemoverRegraFiscalIbsCbsUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().RegrasFiscaisIbsCbsRepo
  );
end;

function ErpFeaturesFactory.CreateRemoverRegraRedBenefPcUseCase: IRemoverRegraRedBenefPcUseCase;
begin
  Result := RemoverRegraRedBenefPcUseCase.Create(
    FDatabaseConnection,
    ErpFeaturesRepoContainer.GetInstance().RegrasRedBenefPcRepo
  );
end;

function ErpFeaturesFactory.CreateRemoverTributoDFeUseCase: IRemoverTributoDFeUseCase;
begin
  Result := RemoverTributoDFeUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo
  );
end;

function ErpFeaturesFactory.CreateResolverRegraFiscalIbsCbsService: IResolverRegraFiscalIbsCbsService;
begin
  Result := ResolverRegraFiscalIbsCbsService.Create(
    ErpFeaturesRepoContainer.GetInstance().OperacoesFiscaisIbsCbsRepo,
    ErpFeaturesRepoContainer.GetInstance().RegrasFiscaisIbsCbsRepo
  );
end;

function ErpFeaturesFactory.CreateResolverRegraFiscalIbsCbsUseCase: IResolverRegraFiscalIbsCbsUseCase;
begin
  Result := ResolverRegraFiscalIbsCbsUseCase.Create(
    CreateResolverRegraFiscalIbsCbsService()
  );
end;

function ErpFeaturesFactory.CreateReverterAutorizacaoPortalNFSeUseCase: IReverterAutorizacaoPortalNFSeUseCase;
begin
	Result := ReverterAutorizacaoPortalNFSeUseCase.Create(
    FDatabaseConnection,
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo,
    CreateAtualizarSituacaoNFSeService()
  );
end;

function ErpFeaturesFactory.CreateReverterCancelamentoPortalNFSeUseCase: IReverterCancelamentoPortalNFSeUseCase;
begin
	Result := ReverterCancelamentoPortalNFSeUseCase.Create(
    FDatabaseConnection,
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo
  );
end;

function ErpFeaturesFactory.CreateSalvarNFSeUseCase: ISalvarNFSeUseCase;
begin
	Result := SalvarNFSeUseCase.Create(
    FDatabaseConnection,
		ErpFeaturesRepoContainer.GetInstance().NFSeRepo,
		ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo
  );
end;

function ErpFeaturesFactory.CreateSalvarAjusteRedBenefPcUseCase: ISalvarAjusteRedBenefPcUseCase;
begin
  Result := SalvarAjusteRedBenefPcUseCase.Create(
    FDatabaseConnection,
    FSession,
    ErpFeaturesRepoContainer.GetInstance().AjustesRedBenefPcRepo
  );
end;

function ErpFeaturesFactory.CreateSalvarConfiguracaoNFSeUseCase: ISalvarConfiguracaoNFSeUseCase;
var
  Encryptor: ITokenEncryptor;
begin
  Encryptor := TDFeDLLCypher.Create(CreateSecretPorEmpresaNFSe());

  Result := SalvarConfiguracaoNFSeUseCase.Create(
    FDatabaseConnection,
    ErpFeaturesRepoContainer.GetInstance().ConfiguracoesRepo,
    Encryptor
  );
end;

function ErpFeaturesFactory.CreateSalvarGruposFiscaisUseCase: ISalvarGrupoFiscalUseCase;
begin
  Result := SalvarGrupoFiscalUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().GruposFiscaisRepo
  );
end;

function ErpFeaturesFactory.CreateSalvarOperacaoFiscalIbsCbsUseCase: ISalvarOperacaoFiscalIbsCbsUseCase;
begin
  Result := SalvarOperacaoFiscalIbsCbsUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().OperacoesFiscaisIbsCbsRepo
  );
end;

function ErpFeaturesFactory.CreateSalvarOperacaoInternaUseCase: ISalvarOperacaoInternaUseCase;
begin
  Result := SalvarOperacaoInternaUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().OperacoesInternasRepo
  );
end;

function ErpFeaturesFactory.CreateSalvarRegraFiscalIbsCbsUseCase: ISalvarRegraFiscalIbsCbsUseCase;
begin
  Result := SalvarRegraFiscalIbsCbsUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().RegrasFiscaisIbsCbsRepo,
    FiscalRepoContainer.GetInstance().TratamentoClassificacaoRepo
  );
end;

function ErpFeaturesFactory.CreateSalvarRegraRedBenefPcUseCase: ISalvarRegraRedBenefPcUseCase;
begin
  Result := SalvarRegraRedBenefPcUseCase.Create(
    FDatabaseConnection,
    ErpFeaturesRepoContainer.GetInstance().RegrasRedBenefPcRepo
  );
end;

function ErpFeaturesFactory.CreateSalvarTributoDFeUseCase: ISalvarTributoDFeUseCase;
begin
  Result := SalvarTributoDFeUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().TributosDFeRepo
  );
end;

function ErpFeaturesFactory.CreateVincularOpInternasATipoVendaUseCase: IVincularOpInternasATipoVendaUseCase;
begin
  Result := VincularOpInternasATipoVendaUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().OpInternasComTpVendasRepo
  );
end;

function ErpFeaturesFactory.CreateVincularTiposVendasAOpInternaUseCase: IVincularTiposVendasAOpInternaUseCase;
begin
  Result := VincularTiposVendasAOpInternaUseCase.Create(
    ErpFeaturesRepoContainer.GetInstance().OpInternasComTpVendasRepo
  );
end;

end.
