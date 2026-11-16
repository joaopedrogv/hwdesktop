unit NextViewCatalog;

interface

uses
  Winapi.Windows, NextBaseForm;

// Generic entry point used by the exports unit. The registry and the concrete
// screens are intentionally not exposed here.
function NextViewCreate(const AIdentifier: string; AParent: HWND): TfrmNextBase;

implementation

uses
  System.SysUtils, NextViewRegistry,
  HwNextValidationSecondFormUnit, ConsultaBaseForm,
  EventosRtcForm, EventosRtcDefinition, GruposFiscaisForm,
  LocalPreferences,
  WindowsRegistryLocalPreferences, ColumnLayoutPreferences,
  ColumnLayoutPreferencesRepository, StandardQueryFilterDefinition,
  QueryResultOperations, GridColumnDefinition,
  NextSetup, EventosRtcPresenter, GruposFiscaisPresenter,
  AuthorizationService, RemoverGrupoFiscalUseCaseUnit,
  SalvarGrupoFiscalUseCaseUnit, ListarEmpresasUseCaseUnit, IDataSetReaderUnit,
  GruposFiscaisQueryDefinition, NextQueryDefinition;

var
  FRegistry: TNextViewRegistry;

function CreateEventosRtcView(AParent: HWND): TfrmNextBase;
var
  View: TfrmEventosRtc;
  Preferences: ILocalPreferences;
  LayoutPreferences: IColumnLayoutPreferences;
  Presenter: TEventosRtcPresenter;
  Operations: IQueryResultOperations;
begin
  Preferences := TWindowsRegistryLocalPreferences.Create;

  View := TfrmEventosRtc.CreateParented(AParent);
  try
    // A composicao resolve o apresentador do contexto atual. A tela o possui,
    // consulta a empresa e a opcao de autorizacao a cada pesquisa e permanece
    // responsavel pelo leitor e pelo conjunto retornado.
    Presenter := NextSetupInstance.Resolve<TEventosRtcPresenter>;
    try
      // A ordenacao usa as mesmas operacoes da previa, sem coluna de marcacao:
      // o conjunto e criado a cada pesquisa e o Setup fornece o ordenador que
      // aplica a ordem nativa.
      Operations := NextSetupInstance.Resolve<IQueryResultOperations>();
      View.AttachPresenter(Presenter, CreateEventosRtcColumns, 'Eventos RTC', Operations);
    except
      // Se a associacao nao foi aceita, a tela nao assumiu a posse; liberar
      // evita deixar uma instancia orfa do apresentador.
      Presenter.Free;
      raise;
    end;

    // O repositório é transiente: a composição cede conexão/sessão do Setup e a
    // grade o mantém enquanto a tela existir.
    LayoutPreferences := TColumnLayoutPreferencesRepository.Create(
      NextSetupInstance.Adapter, NextSetupInstance.SessionContext,
      'next.rtc.events');
    View.AttachColumnLayout(LayoutPreferences);

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

function CreateGruposFiscaisView(AParent: HWND): TfrmNextBase;
var
  View: TfrmGruposFiscais;
  Preferences: ILocalPreferences;
  Presenter: TGruposFiscaisPresenter;
  Operations: IQueryResultOperations;
  Definitions: INextQueryDefinition<TGrupoSelecionado>;
begin
  Preferences := TWindowsRegistryLocalPreferences.Create;

  View := TfrmGruposFiscais.CreateParented(AParent);
  try
    Definitions := NextSetupInstance.Resolve<INextQueryDefinition<TGrupoSelecionado>>;
    // O apresentador recebe a tela como view; as demais dependencias continuam
    // vindo do container do Setup. A tela possui o apresentador e permanece
    // responsavel pelo leitor e pelo conjunto retornado.
    Presenter := TGruposFiscaisPresenter.Create(View, Definitions,
      NextSetupInstance.Resolve<IAuthorizationService>,
      NextSetupInstance.Resolve<IRemoverGrupoFiscalUseCase>,
      NextSetupInstance.Resolve<ISalvarGrupoFiscalUseCase>,
      NextSetupInstance.Resolve<ListarEmpresasUseCase>,
      NextSetupInstance.SessionContext);
    try
      View.AttachPresenter(Presenter, Definitions.ColumnsDef, 'Grupos Fiscais', Definitions.GetResultOperation());
    except
      // Associacao recusada: a tela nao assumiu a posse.
      Presenter.Free;
      raise;
    end;

    View.ConfigureFilters(Definitions.FiltersDef, Preferences, 'next.grupos.fiscais');

    Result := View;
  except
    View.Free;
    raise;
  end;
end;

initialization
  FRegistry := TNextViewRegistry.Create;
  FRegistry.Register('next.rtc.events', CreateEventosRtcView);
  FRegistry.Register('next.grupos.fiscais', CreateGruposFiscaisView);

finalization
  FRegistry.Free;

end.
