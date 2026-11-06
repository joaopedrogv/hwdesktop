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
  HwNextValidationSecondFormUnit, QueryStandardForm,
  NextSetup, EventosRtcQuery, EventosRtcForm;

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
begin
  View := TfrmHwNextValidationSecond.CreateParented(AParent);
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
begin
  View := TfrmQueryStandard.CreateParented(AParent);
  try
    // Composition point. The form owns its frame and empty DataSource; this
    // visual slice injects nothing else.
    Result := View;
  except
    View.Free;
    raise;
  end;
end;

function CreateEventosRtcView(AParent: HWND): TfrmNextBase;
var
  View: TfrmEventosRtc;
  Query: TEventosRtcQuery;
begin
  if (not NextSetupInstance.HasContext) or
    (NextSetupInstance.Connection = nil) then
    raise Exception.Create('O contexto da empresa nao foi informado.');

  NextSetupInstance.AcquireContext;
  try
    Query := TEventosRtcQuery.Create(NextSetupInstance.Connection,
      NextSetupInstance.CompanyCode);
    try
      View := TfrmEventosRtc.CreateParented(AParent);
      try
        View.Attach(Query, NextSetupInstance);
        Query := nil; // a propriedade foi transferida para a tela
        Result := View;
      except
        View.Free;
        raise;
      end;
    finally
      Query.Free;
    end;
  except
    NextSetupInstance.ReleaseContext;
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
