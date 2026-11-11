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
  EventosRtcDefinition, LocalPreferences,
  WindowsRegistryLocalPreferences, StandardQueryFilterDefinition,
  QueryPreviewReader, QueryResultOperations, GridColumnDefinition,
  NextSetup, EventosRtcPresenter, IDataSetReaderUnit;

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

function CreateValidationSecondView(AParent: HWND): TfrmNextBase;
var
  View: TfrmHwNextValidationSecond;
  Reader: IDataSetReader;
  Operations: IQueryResultOperations;
begin
  View := TfrmHwNextValidationSecond.CreateParented(AParent);
  try
    // A segunda previa usa o leitor de exemplo e as operacoes de marcacao para
    // validar o filtro rapido sobre o mesmo conjunto ja carregado. As colunas
    // seguem os campos criados pelo leitor de previa.
    Reader := TQueryPreviewReader.Create('sel');
    Operations := TQueryResultOperations.Create(Reader, 'sel');
    View.Attach(Reader, GridColumns([
      GridColumn('sel', 'Sel', 50, qcaCenter),
      GridColumn('documento', 'Documento', 120),
      GridColumn('descricao', 'Descri'#231#227'o', 220),
      GridColumn('codigo', 'C'#243'digo', 90, qcaRight),
      GridColumn('valor', 'Valor', 110, qcaRight),
      GridColumn('data', 'Data', 110, qcaCenter)
    ]), 'Valida'#231#227'o Next 2', Operations, True);
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
  Presenter: TEventosRtcPresenter;
begin
  Preferences := TWindowsRegistryLocalPreferences.Create;

  View := TfrmEventosRtc.CreateParented(AParent);
  try
    // A composicao resolve o apresentador do contexto atual. A tela o possui,
    // consulta a empresa e a opcao de autorizacao a cada pesquisa e permanece
    // responsavel pelo leitor e pelo conjunto retornado.
    Presenter := NextSetupInstance.Resolve<TEventosRtcPresenter>;
    try
      View.AttachPresenter(Presenter, CreateEventosRtcColumns, 'Eventos RTC');
    except
      // Se a associacao nao foi aceita, a tela nao assumiu a posse; liberar
      // evita deixar uma instancia orfa do apresentador.
      Presenter.Free;
      raise;
    end;

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
