unit NextViewCatalog;

interface

uses
  Winapi.Windows, NextBaseForm;

// Generic entry point used by the exports unit. The registry and the concrete
// screens are intentionally not exposed here.
function NextViewCreate(const AIdentifier: string; AParent: HWND): TfrmNextBase;

implementation

uses
  System.SysUtils, NextViewRegistry, HwNextValidationFormUnit,
  HwNextValidationSecondFormUnit, QueryStandardForm, EventosRtcForm,
  EventosRtcDefinition, IDatabaseReaderUnit, LocalPreferences,
  WindowsRegistryLocalPreferences, StandardQueryFilterDefinition,
  QueryPreviewReader, QueryResultOperations, GridColumnDefinition,
  EventosRtcQueryComposition;

var
  FRegistry: TNextViewRegistry;

function CreateValidationView(AParent: HWND): TfrmNextBase;
var
  View: TfrmHwNextValidation;
begin
  View := TfrmHwNextValidation.CreateParented(AParent);
  try
    // Composition point. next.validation currently has no injected dependency;
    // when it gains one, compose it here and pass it to View before returning
    // the base type.
    Result := View;
  except
    View.Free;
    raise;
  end;
end;

function CreateValidationSecondView(AParent: HWND): TfrmNextBase;
var
  View: TfrmHwNextValidationSecond;
  Leitor: IDatabaseReader;
  Operacoes: IQueryResultOperations;
  Preferences: ILocalPreferences;
begin
  View := TfrmHwNextValidationSecond.CreateParented(AParent);
  try
    var CampoMarcacao := 'SEL';
    Leitor := TQueryPreviewReader.Create(CampoMarcacao);
    Operacoes := TQueryResultOperations.Create(Leitor, CampoMarcacao);
    Preferences := TWindowsRegistryLocalPreferences.Create;

    var columns := GridColumns([
      GridColumn(CampoMarcacao, 'Marcação', 48),
      GridColumn('documento', 'Documento', 140),
      GridColumn('descricao', 'Descricao', 220),
      GridColumn('codigo', 'Codigo', 80, qcaRight),
      GridColumn('valor', 'Valor', 110, qcaRight),
      GridColumn('data', 'Data', 100, qcaCenter)]);

    View.Attach(Leitor, columns, 'Secondsss', Operacoes);

    View.ConfigureFilters(CreateStandardQueryFilterDefinition, Preferences,'next.validation.second');

    Result := View;
  except
    View.Free;
    raise;
  end;
end;

function CreateStandardQueryView(AParent: HWND): TfrmNextBase;
var
  View: TfrmQueryStandard;
  Preferences: ILocalPreferences;
begin
  View := TfrmQueryStandard.CreateParented(AParent);
  try
    // A prévia recebe a definição de exemplo e o adaptador de preferências. A
    // identidade é dedicada a esta entrada e não é compartilhada com telas de
    // produto. A interface é contada por referência e o frame a mantém viva.
    Preferences := TWindowsRegistryLocalPreferences.Create;
    View.ConfigureFilters(CreateStandardQueryFilterDefinition, Preferences,
      'next.query.standard.filter');
    Result := View;
  except
    View.Free;
    raise;
  end;
end;

function CreateEventosRtcView(AParent: HWND): TfrmNextBase;
var
  View: TfrmEventosRtc;
  Preferences: ILocalPreferences;
begin
  Preferences := TWindowsRegistryLocalPreferences.Create;

  View := TfrmEventosRtc.CreateParented(AParent);
  try
    // A tela coleta os criterios, le a opcao de autorizacao e recebe um leitor
    // novo a cada pesquisa. A criacao do leitor e a reserva do contexto ficam
    // na composicao.
    View.AttachEventosRtcReaderFactory(CreateEventosRtcReader,
      CreateEventosRtcColumns, 'Eventos RTC');

    View.ConfigureFilters(CreateEventosRtcFilters(), Preferences,
      'next.rtc.events');

    Result := View;
  except
    View.Free;
    raise;
  end;
end;

function NextViewCreate(const AIdentifier: string;
  AParent: HWND): TfrmNextBase;
begin
  Result := FRegistry.CreateView(AIdentifier, AParent);
end;

initialization
  FRegistry := TNextViewRegistry.Create;
  FRegistry.Register('next.validation', CreateValidationView);
  FRegistry.Register('next.validation.second', CreateValidationSecondView);
  FRegistry.Register('next.query.standard', CreateStandardQueryView);
  FRegistry.Register('next.rtc.events', CreateEventosRtcView);

finalization
  FRegistry.Free;

end.
