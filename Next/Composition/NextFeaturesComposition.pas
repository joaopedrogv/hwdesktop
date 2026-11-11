unit NextFeaturesComposition;

interface

uses
  Spring.Container;

procedure RegisterNextFeatures(const AContainer: TContainer);

implementation

uses
  EventosRtcQuery, EventosRtcPresenter;

procedure RegisterNextFeatures(const AContainer: TContainer);
begin
  AContainer.RegisterType<IEventosRtcQuery, TEventosRtcQuery>.AsSingleton;
  AContainer.RegisterType<TEventosRtcPresenter>.AsTransient;
end;

end.
