unit NextFeaturesComposition;

interface

uses
  Spring.Container;

procedure RegisterNextFeatures(const AContainer: TContainer);

implementation

uses
  EventosRtcQuery, EventosRtcPresenter, GruposFiscaisQuery,
  GruposFiscaisPresenter, AuthorizationService, NextAuthorizationAdapter,
  IGruposFiscaisRepositoryUnit, GruposFiscaisRepositoryUnit,
  RemoverGrupoFiscalUseCaseUnit, SalvarGrupoFiscalUseCaseUnit,
  ListarEmpresasUseCaseUnit, IEmpresasRepositoryUnit, EmpresasRepositoryUnit;

procedure RegisterNextFeatures(const AContainer: TContainer);
begin
  AContainer.RegisterType<IEventosRtcQuery, TEventosRtcQuery>.AsSingleton;
  AContainer.RegisterType<TEventosRtcPresenter>.AsTransient;

  // Autorizacao compartilhada pelas telas Next sobre o callback do host.
  AContainer.RegisterType<IAuthorizationService, TNextAuthorizationAdapter>.AsSingleton;

  // Catalogo global: a consulta nao depende de empresa nem de sessao.
  AContainer.RegisterType<IGruposFiscaisQuery, TGruposFiscaisQuery>.AsSingleton;

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

  AContainer.RegisterType<TGruposFiscaisPresenter>.AsTransient;
end;

end.
