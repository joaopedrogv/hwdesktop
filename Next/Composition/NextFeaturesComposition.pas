unit NextFeaturesComposition;

interface

uses
  Spring.Container;

procedure RegisterNextFeatures(const AContainer: TContainer);

implementation

uses
  AuthorizationService, NextAuthorizationAdapter,
  IGruposFiscaisRepositoryUnit, GruposFiscaisRepositoryUnit,
  RemoverGrupoFiscalUseCaseUnit, SalvarGrupoFiscalUseCaseUnit,
  ObterGruposFiscaisUseCaseUnit, ListarGruposFiscaisUseCaseUnit,
  ListarEmpresasUseCaseUnit, IEmpresasRepositoryUnit, EmpresasRepositoryUnit,
  IOperacoesFiscaisIbsCbsRepositoryUnit, OperacoesFiscaisIbsCbsRepositoryUnit,
  IOperacoesInternasRepositoryUnit, OperacoesInternasRepositoryUnit,
  IRegrasFiscaisIbsCbsRepositoryUnit, RegrasFiscaisIbsCbsRepositoryUnit,
  ObterOperacaoFiscalIbsCbsPorIdUseCaseUnit,
  SalvarOperacaoFiscalIbsCbsUseCaseUnit,
  RemoverOperacaoFiscalIbsCbsUseCaseUnit,
  ResolverRegraFiscalIbsCbsUseCaseUnit, IResolverRegraFiscalIbsCbsServiceUnit,
  ResolverRegraFiscalIbsCbsServiceUnit,
  ListarOperacoesInternasUseCaseUnit, ListarRegrasFiscaisUseCaseUnit,
  NextQueryDefinition, GruposFiscaisQueryDefinition,
  ColumnLayoutPreferences, ColumnLayoutPreferencesRepository,
  LocalPreferences, WindowsRegistryLocalPreferences;

procedure RegisterNextFeatures(const AContainer: TContainer);
begin
  // Autorizacao compartilhada pelas telas Next sobre o callback do host.
  AContainer.RegisterType<IAuthorizationComunicator, TNextAuthorizationComunicator>.AsTransient;
  AContainer.RegisterType<IAuthorizationService, TNextAuthorizationAdapter>.AsSingleton;

  // Sem estado entre chamadas: QueryId e usuario sao lidos a cada operacao, por isso a instancia unica atende a troca
  // de usuario.
  AContainer.RegisterType<IColumnLayoutPreferences, TColumnLayoutPreferencesRepository>.AsSingleton;

  // A secao e a chave sao recebidas a cada operacao; a instancia unica atende todas as telas.
  AContainer.RegisterType<ILocalPreferences, TWindowsRegistryLocalPreferences>.AsSingleton;


  // A remocao reutiliza a conexao compartilhada do Setup; sem estado, o repositorio fica como instancia unica de posse
  // do container.
  AContainer.RegisterType<IGruposFiscaisRepository, GruposFiscaisRepository>.AsSingleton;
  AContainer.RegisterType<IRemoverGrupoFiscalUseCase, RemoverGrupoFiscalUseCase>.AsTransient;

  // Repositorio e casos de uso sem estado usam a conexao e a sessao do Setup; a instancia unica pode ser reutilizada
  // por qualquer tela.
  AContainer.RegisterType<IEmpresasRepository, EmpresasRepository>.AsSingleton;
  AContainer.RegisterType<ListarEmpresasUseCase>.AsSingleton;
  AContainer.RegisterType<ISalvarGrupoFiscalUseCase, SalvarGrupoFiscalUseCase>.AsTransient;

  // Sem interface, a instancia nao e contada por referencia: o container a possui e o apresentador nao a libera.
  AContainer.RegisterType<ObterGrupoFiscalPorIdUseCase>.AsSingleton;
  AContainer.RegisterType<INextQueryDefinition<TGrupoSelecionado>, TGruposFiscaisQueryDefinition>().AsTransient;

  // Repositorios e casos de uso de leitura nao guardam estado e leem a conexao do Setup.
  AContainer.RegisterType<IOperacoesFiscaisIbsCbsRepository, OperacoesFiscaisIbsCbsRepository>.AsSingleton;
  AContainer.RegisterType<IOperacoesInternasRepository, OperacoesInternasRepository>.AsSingleton;
  AContainer.RegisterType<IRegrasFiscaisIbsCbsRepository, RegrasFiscaisIbsCbsRepository>.AsSingleton;
  AContainer.RegisterType<ObterOperacaoFiscalIbsCbsPorIdUseCase>.AsSingleton;
  AContainer.RegisterType<ListarOperacoesInternasUseCase>.AsSingleton;
  AContainer.RegisterType<IListarAtualeTodosGruposFiscaisUseCase>.AsSingleton;
  AContainer.RegisterType<ListarRegrasFiscaisUseCase>.AsSingleton;

  // A gravacao usa apenas variaveis locais; o container possui a instancia unica e o apresentador nao a libera.
  AContainer.RegisterType<SalvarOperacaoFiscalIbsCbsUseCase>.AsSingleton;
  AContainer.RegisterType<RemoverOperacaoFiscalIbsCbsUseCase>.AsSingleton;

  // A analise consulta os dois repositorios ja registrados; sem estado, o caso de uso fica como instancia unica.
  AContainer.RegisterType<IResolverRegraFiscalIbsCbsService, ResolverRegraFiscalIbsCbsService>.AsTransient;
  AContainer.RegisterType<ResolverRegraFiscalIbsCbsUseCase>.AsSingleton;
end;

end.
