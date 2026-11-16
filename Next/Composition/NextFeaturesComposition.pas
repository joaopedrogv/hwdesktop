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
  ObterGruposFiscaisUseCaseUnit,
  ListarEmpresasUseCaseUnit, IEmpresasRepositoryUnit, EmpresasRepositoryUnit,
  NextQueryDefinition, GruposFiscaisQueryDefinition;

procedure RegisterNextFeatures(const AContainer: TContainer);
begin
  // Autorizacao compartilhada pelas telas Next sobre o callback do host.
  AContainer.RegisterType<IAuthorizationComunicator, TNextAuthorizationComunicator>.AsTransient;
  AContainer.RegisterType<IAuthorizationService, TNextAuthorizationAdapter>.AsSingleton;


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
end;

end.
