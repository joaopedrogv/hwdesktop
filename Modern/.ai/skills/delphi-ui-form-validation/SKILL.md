---
name: delphi-ui-form-validation
description: Integrate ValidationEntityOutput with Delphi forms using UIFormValidatorFactory, EntityMetadata, component bindings, hints, and validation reset behavior.
---

# Delphi UI Form Validation

## Purpose

Use this Skill to connect validation results returned by Modern Use Cases to
Delphi form components.

This Skill does not define business/entity validation rules. Those belong to the
entity validation mechanism and may be created with the `delphi-entity-validation` Skill.

This Skill handles the UI side:

```text
ValidationEntityOutput
↓
UIFormValidatorFactory
↓
field/component bindings
↓
IUIFormValidator
↓
hints/messages on the form
```

Project Rules remain authoritative, especially:

- `.ai/rules/coding-standards.md`
- `.ai/rules/delphi-compatibility.md`
- `.ai/rules/architecture.md`
- `.ai/rules/security.md`

Use `.ai/context/ui-integration.md` for the Modern/legacy UI boundary.

## Execution Profile

Default execution profile: `fast-routine` when the entity metadata, Use Case
validation output, target form, and component-to-attribute bindings are established.

Escalate to `balanced-work` when bindings are ambiguous, custom controls require
interpretation, or validation reset and success-flow integration cannot be derived
from the established form behavior. Do not invent entity validation rules in this
UI Skill.

## Core Pattern

A form that projects validation results normally:

1. obtains the entity's `EntityMetadata`;
2. creates a UI validator through `UIFormValidatorFactory`;
3. builds it with metadata and the form action/control associated with validation;
4. binds entity attributes to form components;
5. stores the resulting `IUIFormValidator`;
6. passes `ValidationEntityOutput` to it after a Use Case returns an invalid result;
7. resets validation state when the form state changes.

## Creating the UI Validator

Typical pattern:

```delphi
FFormValidator := UIFormValidatorFactory.Create()
  .Builder(Meta, <ActionControl>)
  .Bind(...)
  .Validator();
```

Use the metadata instance corresponding to the entity being edited.

Do not construct a separate set of friendly field names in the form when the
metadata already defines them.

## Component Binding

Use the simplest binding supported by the component.

When the UI validator can infer the entity field from the component, use:

```delphi
.Bind(Component)
```

Examples include standard input controls whose existing metadata/binding
conventions are sufficient.

When inference is not sufficient, bind explicitly with the entity attribute:

```delphi
.Bind(
  Meta.Attribute['<AttributeName>'],
  Component
)
```

Use explicit attribute binding for:

- list controls;
- frames;
- composite/custom controls;
- fields whose component name does not reliably identify the entity attribute;
- any ambiguous mapping.

Do not guess an attribute/component relationship when it cannot be established
from metadata or nearby form code.

## Use Case Result Integration

When a Use Case output contains `ValidationEntityOutput`, check it before
continuing the successful UI flow.

Typical pattern:

```delphi
if not Result.Validation.IsValid then
  FFormValidator.Validate(Result.Validation)
else
begin
  // success flow
end;
```

Do not duplicate entity validation rules in the form.

Do not convert validation failures into exceptions merely to display them.

## Resetting UI Validation

Call:

```delphi
FFormValidator.Reset();
```

when the form transitions to a state where previous validation markers/hints are
no longer valid, such as loading another entity or clearing/reinitializing input.

Reset only the UI projection state; entity validation remains the responsibility
of the Use Case/validation factory.

## Metadata Role

`EntityMetadata` connects validation attribute names to UI-friendly field displays.

Use metadata consistently across:

- entity validation;
- Use Case validation output;
- UI form validation;
- dataset/grid field configuration when applicable.

Do not create parallel labels or field identifiers without a specific UI-only need.

## Form Boundaries

This Skill may be used by:

- forms inherited from legacy `TfrmCadPadraoM`;
- Modern forms not based on that legacy form;
- forms that use `TDataSetGrid`;
- forms that do not require grid data.

The validation integration pattern is independent of whether the complete form
can be generated automatically.

Do not refactor legacy base forms or validation infrastructure as part of applying
this Skill.

## Placement and Dependencies

Use the existing Modern UI infrastructure, including:

```text
UIFormValidatorFactoryUnit
IUIFormValidatorUnit
EntityMetadataUnit
```

plus the metadata unit for the entity.

Add only units required by the generated/modified code.

## Generation Procedure

When adding UI validation to a form:

1. Identify the entity edited/created by the form.
2. Identify the Use Case result that contains `ValidationEntityOutput`.
3. Obtain the entity's `EntityMetadata`.
4. Create/store an `IUIFormValidator` field when the form does not already have one.
5. Build the validator through `UIFormValidatorFactory`.
6. Bind each relevant entity attribute to its UI component.
7. Prefer implicit `.Bind(Component)` only when the mapping is established.
8. Use explicit metadata attribute binding for ambiguous/custom controls.
9. On invalid Use Case output, call `Validate(...)`.
10. Preserve the existing success flow when validation is valid.
11. Call `Reset()` when prior validation UI state becomes stale.
12. Do not move business validation logic into event handlers.

## Reference

See:

- `references/form-integration-example.md`
