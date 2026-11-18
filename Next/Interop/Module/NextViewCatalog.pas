unit NextViewCatalog;

interface

uses
  Winapi.Windows, NextBaseForm;

function NextViewCreate(const AIdentifier: string; AParent: HWND): TfrmNextBase;

implementation

uses
  NextViewRegistry, EventosRtcComposition, OperacoesFiscaisIbsCbsComposition,
  GruposFiscaisComposition;

var
  FRegistry: TNextViewRegistry;

function NextViewCreate(const AIdentifier: string; AParent: HWND): TfrmNextBase;
begin
  Result := FRegistry.CreateView(AIdentifier, AParent);
end;

initialization
  FRegistry := TNextViewRegistry.Create;
  FRegistry.Register('rtc.events', CreateEventosRtcView);
  FRegistry.Register('operacoes.fiscais.ibscbs', TOperacoesFiscaisIbsCbsComposition.CriarConsulta);
  FRegistry.Register('grupos.fiscais', TGruposFiscaisComposition.CriarConsulta);

finalization
  FRegistry.Free;

end.
