# Cadastro Form Scaffold Reference

This reference illustrates the structure expected from a Modern form inherited
from the legacy `TfrmCadPadraoM`.

It is intentionally schematic. Feature-specific controls and event behavior are
not part of the scaffold contract.

## Pascal Structure

```delphi
unit CadExemploUnit;

interface

uses
  UCadPadraoModal,
  IUIFormValidatorUnit,
  EntityMetadataUnit,
  ExemploEtdUnit,
  ExemploMetadataUnit,
  ExemploDataSetUnit;

type
  TFrmCadExemplo = class(TfrmCadPadraoM)
  private
    FDataSet: TExemploDataSet;
    FFormValidator: IUIFormValidator;
    FState: TExemploEtd;

    procedure MapStateToForm();
    procedure MapFormToState();
  public
    procedure FormCreate(Sender: TObject);
  end;

implementation

{ TFrmCadExemplo }

procedure TFrmCadExemplo.FormCreate(Sender: TObject);
var
  Meta: EntityMetadata;
begin
  FDataSet := TExemploDataSet.Create();

  Meta := TExemploMetadata.GetMetadata();

  // Dataset/grid setup belongs to the dataset implementation.
  // UI validation should be wired using delphi-ui-form-validation.
end;

procedure TFrmCadExemplo.MapStateToForm();
begin
  // Map FState values to UI controls.
end;

procedure TFrmCadExemplo.MapFormToState();
begin
  // Map UI control values back to FState.
end;

end.
```

The exact `uses`, dataset setup, Use Case fields, audit integration, and event
handlers depend on the target microcontext and should be based on nearby Modern
forms.

## Minimal Inherited DFM Shape

```text
inherited FrmCadExemplo: TFrmCadExemplo
  Caption = 'Exemplo'
  inherited TabSheet1
    { add Cadastro controls here }
  end
  inherited TabSheet2
    { inherited Consulta/grid infrastructure remains available }
  end
end
```

The developer should refine:

- control types;
- field placement;
- coordinates;
- sizes;
- captions;
- tab order;
- feature-specific events.

The scaffold should not attempt to recreate or replace the functionality already
provided by `TfrmCadPadraoM`.
