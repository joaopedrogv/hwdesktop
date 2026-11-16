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
  EventosRtcForm, EventosRtcQueryDefinition, GruposFiscaisForm,
  OperacoesFiscaisIbsCbsForm, OperacoesFiscaisIbsCbsQueryDefinition,
  LocalPreferences,
  WindowsRegistryLocalPreferences, ColumnLayoutPreferences,
  ColumnLayoutPreferencesRepository, StandardQueryFilterDefinition,
  QueryResultOperations, IDataSetReaderUnit,
  NextSetup, GruposFiscaisPresenter,
  AuthorizationService, RemoverGrupoFiscalUseCaseUnit,
  SalvarGrupoFiscalUseCaseUnit, ListarEmpresasUseCaseUnit,
  ObterGruposFiscaisUseCaseUnit,
  GruposFiscaisQueryDefinition, NextQueryDefinition, PresenterConsultaBase;

var
  FRegistry: TNextViewRegistry;

function CreateEventosRtcView(AParent: HWND): TfrmNextBase;
var
  View: TfrmEventosRtc;
  Preferences: ILocalPreferences;
  LayoutPreferences: IColumnLayoutPreferences;
  Definition: INextQueryDefinitionBase;
begin
  Preferences := TWindowsRegistryLocalPreferences.Create;

  View := TfrmEventosRtc.CreateParented(AParent);
  try
    // A definicao pertence a esta tela: recebe a fabrica e as operacoes da
    // composicao, a sessao vigente e o metodo que le a opcao do checkbox. A
    // empresa e a opcao sao consultadas a cada pesquisa, nao na abertura.
    Definition := TEventosRtcQueryDefinition.Create(
      NextSetupInstance.Resolve<ISqlDataSetReaderFactory>,
      NextSetupInstance.Resolve<IQueryResultOperations>,
      NextSetupInstance.SessionContext,
      View.IsOnlyAuthorizedNFe);
    View.Attach(Definition, 'Eventos RTC');

    // O repositório é transiente: a composição cede conexão/sessão do Setup e a
    // grade o mantém enquanto a tela existir.
    LayoutPreferences := TColumnLayoutPreferencesRepository.Create(
      NextSetupInstance.Adapter, NextSetupInstance.SessionContext,
      'next.rtc.events');
    View.AttachColumnLayout(LayoutPreferences);

    View.ConfigureFilters(Definition.FiltersDef, Preferences,
      'next.rtc.events');

    Result := View;
  except
    View.Free;
    raise;
  end;
end;

function CreateOperacoesFiscaisIbsCbsView(AParent: HWND): TfrmNextBase;
var
  View: TfrmOperacoesFiscaisIbsCbs;
  Preferences: ILocalPreferences;
  LayoutPreferences: IColumnLayoutPreferences;
  Definition: INextQueryDefinitionBase;
  Presenter: TPresenterConsultaBase;
begin
  Preferences := TWindowsRegistryLocalPreferences.Create;

  View := TfrmOperacoesFiscaisIbsCbs.CreateParented(AParent);
  try
    // A definicao pertence a esta tela e recebe o metodo que le a opcao do
    // checkbox: o estado e consultado a cada pesquisa, nao na abertura.
    Definition := TOperacoesFiscaisIbsCbsQueryDefinition.Create(
      NextSetupInstance.Resolve<ISqlDataSetReaderFactory>,
      NextSetupInstance.Resolve<IQueryResultOperations>,
      View.IsLixeiraSearch);

    // A tela e somente leitura: a pesquisa e autorizada pela consulta padrao,
    // sem acoes de cadastro associadas.
    Presenter := TPresenterConsultaBase.Create(
      NextSetupInstance.Resolve<IAuthorizationService>, 'MOD020',
      'OP_FISCAIS_IBSCBS');
    try
      View.AttachPresenter(Presenter, Definition,
        'Operações Fiscais IBS/CBS');
    except
      // Associacao recusada: a tela nao assumiu a posse.
      Presenter.Free;
      raise;
    end;

    // O repositorio e transiente: a composicao cede conexao/sessao do Setup e a
    // grade o mantem enquanto a tela existir. Layout e filtros usam a mesma
    // identidade estavel da tela.
    LayoutPreferences := TColumnLayoutPreferencesRepository.Create(
      NextSetupInstance.Adapter, NextSetupInstance.SessionContext,
      'next.operacoes.fiscais.ibscbs');
    View.AttachColumnLayout(LayoutPreferences);

    View.ConfigureFilters(Definition.FiltersDef, Preferences,
      'next.operacoes.fiscais.ibscbs');

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
  Definitions: INextQueryDefinition<TGrupoSelecionado>;
begin
  Preferences := TWindowsRegistryLocalPreferences.Create;

  View := TfrmGruposFiscais.CreateParented(AParent);
  try
    Definitions := NextSetupInstance.Resolve<INextQueryDefinition<TGrupoSelecionado>>;
    // O apresentador recebe a tela como view; as demais dependencias continuam
    // vindo do container do Setup. A mesma definicao e entregue a tela, que
    // permanece responsavel pelo resultado apresentado.
    Presenter := TGruposFiscaisPresenter.Create(View, Definitions,
      NextSetupInstance.Resolve<IAuthorizationService>,
      NextSetupInstance.Resolve<IRemoverGrupoFiscalUseCase>,
      NextSetupInstance.Resolve<ISalvarGrupoFiscalUseCase>,
      NextSetupInstance.Resolve<ListarEmpresasUseCase>,
      NextSetupInstance.Resolve<ObterGrupoFiscalPorIdUseCase>,
      NextSetupInstance.SessionContext);
    try
      View.AttachPresenter(Presenter, Definitions, 'Grupos Fiscais');
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
  FRegistry.Register('next.operacoes.fiscais.ibscbs',
    CreateOperacoesFiscaisIbsCbsView);
  FRegistry.Register('next.grupos.fiscais', CreateGruposFiscaisView);

finalization
  FRegistry.Free;

end.
