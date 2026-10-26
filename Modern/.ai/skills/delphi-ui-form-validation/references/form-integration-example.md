# Form Validation Integration Example

The following pattern is based on an existing Modern form.

## Form Initialization

```delphi
procedure TFrmCadRegrasRedBenefPC.FormCreate(Sender: TObject);
var
  Meta: EntityMetadata;
begin
  Meta := RegraRedBenefPcMetadata.GetMetadata();

  FFormValidator := UIFormValidatorFactory.Create()
    .Builder(Meta, BitBtn4)
    .Bind(edCST)
    .Bind(edDescricao)
    .Bind(edPercReducao)
    .Bind(edIndAjusteEFD)
    .Bind(edCodAjusteEFD)
    .Bind(edDescricaoAjusteEFD)
    .Bind(edInfComplementarAjusteEFD)
    .Bind(edCodContaContabil)
    .Bind(Meta.Attribute['NaturezasReceita'], lbxNaturezasReceita)
    .Bind(Meta.Attribute['RestricoesNcm'], lbxRestricoesNcm)
    .Bind(edInicioVigencia)
    .Bind(edFimVigencia)
    .Bind(Meta.Attribute['EmpresasId'], CheckListBoxEmpresasFrame1)
    .Validator();
end;
```

This example shows both:

- implicit component binding; and
- explicit metadata attribute binding for list/custom controls.

## Use Case Result

```delphi
createResult := Container.GetInstance()
  .ErpFeaturesFactory
  .CreateSalvarRegraRedBenefPcUseCase()
  .Executar(FState);

if not createResult.Validation.IsValid then
  FFormValidator.Validate(createResult.Validation)
else
begin
  // existing success flow
end;
```

The form consumes validation output; it does not reproduce the entity's business
validation rules.

## Reset

When the form changes to a state where old validation hints are no longer valid:

```delphi
FFormValidator.Reset();
```
