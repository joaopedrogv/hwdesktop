---
name: sql-table-to-delphi-entity
description: Generate a Delphi entity class from a SQL CREATE TABLE definition using the project's entity, nullable, constructor, comparison, and typed-list conventions.
---

# SQL Table to Delphi Entity

## Purpose

Use this Skill to generate one Delphi unit representing a database entity from one SQL `CREATE TABLE` statement.

Project Rules remain authoritative, especially:

- `.ai/rules/coding-standards.md`
- `.ai/rules/delphi-compatibility.md`
- `.ai/rules/database.md`

## Execution Profile

Default execution profile: `fast-routine` when the `CREATE TABLE`, directives, and
required output are complete and every type follows a documented mapping or an
explicit override.

Escalate to `balanced-work` for unsupported or ambiguous SQL/custom types, naming
that cannot be resolved mechanically, or requested behavior beyond entity
generation. Schema design and changes to approved persistence contracts are not
decisions owned by this Skill.

## Input

The input MUST contain one `CREATE TABLE` statement.

Optional SQL directives:

- `--className=<Name>`
- `--Tipo=<TypeName>` at the end of a column line
- `--clonable`
- `--isequalto`

## Entity Naming

By default:

1. Convert the table name to singular.
2. Convert it to PascalCase.
3. Append `Etd`.
4. Apply the project type naming convention.

Examples:

- `DPS` → `TDPSEtd`
- `PRODUTOS` → `TProdutoEtd`

The unit/file name uses the type name without the leading `T`:

- `TDPSEtd` → `DPSEtdUnit.pas`
- `TProdutoEtd` → `ProdutoEtdUnit.pas`

### `--className=<Name>`

`--className` overrides the semantic name derived from the table.

Treat the directive value as the requested base class name, then apply the project type naming convention unless it already follows it.

Examples:

- `--className=ClienteModel` → `ClienteModel`
- `--className=TClienteModel` → `TClienteModel`

Use this directive only when the generated type must intentionally differ from the table-derived default.

## SQL to Delphi Type Mapping

Nullable SQL columns MUST use the project's nullable record types.

| SQL type | `NOT NULL` | Nullable | Required unit |
|---|---|---|---|
| `VARCHAR`, `CHAR` | `string` | `StringNullable` | `StringNullableUnit` |
| `SMALLINT` | `Smallint` | `IntegerNullable` | `IntegerNullableUnit` |
| `INTEGER` | `Integer` | `IntegerNullable` | `IntegerNullableUnit` |
| `BIGINT` | `Int64` | `Int64Nullable` | `Int64NullableUnit` |
| `NUMERIC`, `DECIMAL` | `Currency` | `CurrencyNullable` | `CurrencyNullableUnit` |
| `DOUBLE`, `FLOAT` | `Double` | `DoubleNullable` | `DoubleNullableUnit` |
| `TIMESTAMP` | `TDateTime` | `DateTimeNullable` | `DateAndTimeNullableUnit` |
| `DATE` | `TDateTime` | `DateNullable` | `DateAndTimeNullableUnit` |
| `BOOLEAN`, `BOOL` | `Boolean` | `BooleanNullable` | `BooleanNullableUnit` |

Do not add a nullable unit unless at least one generated property uses a type from it.

### Special Column: `ATIVO SMALLINT`

If the table contains `ATIVO SMALLINT`, use `StatusRegistroEnum` regardless of nullability and include `StatusRegistroEnumUnit`.

## Type Override: `--Tipo=<TypeName>`

When a column line ends with `--Tipo=<TypeName>`, use `<TypeName>` as the Delphi property type.

Add `<TypeName>Unit` to `uses`, except for:

- `TArrayString`
- `TArrayInteger`
- `YesNoEnum`
- `RecordInstance`

For those, include `TipoComunsUnit`.

Do not use `--Tipo=` for native Delphi types.

## Fields and Properties

Convert SQL column names from `UPPER_SNAKE_CASE` to PascalCase.

Examples:

- `TIPO_TRIBUTO` → `TipoTributo`
- `ID_USUARIO` → `IdUsuario`

Generate one private field and read/write property per column, preserving SQL column order.

## Constructors

Generate two overloaded constructors:

```delphi
constructor Create(); overload;
constructor Create(...); overload;
```

The parameterized constructor MUST:

- contain one parameter per property;
- preserve property order;
- use `A<PropertyName>` parameter names;
- place one parameter per line;
- call `Create();` before assigning fields.

Use `const` for:

- `string`;
- record types;
- project types ending with `Nullable`;
- dynamic arrays.

Do not use `const` for scalar values or enums.

When a custom type's category affects `const`, inspect its declaration instead of guessing.

The empty constructor MUST call `inherited Create;`.

## Optional Directive: `--clonable`

If present:

- inherit from the existing `EntityBase` class;
- include `EntityBaseUnit`;
- declare `function Clone(): EntityBase; override;`;
- implement `Clone` by creating a new instance with the current property values.

Preserve the existing project type name `EntityBase`.

## Optional Directive: `--isequalto`

If present, declare:

```delphi
function IsEqualTo(const Other: <EntityType>): Boolean;
```

Compare properties in original order.

- scalar, string, enum → `=`
- nullable records → `.IsEqualTo(...)`
- referenced entity classes with an established `IsEqualTo` → `.IsEqualTo(...)`

Inspect ambiguous custom types before choosing a comparison strategy.

## Typed Object List

Generate a typed `TObjectList` wrapper whose getter, setter, and `Items` property use the entity type, not the list type.

## Unit Dependencies

Include `Contnrs` because the generated typed list uses `TObjectList`.

Add other units only when required by the generated types or optional directives.

Preserve the structural Delphi comment before class implementations:

```delphi
{ TProdutoEtd }
```

Generate only the requested entity unit. Do not invent fields or reorder the SQL schema.

## Reference Example

See `references/generation-example.md`.
