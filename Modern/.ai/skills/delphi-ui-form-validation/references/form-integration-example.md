# Form Validation Integration Example

The binding initialization stays in the concrete form because it knows the
controls and entity metadata. This applies with or without a Presenter.

## Concrete Form Initialization

```delphi
FFormValidator := UIFormValidatorFactory.Create()
  .Builder(Meta, BitBtn4)
  .Bind(edCST)
  .Bind(edDescricao)
  .Bind(Meta.Attribute['EmpresasId'], CheckListBoxEmpresasFrame1)
  .Validator();
```

The component names illustrate implicit and explicit bindings; use only controls
and metadata verified for the target screen. TModernCadastroForm already provides
FFormValidator: initialize that field instead of shadowing it.

## MVP Result Projection

In a Presenter with an injected Use Case, consume its output and route invalid
validation through the View contract:

```delphi
resultado := FSalvarUseCase.Executar(AAjuste);
try
  if not resultado.Validation.IsValid then
    FView.ExibirValidacoes(resultado.Validation)
  else
    Result := True;
finally
  resultado.Free;
end;
```

This fragment belongs inside the operation's established result/error handling;
it is not a complete method. Initialize any success flag to False before execution.
Do not free a real reference-counted Use Case interface.

The presentation contract can be IViewFeedback itself, or a feature View extending
it when additional presentation behavior is required. A TModernCadastroForm
descendant reuses the base's ExibirValidacoes implementation, which calls
FFormValidator.Validate. Do not copy that method into each concrete form or create
an empty feature interface solely for this validation path.

The form's success branch preserves its permission/audit boundary, inherited
completion, and refresh. Invalid validation must not run that branch.

## Other Existing Forms

When an existing direct-form integration is outside the requested adaptation
scope, it may continue to call FFormValidator.Validate after checking its Use Case
result. Do not create a second validation mechanism or require an unrelated MVP
migration.

## Reset

```delphi
FFormValidator.Reset();
```

Reset when changing the edited entity or reinitializing input. This clears visual
validation state, not business rules.

Source reference: UI/Forms/RedBenefPC/UCadAjustesRedBenefPC.pas and its Presenter,
with responsibility/ownership guidance in .ai/context/ui-integration.md.
