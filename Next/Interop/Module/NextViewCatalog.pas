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
  EventosRtcForm, NextSetup, NextQueryDefinition, IDatabaseReaderUnit,
  ReaderContextLease, EventosRtcDefinition, LocalPreferences,
  WindowsRegistryLocalPreferences, StandardQueryFilterDefinition,
  QueryPreviewReader, QueryResultOperations, GridColumnDefinition;

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
  Reader: IDatabaseReader;
  Lease: IDatabaseReader;
  Definition: TNextQueryDefinition;
  ContextOwnedByComposition: Boolean;
begin
  if (not NextSetupInstance.HasContext) or
    (NextSetupInstance.Adapter = nil) then
    raise Exception.Create('O contexto da empresa nao foi informado.');

  NextSetupInstance.AcquireContext;
  ContextOwnedByComposition := True;
  Reader := nil;
  Lease := nil;
  try
    //Definition := CreateEventosRtcDefinition(NextSetupInstance.CompanyCode);
    Reader := NextSetupInstance.Adapter.CreateReader(
      Definition.Sql, Definition.Parameters);

    Lease := TReaderContextLease.Create(Reader,
      procedure
      begin
        NextSetupInstance.ReleaseContext;
      end);
    // A reserva passa a pertencer ao wrapper. A composicao nao a libera mais
    // diretamente a partir daqui.
    ContextOwnedByComposition := False;
    Reader := nil;

    View := TfrmEventosRtc.CreateParented(AParent);
    try
//      View.Attach(Lease, Definition.Columns, 'Eventos RTC');
      // A tela possui o wrapper e, com ele, o leitor e a reserva.
      Lease := nil;
      Result := View;
    except
      View.Free;
      raise;
    end;
  finally
    Reader := nil;
    if Lease <> nil then
      Lease := nil; // libera leitor interno/query/transacao e depois o contexto
    if ContextOwnedByComposition then
      NextSetupInstance.ReleaseContext;
  end;
end;

function CreateEventosRtcViewNovo(AParent: HWND): TfrmNextBase;
var
  View: TfrmEventosRtc;
  Leitor: IDatabaseReader;
  Operacoes: IQueryResultOperations;
  Preferences: ILocalPreferences;
  Reader: IDatabaseReader;
  Definition: TNextQueryDefinition;
begin
  var CampoMarcacao := 'SEL';
  Definition := CreateEventosRtcDefinition(1);

  Reader      := NextSetupInstance.Adapter.CreateReader(Definition.Sql, Definition.Parameters);
  Operacoes   := TQueryResultOperations.Create(Leitor, CampoMarcacao);
  Preferences := TWindowsRegistryLocalPreferences.Create;

  View := TfrmEventosRtc.CreateParented(AParent);
  try
    View.Attach(Reader, CreateEventosRtcColumns, 'Eventos RTC', Operacoes);

    View.ConfigureFilters(CreateEventosRtcFilters(), Preferences, 'next.rtc.events');

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
  FRegistry.Register('next.rtc.events', CreateEventosRtcViewNovo);

finalization
  FRegistry.Free;

end.
