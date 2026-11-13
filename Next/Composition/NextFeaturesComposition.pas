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
  RemoverGrupoFiscalUseCaseUnit;

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
  AContainer.RegisterType<RemoverGrupoFiscalUseCase>.AsSingleton;

  AContainer.RegisterType<TGruposFiscaisPresenter>.AsTransient;
end;

end.
