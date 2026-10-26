# Extended Entity Validation Example

Complex entities may expose validation entry points for different operations.

Representative structure:

```delphi
TValidacaoNFSeFactory = class
private
  class function BuildComum(
    const Entity: TNFSeEtd
  ): IEntityValidator;

  class procedure BuildEmissaoPropria(
    const Entity: TNFSeEtd;
    Validador: IEntityValidator
  );
public
  class function BuildSalvarRascunho(
    const Entity: TNFSeEtd
  ): IEntityValidator;

  class function BuildEmitirNoWebService(
    const Entity: TNFSeEtd
  ): IEntityValidator;

  class function BuildEmitirNoPortal(
    const Entity: TNFSeEtd
  ): IEntityValidator;
end;
```

A shared builder can initialize metadata and common rules:

```delphi
Result := EntityValidatorFactory.Builder(
  TNFSeMetadata.GetMetadata()
);
```

Operation-specific methods can then add:

- status-dependent rules;
- conditional required fields;
- size/range validations;
- nested-entity validations;
- cross-field arithmetic rules;
- explicit `ValidationEntityItem` values.

When an entity may be `nil`, add a validation result before dereferencing it.

The important pattern is separation between common rules and operation-specific
rules rather than one large universal validator.
