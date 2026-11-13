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
  HwNextValidationSecondFormUnit, QueryStandardForm, QueryResultForm,
  EventosRtcForm, EventosRtcDefinition, GruposFiscaisForm,
  GruposFiscaisDefinition, LocalPreferences,
  WindowsRegistryLocalPreferences, StandardQueryFilterDefinition,
  QueryPreviewReader, QueryResultOperations, GridColumnDefinition,
  NextSetup, EventosRtcPresenter, GruposFiscaisPresenter, IDataSetReaderUnit;

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
  View: TfrmQueryResult;
  Preferences: ILocalPreferences;
  Reader: IDataSetReader;
  Operations: IQueryResultOperations;
begin
  View := TfrmQueryResult.CreateParented(AParent);
  try
    // A prévia recebe a definição de exemplo e o adaptador de preferências. A
    // identidade é dedicada a esta entrada e não é compartilhada com telas de
    // produto. A interface é contada por referência e o frame a mantém viva.
    Preferences := TWindowsRegistryLocalPreferences.Create;

    // A entrada apresenta o conjunto de prévia e habilita o filtro rápido sobre
    // o resultado carregado. Não há coluna de marcação nesta tela: o campo
    // 'sel' do leitor de exemplo permanece fora das colunas da grade.
    Reader := TQueryPreviewReader.Create('');
    Operations := TQueryResultOperations.Create(Reader, '',
      NextSetupInstance.DataSetSorter);
    View.Attach(Reader, GridColumns([
      GridColumn('documento', 'Documento', 120),
      GridColumn('descricao', 'Descri'#231#227'o', 220),
      GridColumn('codigo', 'C'#243'digo', 90, qcaRight),
      GridColumn('valor', 'Valor', 110, qcaRight),
      GridColumn('data', 'Data', 110, qcaCenter)
    ]), 'Consulta Next', Operations, True);
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
    // seguem os campos criados pelo leitor de previa e o Setup fornece o
    // ordenador usado pela grade.
    Reader := TQueryPreviewReader.Create('sel');
    Operations := TQueryResultOperations.Create(Reader, 'sel',
      NextSetupInstance.DataSetSorter);
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
      Operations := TQueryResultOperations.Create(nil, '',
        NextSetupInstance.DataSetSorter);
      View.AttachPresenter(Presenter, CreateEventosRtcColumns, 'Eventos RTC',
        Operations);
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

function CreateGruposFiscaisView(AParent: HWND): TfrmNextBase;
var
  View: TfrmGruposFiscais;
  Preferences: ILocalPreferences;
  Presenter: TGruposFiscaisPresenter;
  Operations: IQueryResultOperations;
begin
  Preferences := TWindowsRegistryLocalPreferences.Create;

  View := TfrmGruposFiscais.CreateParented(AParent);
  try
    // A composicao resolve o apresentador do contexto atual. A tela o possui e
    // permanece responsavel pelo leitor e pelo conjunto retornado.
    Presenter := NextSetupInstance.Resolve<TGruposFiscaisPresenter>;
    try
      // Ordenacao no conjunto carregado, sem coluna de marcacao e sem filtro
      // rapido; a ordem inicial continua sendo a da consulta (SEQID).
      Operations := TQueryResultOperations.Create(nil, '',
        NextSetupInstance.DataSetSorter);
      View.AttachPresenter(Presenter, CreateGruposFiscaisColumns,
        'Grupos Fiscais', Operations);
    except
      // Associacao recusada: a tela nao assumiu a posse.
      Presenter.Free;
      raise;
    end;

    // A identidade da tela e tambem a identidade das preferencias de filtro,
    // seguindo o padrao do EventosRtc.
    View.ConfigureFilters(CreateGruposFiscaisFilters(), Preferences,
      'next.grupos.fiscais');

    Result := View;
  except
    View.Free;
    raise;
  end;
end;

initialization
  FRegistry := TNextViewRegistry.Create;
  FRegistry.Register('next.validation', CreateValidationView);
  FRegistry.Register('next.validation.second', CreateValidationSecondView);
  FRegistry.Register('next.query.standard', CreateStandardQueryView);
  FRegistry.Register('next.rtc.events', CreateEventosRtcView);
  FRegistry.Register('next.grupos.fiscais', CreateGruposFiscaisView);

finalization
  FRegistry.Free;

end.
