unit HwNextViewCatalogUnit;

interface

uses
  Winapi.Windows, HwNextBaseFormUnit;

// Generic entry point used by the exports unit. The registry and the concrete
// screens are intentionally not exposed here.
function NextViewCreate(const AIdentifier: string; AParent: HWND): TfrmHwNextBase;

implementation

uses
  HwNextViewRegistryUnit, HwNextValidationFormUnit, HwNextValidationSecondFormUnit;

var
  FRegistry: THwNextViewRegistry;

function CreateValidationView(AParent: HWND): TfrmHwNextBase;
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

function CreateValidationSecondView(AParent: HWND): TfrmHwNextBase;
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

function NextViewCreate(const AIdentifier: string;
  AParent: HWND): TfrmHwNextBase;
begin
  Result := FRegistry.CreateView(AIdentifier, AParent);
end;

initialization
  FRegistry := THwNextViewRegistry.Create;
  FRegistry.Register('next.validation', CreateValidationView);
  FRegistry.Register('next.validation.second', CreateValidationSecondView);

finalization
  FRegistry.Free;

end.
