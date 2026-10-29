---
name: delphi-record-encapsulation
description: Encapsulate an existing Delphi record by moving fields to private storage, exposing read-only properties, and adding a static Create factory while preserving the existing unit and project conventions.
---

# Delphi Record Encapsulation

## Purpose

Use this Skill to transform an existing simple Delphi record whose fields are declared directly in the record body into an encapsulated record with:

- private backing fields;
- read-only public properties;
- a static `Create` factory method.

Follow the root AGENTS.md and the affected area's Rules. Determine compatibility
from the actual source and consuming projects before applying the transformation.
For Modern files, also load Modern/AGENTS.md and its coding and compatibility Rules;
those conventions are not imposed on other directories.

Do not rename the existing record type merely to enforce a naming convention unless the task explicitly requires renaming it.

## Execution Profile

Default execution profile: `fast-routine` when the existing record matches this
Skill's input shape and the requested change is exactly the documented
encapsulation transformation.

Escalate to `balanced-work` when existing behavior, public compatibility, custom
types, or surrounding structure require interpretation beyond direct repository
inspection and this procedure.

## Input Shape

Apply this Skill when the target record:

- already exists;
- declares fields directly in the record body;
- does not already have an equivalent encapsulated structure.

Preserve the surrounding unit structure and unrelated code.

## Transformation

For each original field:

1. Move it to the `private` section.
2. Rename the backing field to `F<FieldName>`.
3. Add a public read-only property with the original field name and type.
4. Point the property to the corresponding private field.

Example:

```delphi
Serie: string;
```

becomes:

```delphi
private
  FSerie: string;
public
  property Serie: string read FSerie;
```

Preserve the original field order.

## `Create` Factory

Add a public static class function:

```delphi
class function Create(...): <RecordType>; static;
```

Create one parameter for each original field:

- parameter name: `A<FieldName>`;
- parameter order: identical to the original field order.

Use `const` for:

- `string`;
- record types;
- project types whose name ends with `Nullable`.

Do not use `const` for scalar or enum-like types such as:

- `Integer`;
- `Boolean`;
- `TDate`;
- enumerations.

When whether a project-defined type is a record affects `const` usage, inspect its declaration instead of guessing.

## Implementation

Implement `Create` in the unit `implementation` section.

Assign every parameter to the corresponding backing field on `Result`:

```delphi
Result.FSerie := ASerie;
```

Preserve the same order used in the record declaration and factory parameters.

Keep the Delphi structural comment convention immediately before the method implementation when that convention is used for the transformed record:

```delphi
{ ConfiguracaoNFSeModel }
```

This comment is a structural Delphi section marker, not an explanatory code comment.

## Preservation

- Preserve the existing `unit`, `interface`, `uses`, `type`, and `implementation` structure.
- Preserve unrelated declarations and implementations.
- Do not add unrelated methods, properties, comments, refactoring, or formatting changes.
- Do not rename the record type unless explicitly requested.
- Preserve existing compiler compatibility according to the affected source and project boundaries.

## Reference Example

See:

`references/transformation-example.md`
