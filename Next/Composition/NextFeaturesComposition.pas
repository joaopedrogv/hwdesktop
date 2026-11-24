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
  NextDatasetDefinition, GruposFiscaisQueryDefinition,
  ColumnLayoutPreferences, ColumnLayoutPreferencesRepository,
  LocalPreferences, WindowsRegistryLocalPreferences,
  IConfiguracoesRepositoryUnit, ConfiguracoesRepositoryUnit,
  IProcessosProviderUnit, ProcessosProviderUnit,
  IProcessosRepositoryUnit, ProcessosRepositoryUnit,
  RegistrarProcessosUseCaseUnit,
  IEventosDFeRepositoryUnit, EventosDFeRepositoryUnit,
  IEventoDFe112150RepositoryUnit, EventoDFe112150RepositoryUnit,
  IEventoDFe211130RepositoryUnit, EventoDFe211130RepositoryUnit,
  IEventoDFeTransmissaoRepositoryUnit, EventoDFeTransmissaoRepositoryUnit,
  SalvarEventoDFe112150UseCaseUnit, ObterEventoDFe112150PorIdUseCaseUnit,
  SalvarEventoDFe211130UseCaseUnit, ObterEventoDFe211130PorIdUseCaseUnit,
  RemoverEventoDFeUseCaseUnit, ObterProximoSeqIdEventoDFeUseCaseUnit,
  EventoDFeEnvelopeResolverUnit, TransmitirEventoDFeUseCaseUnit,
  ConsultarSituacaoEventoDFeUseCaseUnit,
  EventosDFeComposition,
  ValidadorItemEventoDFe211130Unit;

procedure RegisterNextFeatures(const AContainer: TContainer);
begin
  // Autorizacao compartilhada pelas telas Next sobre o callback do host.
  AContainer.RegisterType<IAuthorizationComunicator, TNextAuthorizationComunicator>.AsTransient;
  AContainer.RegisterType<IAuthorizationService, TNextAuthorizationAdapter>.AsSingleton;

  // Sem estado entre chamadas: DatasetId e usuario sao lidos a cada operacao, por isso a instancia unica atende a troca
  // de usuario.
  AContainer.RegisterType<IColumnLayoutPreferences, TColumnLayoutPreferencesRepository>.AsSingleton;

  // A secao e a chave sao recebidas a cada operacao; a instancia unica atende todas as telas.
  AContainer.RegisterType<ILocalPreferences, TWindowsRegistryLocalPreferences>.AsSingleton;

  // O registro de processos usa a conexao do Setup e e resolvido a cada preparacao da empresa.
  AContainer.RegisterType<IProcessosRepository, ProcessosRepository>.AsSingleton;
  AContainer.RegisterType<IConfiguracoesRepository, ConfiguracoesRepository>.AsSingleton;
  AContainer.RegisterType<IProcessosProvider, TProcessosProvider>.AsSingleton;
  AContainer.RegisterType<IRegistrarProcessosUseCase, RegistrarProcessosUseCase>.AsTransient;


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
  AContainer.RegisterType<INextDatasetDefinition<TGrupoSelecionado>, TGruposFiscaisQueryDefinition>().AsTransient;

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

  // Eventos DF-e: repositorios e leituras nao guardam estado e usam a conexao do Setup;
  // as gravacoes usam variaveis locais e sao transientes.
  AContainer.RegisterType<IEventosDFeRepository, EventosDFeRepository>.AsSingleton;
  AContainer.RegisterType<IEventoDFe112150Repository, EventoDFe112150Repository>.AsSingleton;
  AContainer.RegisterType<IEventoDFe211130Repository, EventoDFe211130Repository>.AsSingleton;
  // O contrato fiscal e compilado com o DLL; a implementacao ACBr e criada e registrada pela composicao da feature.
  AContainer.RegisterType<IEventoDFeTransmissaoRepository, EventoDFeTransmissaoRepository>.AsSingleton;
  AContainer.RegisterType<ISalvarEventoDFe112150UseCase, SalvarEventoDFe112150UseCase>.AsTransient;
  AContainer.RegisterType<ObterEventoDFe112150PorIdUseCase>.AsSingleton;
  AContainer.RegisterType<ISalvarEventoDFe211130UseCase, SalvarEventoDFe211130UseCase>.AsTransient;
  AContainer.RegisterType<ObterEventoDFe211130PorIdUseCase>.AsSingleton;
  AContainer.RegisterType<IRemoverEventoDFeUseCase, RemoverEventoDFeUseCase>.AsTransient;
  AContainer.RegisterType<IObterProximoSeqIdEventoDFeUseCase, ObterProximoSeqIdEventoDFeUseCase>.AsTransient;
  // A resolucao do envelope usa a empresa da sessao; a transmissao usa a conexao e os repositorios do Setup.
  AContainer.RegisterType<IEventoDFeEnvelopeResolver, EventoDFeEnvelopeResolver>.AsSingleton;
  AContainer.RegisterType<TransmitirEventoDFeUseCase>.AsSingleton;
  AContainer.RegisterType<ConsultarSituacaoEventoDFeUseCase>.AsSingleton;

  TEventosDFeComposition.Registrar(AContainer);

  // A validacao do item nao guarda estado; a instancia transiente e entregue a fabrica do editor.
  AContainer.RegisterType<IValidadorItemEventoDFe211130, ValidadorItemEventoDFe211130>.AsTransient;
end;

end.
