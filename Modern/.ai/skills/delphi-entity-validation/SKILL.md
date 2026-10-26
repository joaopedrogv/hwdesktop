---
name: delphi-entity-validation
description: Create or extend Delphi entity validation factories using IEntityValidator, EntityValidatorFactory, EntityMetadata, and ValidationEntityOutput conventions.
---

# Delphi Entity Validation

## Purpose

Use this Skill to create or extend validation factories for Modern entities.

The validation factory builds an `IEntityValidator` for an entity and returns
validation results that can be consumed by Use Cases and later projected to the UI.

Project Rules remain authoritative, especially:

- `.ai/rules/coding-standards.md`
- `.ai/rules/delphi-compatibility.md`
- `.ai/rules/architecture.md`

Use the entity's metadata when available so validation items can resolve friendly
field names through `ValidationEntityOutput`.

## Execution Profile

Default execution profile: `fast-routine` when validation requirements and
operation scenarios are already specified or approved and the work consists of
expressing them through established validation APIs and nearby patterns.

Escalate to `balanced-work` when rules must be interpreted, operation-specific or
cross-field behavior is not fully defined, or the boundary between validation and
domain/application behavior requires judgment. This Skill must not invent business
rules under either profile.

## Core Pattern

A simple validation factory normally:

1. receives an entity;
2. creates an `IEntityValidator` using `EntityValidatorFactory.Builder(...)`;
3. passes the entity's `EntityMetadata`;
4. declares field validations;
5. adds cross-field/custom validation items when needed;
6. returns the validator.

Typical shape:

```delphi
T<Entity>ValidacaoFactory = class
public
  class function Build(
    const Entity: <EntityType>
  ): IEntityValidator;
end;
```

Do not assume every entity has only one validation entry point.

## Creating the Validator

Prefer:

```delphi
Result := EntityValidatorFactory.Builder(
  T<Entity>Metadata.GetMetadata()
);
```

when metadata exists for the entity.

Metadata allows `ValidationEntityOutput` to resolve the friendly display name
associated with a validated attribute.

Do not duplicate friendly labels inside validation rules when metadata already
provides the intended display name.

## Field Validation

Use the most appropriate `IEntityValidator` method for the field type.

Available patterns include:

```delphi
Field(...)
FieldD(...)
FieldDT(...)
FieldEnum(...)
```

Then chain the validators exposed by the returned field validator.

Examples of established operations include:

```delphi
.IsRequired()
.IsIn(...)
.HasMinValue(...)
.HasMaxValue(...)
.HasSize(...)
.HasToBeGreaterThan(...)
.HasToBeGreaterOrEqualsThan(...)
```

Use only validation methods actually available from the project's validator interfaces.

## Custom and Cross-Field Validation

When a rule cannot be expressed by a single field validator, add a validation
item explicitly:

```delphi
Result.Add('<AttributeName>', '<Message>');
```

or:

```delphi
Result.Add(
  ValidationEntityItem.Create(
    '<AttributeName>',
    '<Message>'
  )
);
```

Associate the problem with the entity attribute that best represents the
validation failure so metadata/UI integration can resolve the correct friendly name.

Validation messages intended for users MUST follow the project's language and
exception/message conventions.

## Nil Entities

When a validation entry point may receive `nil`, handle that state explicitly
before dereferencing the entity.

Add an appropriate validation result and exit or continue only when the operation's
validation semantics require it.

Do not assume all validation factories receive non-nil entities.

## Multiple Validation Scenarios

A complex entity may require different validation sets for different operations.

Use separate public build methods when validation requirements differ by operation,
for example:

```delphi
BuildSalvarRascunho(...)
BuildEmitir(...)
BuildCancelar(...)
```

Extract common rules into a private shared builder when appropriate:

```delphi
class function BuildComum(...): IEntityValidator;
```

Use private helper procedures/functions for reusable conditional rule groups.

Do not force unrelated operation-specific rules into one universal `Build`.

## Conditional Rules

Validation may depend on:

- entity state;
- enum/status values;
- nullable values;
- related/nested entities;
- combinations of multiple fields;
- business-operation mode.

Keep those decisions in the validation factory when they are validation concerns.

When a condition represents reusable business behavior beyond validation, follow
the architectural rules and use an appropriate domain/application service instead
of duplicating that behavior here.

## Validation Output

`IEntityValidator.Result()` returns `ValidationEntityOutput`.

`ValidationEntityOutput`:

- contains zero or more `ValidationEntityItem` values;
- exposes `IsValid()`;
- uses `EntityMetadata` to resolve friendly attribute displays when available.

Do not create a second validation-result format when the existing output satisfies
the Use Case requirement.

## Use Case Integration

A Use Case that validates entity input typically:

```text
build validator
↓
check IsValid
↓
return ValidationEntityOutput when invalid
↓
continue operation when valid
```

Use the existing Use Case output model when one already represents both successful
output and validation failure.

Do not embed UI behavior in the validation factory or Use Case.

## Placement and Naming

Place validation factories in the architectural area already used by the target
microcontext.

Follow the nearest established module convention for naming and placement.

Use project naming rules for new types and units.

Do not rename existing validation types merely to enforce a newer convention.

## Generation Procedure

When creating or extending validation:

1. Inspect the entity and its metadata.
2. Inspect the Use Case(s) that consume the validation.
3. Identify operation-specific and shared validation rules.
4. Choose a single `Build` or multiple operation-specific build methods.
5. Create the validator from the entity metadata.
6. Add field validators using the appropriate typed API.
7. Add explicit validation items for cross-field/custom rules.
8. Associate custom failures with the most relevant entity attribute.
9. Preserve existing validation output conventions.
10. Keep UI projection outside this Skill.

## References

See:

- `references/simple-example.md`
- `references/extended-example.md`
