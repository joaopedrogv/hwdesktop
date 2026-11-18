unit NextViewCatalog;

interface

uses
  Winapi.Windows, NextBaseForm;

// Generic entry point used by the exports unit. The registry and the concrete
// screens are intentionally not exposed here.
function NextViewCreate(const AIdentifier: string; AParent: HWND): TfrmNextBase;

implementation

uses
  NextViewRegistry, EventosRtcComposition, OperacoesFiscaisIbsCbsComposition,
  GruposFiscaisComposition;

var
  FRegistry: TNextViewRegistry;

function NextViewCreate(const AIdentifier: string;
  AParent: HWND): TfrmNextBase;
begin
  Result := FRegistry.CreateView(AIdentifier, AParent);
end;

initialization
  FRegistry := TNextViewRegistry.Create;
  FRegistry.Register('rtc.events', CreateEventosRtcView);
  FRegistry.Register('operacoes.fiscais.ibscbs',
    TOperacoesFiscaisIbsCbsComposition.CriarConsulta);
  FRegistry.Register('grupos.fiscais', CreateGruposFiscaisView);

finalization
  FRegistry.Free;

end.
