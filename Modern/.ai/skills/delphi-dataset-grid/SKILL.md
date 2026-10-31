---
name: delphi-dataset-grid
description: Create or extend Modern UI dataset classes that inherit from TDataSetGrid for grid-oriented database queries, filtering, field configuration, display conversion, and related UI infrastructure.
---

# Delphi DataSet Grid

## Purpose

Use this Skill to create or extend a `TDataSetGrid` descendant under:

`UI/Datasets/<MicroContext>/`

The generated class provides the data/query layer used by UI grids.

Project Rules remain authoritative, especially:

- `.ai/rules/coding-standards.md`
- `.ai/rules/delphi-compatibility.md`
- `.ai/rules/database.md`
- `.ai/rules/architecture.md`

Use `.ai/context/ui-integration.md` for the relationship between Modern UI code and the legacy ERP infrastructure.

## Execution Profile

Default execution profile: `fast-routine` when the grid read model, SQL projection,
filters, displayed fields, and nearby pattern are already established and the task
is a direct implementation of them.

Escalate to `balanced-work` when query semantics, joins, custom filter translation,
ownership, audit behavior, or UI boundaries require local design decisions. Do not
use this Skill to decide business or persistence behavior that belongs outside the
grid read model.

## Core Structure

A dataset class normally:

1. inherits from `TDataSetGrid`;
2. configures its base dataset/table identity in `Create`;
3. defines the base query through `SQLMaker.Build`;
4. exposes a `Setup` method that configures fields and executes the query.

Example shape:

```delphi
T<Entity>DataSet = class(TDataSetGrid)
public
  constructor Create();
  procedure Setup(...);
end;
```

Do not assume every dataset requires the same `Setup` signature or the same extension methods.

## Encapsulation and Initialization

`TDataSetGrid` is the UI read-model boundary over `TDataSet_OOP`. Prefer its
existing operations, including inherited ones, before accessing the encapsulated
`TClientDataSet` directly. `RunSQLMaker` executes the configured query and filters;
`ClientOpen(SQL)` handles an explicit SQL opening through the inherited API.
Do not repeat `dataSet.CommandText := ...; dataSet.Open` when `ClientOpen` fits.
Raw dataset/datasource access remains valid for established VCL grid and filter
bindings; this is not a requirement to add wrappers for every property.

`CreateFieldsBySQL` / `AssignAndCreateFieldsFrom` prepare field structure. They do
not apply all field presentation settings. `ConfigFields` stores a clone of the
builder list; the builder remains reference-counted and owned by its caller.
The existing `dataSetDBAfterOpen` callback applies configured labels, masks, tags
and field visibility when the client dataset opens. Complete this lifecycle before
passing the fields to `FiltroGrid.FillForm`. Do not compensate for an unopened or
unconfigured dataset by repeating individual field assignments.

When initialization must expose configured fields without reading business rows,
use the approved empty projection through `ClientOpen`, or the established empty
SQLMaker filter followed by `RunSQLMaker`. Preserve the authorization boundary;
do not replace an empty initialization query with an unrestricted read.

Keep the established dataset name when refactoring: `GetSavedGrid` uses it together
with the user to locate saved column preferences. The dataset synchronizes those
preferences through `ReorderAndSync`; `SetupDataSetGrid` connects the grid and
prepares legacy support; `ApplyToDBGrid` applies the final columns. These are
different responsibilities, not interchangeable fallback calls.

## Constructor and Base Query

Call the inherited constructor with the dataset identifier and primary table:

```delphi
inherited Create('<DATASET_ID>', '<TABLE_NAME>');
```

Build the base query with `SQLMaker.Build`.

The query may include:

- explicit selected columns;
- joins;
- derived/subquery columns;
- base conditions;
- grouping when required;
- ordering.

Keep the SQL specific to the grid's read model. Do not force this query into a domain repository merely because it reads database data.

## `Setup`

`Setup` is context-specific.

For simple datasets that use metadata, prefer:

```delphi
procedure Setup(
  const Builder: IFieldsConfigBuilder;
  Meta: EntityMetadata
);
```

For datasets whose field configuration cannot yet or should not be derived from metadata, a reduced or specialized signature is valid.

Do not add `EntityMetadata` merely for uniformity when the dataset does not use it.

A typical setup flow is:

```text
ConfigFields(...)
↓
configure standard filters when needed
↓
SQLMaker.GetSQL
↓
CreateFieldsBySQL
↓
optional selection/calculated fields
↓
RunSQLMaker
```

Preserve ownership semantics of objects passed into `Setup`; do not assume the dataset owns the supplied builder unless the existing API establishes that ownership.

## Field Configuration

Use `IFieldsConfigBuilder` to configure grid fields.

When `EntityMetadata` is available, prefer deriving column/display pairs from metadata:

```delphi
Builder.AddPair(
  Meta.GetPairColumnAndDisplay('<COLUMN>')
)
```

Use explicit `.Add(...)` when metadata cannot express the required UI field, including:

- calculated/derived query columns;
- hidden technical fields;
- display-only aliases;
- custom display labels;
- masks/formats;
- custom `GetText` handlers;
- fields not represented by entity metadata.

Use `ReorderAndSync(Self.GetSavedGrid().List)` when the dataset must preserve the user's saved grid organization.

Do not invent metadata mappings for query-only fields. An attribute registered
through RegisterAttributeOnly has no physical column; do not project it as one.

### Visibility and Filter Exposure

Hidden technical UUID/GUID IDs and the internal ATIVO status are normally configured
with `fvInvisivel` when present in this grid. This is a presentation convention,
not automatic inference from a name, SQL CHAR(36), or data type; preserve justified
exceptions and displayed identifiers such as SEQID.

`FieldConfigModel.GetTag` maps `fvInvisivel` to Tag=1. The normal AfterOpen applies
that tag; `FillForm` with `Displays=nil` excludes Tag=1 fields. Do not reaffirm
`FieldByName(...).Tag := 1` after this contract has already applied merely as a
defensive guarantee. `Visible=False` alone does not exclude a field from filtering:
`fvInvisivelConfiguravel` uses Tag=3 and remains eligible for the standard frame.

## Filters

Standard UI filters are represented by `TFilterProps` / `TFilterPropsList` and consumed through `SQLMaker.FilterMk`.

Use the standard filtering mechanism whenever it can express the required query.

Configure default/internal filters through `SQLMaker.FilterMk`, for example when a dataset needs an initial restriction.

Use `HandleFilterField` when the dataset must expose a restricted or customized set of filter conditions for a specific field.

Example:

```delphi
procedure T<Entity>DataSet.HandleFilterField(
  const Field: TFilterProps;
  var CondSet: FilterConditionEnumSet
);
begin
  if Field.field = '<FIELD>' then
    CondSet := [feEquals, feBetween];
end;
```

Do not override filtering behavior when the standard mechanism is sufficient.

`FillForm` prepares the eligible fields and selects the current field. The frame
chooses the normal operators by type; `GetFiltros` handles Todos, validates the
current filter and returns its filter copies. Configure an explicit Displays list
only when the feature actually needs that alternative selection.

Do not enumerate operators, reproduce frame validation or add an empty
`HandleFilterField` / event binding solely to match a reference form. Bind
`OnFieldChange` only when a real customization is needed.


## Custom SQL Filter Translation

Override `RunSQLMaker` only when a UI filter cannot be represented correctly by the standard SQL generated by `TSqlMaker`.

A custom override may:

1. inspect `SQLMaker.FilterMk.Items`;
2. validate/normalize a special filter;
3. translate it into custom SQL semantics;
4. remove or replace the original generic filter;
5. delegate execution back to the inherited/default dataset behavior.

Keep custom filter translation narrowly scoped to the field that requires it.

Use project validation exceptions for invalid user-provided filter values according to `.ai/rules/coding-standards.md`.

## Display Conversion

Add a `TField.GetText` handler only when raw database values need UI-specific display conversion.

Typical uses include:

- enums stored as numeric values;
- aggregated values that need display normalization;
- technical values requiring UI-friendly text.

Do not add display conversion to the SQL or domain model when it is strictly a grid presentation concern.

Field descriptions for enums may use the existing UI display arrays/services defined by the corresponding microcontext.

## Selection and Calculated Fields

Use inherited `TDataSetGrid` capabilities such as selection/calculated fields only when the target grid requires them.

Do not add a selection field by default merely because other datasets contain one.

## Audit Integration

`TDataSetGrid.GetAuditorFill` is virtual and optional for a query-only dataset.
The base implementation raises an exception only when the method is invoked;
creating or using a dataset for ordinary grid reads does not require an override.
Do not add a dummy implementation solely to satisfy a template.

When consumers need GetAuditorFill, provide a meaningful override or inherit one
from an appropriate intermediate class. Reuse the inherited Auditor reference and
preserve the established process, key and description contract. Do not create or
free that borrowed auditor, return nil/an unprepared auditor, or suppress the
base exception so a protected operation can continue.

Adding this capability does not authorize inventing MOD identifiers, introducing
audit calls into a form, or moving protected-action checks into the dataset. If
an audited flow lacks the required context, report that gap instead of fabricating
a permissive or no-op implementation. Preserve existing valid overrides and callers.

## Extension Points

Treat these as optional extension points, not mandatory members:

- `GetText`
- `GetAuditorFill` when consumers need the filled audit context
- `HandleFilterField`
- `RunSQLMaker`
- selection/calculated field creation
- metadata-based field configuration
- custom setup parameters

Add only the extension points required by the target grid.

## Dependencies

Use only units required by the generated implementation.

Common dependencies may include:

```text
DataSetGrid
DB
uDataSet_OOP
FieldsConfigUnit
hw_audit_utils
hw_filters
EntityMetadataUnit
```

Do not copy the complete `uses` list from another dataset without verifying which types are actually referenced.

Legacy units may be consumed as dependencies, but Modern coding conventions do not govern their source code.

## Placement and Naming

Place the unit under:

`UI/Datasets/<MicroContext>/`

Name the type and unit according to `.ai/rules/coding-standards.md`.

Typical shape:

```text
Type: TNotasVinculadasDataSet
Unit: NotasVinculadasDataSet.pas
```

Use the microcontext that owns the grid/query responsibility.

## Generation Procedure

When creating a dataset:

1. Inspect one or more existing datasets from the same or nearest microcontext.
2. Identify the primary table and required grid read model.
3. Define the SQL projection explicitly.
4. Determine whether `EntityMetadata` can configure the required fields.
5. Define the minimum `Setup` signature required.
6. Configure fields through `IFieldsConfigBuilder`.
7. Use standard `SQLMaker.FilterMk` filtering when sufficient.
8. Add only necessary extension points.
9. Build fields from the final SQL.
10. Open through RunSQLMaker or inherited ClientOpen as appropriate; complete the
    normal field-configuration lifecycle before filter initialization.
11. Add GetAuditorFill only if an audited consumer needs it; otherwise keep the
    base behavior. Verify builder ownership and saved-grid identity; avoid
    duplicate Tag assignments and empty filter callbacks.
12. Leave form layout and component positioning to the form implementation/developer.

Do not refactor legacy UI/data-access infrastructure as part of dataset generation.

## References

See:

- `references/simple-example.md`
- `references/extended-example.md`
