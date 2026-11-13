unit NextFeaturesComposition;

interface

uses
  Spring.Container;

procedure RegisterNextFeatures(const AContainer: TContainer);

implementation

uses
  EventosRtcQuery, EventosRtcPresenter, GruposFiscaisQuery,
  GruposFiscaisPresenter, AuthorizationService, NextAuthorizationAdapter;

procedure RegisterNextFeatures(const AContainer: TContainer);
begin
  AContainer.RegisterType<IEventosRtcQuery, TEventosRtcQuery>.AsSingleton;
  AContainer.RegisterType<TEventosRtcPresenter>.AsTransient;

  // Autorizacao compartilhada pelas telas Next sobre o callback do host.
  AContainer.RegisterType<IAuthorizationService, TNextAuthorizationAdapter>.AsSingleton;

  // Catalogo global: a consulta nao depende de empresa nem de sessao.
  AContainer.RegisterType<IGruposFiscaisQuery, TGruposFiscaisQuery>.AsSingleton;
  AContainer.RegisterType<TGruposFiscaisPresenter>.AsTransient;
end;

end.
