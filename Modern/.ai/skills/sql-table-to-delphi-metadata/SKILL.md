---
name: sql-table-to-delphi-metadata
description: Generate a Delphi metadata class that maps an existing entity's attributes to a SQL CREATE TABLE definition using the project's EntityMetadata conventions.
---

# SQL Table to Delphi Metadata

## Purpose

Use this Skill to generate one Delphi metadata unit from:

1. one SQL `CREATE TABLE` statement; and
2. the existing Delphi entity class representing that table.

Project Rules remain authoritative, especially:

- `.ai/rules/coding-standards.md`
- `.ai/rules/delphi-compatibility.md`

If the entity must first be generated, use the `sql-table-to-delphi-entity` Skill first.

## Execution Profile

Default execution profile: `fast-routine` when the SQL table and existing entity
are complete, attribute-to-column relationships follow established normalization,
and authoritative labels or mechanically derivable friendly names are sufficient.

Escalate to `balanced-work` when relationships or business-friendly names require
semantic interpretation. Do not use escalation as permission to invent a mapping
that remains genuinely ambiguous.

## Metadata Naming

Derive the metadata class from the entity type:

1. remove the leading `T` when determining the semantic base name;
2. remove trailing `Etd` when present;
3. append `Metadata`;
4. apply project class naming conventions.

Examples:

- `TNFSeEtd` → `TNFSeMetadata`
- `TProdutoEtd` → `TProdutoMetadata`

The unit/file name omits the leading `T`:

- `TNFSeMetadata` → `NFSeMetadataUnit.pas`
- `TProdutoMetadata` → `ProdutoMetadataUnit.pas`

## Required Dependency

Include `EntityMetadataUnit` and use the existing project type `EntityMetadata`.

## Metadata Class Structure

Generate one class containing only:

```delphi
class function GetMetadata: EntityMetadata; static;
```

## `EntityMetadata`

Create the metadata instance with both known values:

```delphi
EntityMetadata.Create(<FriendlyTableName>, <TableName>)
```

The constructor signature is:

```text
(FriendlyTableName, TableName: string = '')
```

`EntityMetadata` provides:

```delphi
RegisterField(AttributeName, ColumnName, FriendlyName)
RegisterAttributeOnly(AttributeName, FriendlyName)
RegisterColumnOnly(ColumnName, FriendlyName)
```

## Attribute-to-Column Matching

Match primarily by normalized naming:

```text
PascalCase attribute ↔ UPPER_SNAKE_CASE column
```

Examples:

- `Id` ↔ `ID`
- `DataEmissao` ↔ `DATA_EMISSAO`
- `ClienteId` ↔ `CLIENTE_ID`

When naming normalization is insufficient, use semantic meaning and available project context to resolve an obvious relationship.

Do not create a mapping when the relationship is genuinely ambiguous.

## Registration Order

Generate registrations in this exact order:

1. linked attributes and columns;
2. entity attributes without table columns;
3. table columns without entity attributes.

### Linked

Use `RegisterField` and preserve entity attribute order.

### Attribute Only

Use `RegisterAttributeOnly` and preserve entity attribute order.

### Column Only

Use `RegisterColumnOnly` and preserve SQL column order.

## Friendly Names

Generate concise Brazilian Portuguese friendly names when no authoritative label is supplied.

Use business meaning rather than mechanical word splitting when needed.

Examples:

- `NFSE` → `NFSe`
- `DATA_EMISSAO` → `Data de emissão`
- `OpInterna` → `Operação Interna`

Do not invent unsupported business semantics.

## Unit Structure

Generate:

```delphi
unit <MetadataBaseName>Unit;

interface

uses
  Classes,
  SysUtils,
  EntityMetadataUnit;

type
  T<MetadataBaseName> = class
  public
    class function GetMetadata: EntityMetadata; static;
  end;

implementation

{ T<MetadataBaseName> }

class function T<MetadataBaseName>.GetMetadata: EntityMetadata;
begin
  Result := EntityMetadata.Create('<FriendlyTableName>', '<TABLE_NAME>');

  // Atributos vinculados

  // Atributos sem vinculo com a tabela

  // Campos da tabela sem vinculo com a classe
end;

end.
```

Keep these three section comments because they identify the established metadata registration groups.

Do not invent attributes or SQL columns.

## Reference Example

See `references/generation-example.md`.
