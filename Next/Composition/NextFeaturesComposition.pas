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
  ListarOperacoesInternasUseCaseUnit, ListarRegrasFiscaisUseCaseUnit,
  NextQueryDefinition, GruposFiscaisQueryDefinition,
  ColumnLayoutPreferences, ColumnLayoutPreferencesRepository,
  LocalPreferences, WindowsRegistryLocalPreferences;

procedure RegisterNextFeatures(const AContainer: TContainer);
begin
  // Autorizacao compartilhada pelas telas Next sobre o callback do host.
  AContainer.RegisterType<IAuthorizationComunicator, TNextAuthorizationComunicator>.AsTransient;
  AContainer.RegisterType<IAuthorizationService, TNextAuthorizationAdapter>.AsSingleton;

  // Preferencias de colunas: a instancia nao guarda a consulta nem o login; o
  // QueryId e o usuario sao lidos a cada operacao. Por isso a instancia unica
  // atende todas as telas e a troca de usuario sem recriacao, como os demais
  // repositorios sem estado do container.
  AContainer.RegisterType<IColumnLayoutPreferences,
    TColumnLayoutPreferencesRepository>.AsSingleton;

  // Preferencias locais: o adaptador de registro do Windows nao guarda a tela
  // nem a sessao; a secao e a chave sao recebidas a cada operacao. Por isso a
  // instancia unica atende todas as telas.
  AContainer.RegisterType<ILocalPreferences, TWindowsRegistryLocalPreferences>.AsSingleton;


  // A remocao logica reutiliza a conexao compartilhada registrada pelo Setup.
  // Repositorio e caso de uso sao sem estado: o container mantem a posse da
  // instancia unica e o apresentador apenas a utiliza.
  AContainer.RegisterType<IGruposFiscaisRepository, GruposFiscaisRepository>.AsSingleton;
  AContainer.RegisterType<IRemoverGrupoFiscalUseCase, RemoverGrupoFiscalUseCase>.AsTransient;

  // Inclusao: as empresas sao lidas do mesmo repositorio compartilhado, que
  // resolve pela conexao e pela sessao do Setup. Repositorio e casos de uso sao
  // sem estado, portanto a instancia unica pode ser reutilizada por qualquer
  // tela; o apresentador apenas os utiliza.
  AContainer.RegisterType<IEmpresasRepository, EmpresasRepository>.AsSingleton;
  AContainer.RegisterType<ListarEmpresasUseCase>.AsSingleton;
  AContainer.RegisterType<ISalvarGrupoFiscalUseCase, SalvarGrupoFiscalUseCase>.AsTransient;

  // Alteracao: o carregamento por identificador reutiliza o mesmo repositorio
  // compartilhado. A classe do caso de uso nao possui interface neste build e
  // nao e contada por referencia; por isso a instancia unica pertence ao
  // container, como ListarEmpresasUseCase, e o apresentador apenas a utiliza.
  AContainer.RegisterType<ObterGrupoFiscalPorIdUseCase>.AsSingleton;
  AContainer.RegisterType<INextQueryDefinition<TGrupoSelecionado>, TGruposFiscaisQueryDefinition>().AsTransient;

  // Operacoes Fiscais IBS/CBS: os repositorios leem a mesma conexao
  // compartilhada do Setup e nao guardam estado entre chamadas, portanto a
  // instancia unica pode ser reutilizada por qualquer tela. Os casos de uso de
  // leitura seguem o mesmo criterio e o apresentador apenas os utiliza.
  AContainer.RegisterType<IOperacoesFiscaisIbsCbsRepository,
    OperacoesFiscaisIbsCbsRepository>.AsSingleton;
  AContainer.RegisterType<IOperacoesInternasRepository,
    OperacoesInternasRepository>.AsSingleton;
  AContainer.RegisterType<IRegrasFiscaisIbsCbsRepository,
    RegrasFiscaisIbsCbsRepository>.AsSingleton;
  AContainer.RegisterType<ObterOperacaoFiscalIbsCbsPorIdUseCase>.AsSingleton;
  AContainer.RegisterType<ListarOperacoesInternasUseCase>.AsSingleton;
  AContainer.RegisterType<IListarAtualeTodosGruposFiscaisUseCase>.AsSingleton;
  AContainer.RegisterType<ListarRegrasFiscaisUseCase>.AsSingleton;

  // A gravacao recebe a conexao e o repositorio compartilhados e nao guarda
  // estado mutavel por tela: cada execucao usa apenas variaveis locais. Como
  // ObterOperacaoFiscalIbsCbsPorIdUseCase, o container mantem a instancia unica
  // e o apresentador apenas a utiliza, sem libera-la.
  AContainer.RegisterType<SalvarOperacaoFiscalIbsCbsUseCase>.AsSingleton;
end;

end.
