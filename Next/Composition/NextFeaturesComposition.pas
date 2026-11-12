unit NextFeaturesComposition;

interface

uses
  Spring.Container;

procedure RegisterNextFeatures(const AContainer: TContainer);

implementation

uses
  EventosRtcQuery, EventosRtcPresenter, GruposFiscaisQuery,
  GruposFiscaisPresenter;

procedure RegisterNextFeatures(const AContainer: TContainer);
begin
  AContainer.RegisterType<IEventosRtcQuery, TEventosRtcQuery>.AsSingleton;
  AContainer.RegisterType<TEventosRtcPresenter>.AsTransient;

  // Catalogo global: a consulta nao depende de empresa nem de sessao.
  AContainer.RegisterType<IGruposFiscaisQuery, TGruposFiscaisQuery>.AsSingleton;
  AContainer.RegisterType<TGruposFiscaisPresenter>.AsTransient;
end;

end.
