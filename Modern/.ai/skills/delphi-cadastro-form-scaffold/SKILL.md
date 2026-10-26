---
name: delphi-cadastro-form-scaffold
description: Create a Modern Delphi cadastro-form scaffold inherited from the legacy TfrmCadPadraoM, wiring dataset, metadata, validation, Use Cases, mapping methods, and standard CRUD-oriented form flow while leaving feature-specific UI details to the developer.
---

# Delphi Cadastro Form Scaffold

## Purpose

Use this Skill to create the initial structure of a Modern cadastro form that
inherits from the legacy `TfrmCadPadraoM`.

The goal is to generate a consistent working scaffold, not a finished UI.

The developer remains responsible for:

- final component selection;
- visual layout and positioning;
- tab order;
- feature-specific events;
- unusual legacy behavior;
- feature-specific business interaction.

Project Rules remain authoritative, especially:

- `.ai/rules/coding-standards.md`
- `.ai/rules/delphi-compatibility.md`
- `.ai/rules/architecture.md`
- `.ai/rules/security.md`

Use `.ai/context/ui-integration.md` for the relationship between Modern UI code
and legacy ERP components.

Use these Skills when applicable:

- `delphi-dataset-grid`
- `delphi-ui-form-validation`

Do not duplicate their internal procedures in this Skill.

## Execution Profile

Default execution profile: `fast-routine` when the base form, microcontext, entity
or state, Use Cases, dataset, metadata, validation flow, and required scaffold
components are already established.

Escalate to `balanced-work` when selecting the form architecture, interpreting
unusual legacy behavior, defining non-standard interaction, or resolving audit,
authorization, state, and ownership decisions. The fast profile applies to the
scaffold, not to speculative completion of the feature UI.

## When to Use

Use this Skill when the new screen is a primary cadastro/query form that benefits
from the standard behavior already provided by `TfrmCadPadraoM`.

Typical inherited capabilities include:

- Consulta/Cadastro tabs;
- standard query area;
- grid infrastructure;
- include/edit/delete buttons;
- OK/Cancel/Exit controls;
- saved grid preferences;
- grid export and other legacy conveniences.

Do not use this Skill for every form.

For a small modal or specialized form that does not need the inherited cadastro
behavior, inspect nearby Modern forms and choose a simpler base form instead.

## Placement

Place new Modern cadastro forms under:

`UI/Forms/<MicroContext>/`

Use the microcontext that owns the UI responsibility.

Do not move or modify the legacy base form as part of scaffold generation.

## Legacy Base Form

The generated form inherits from:

```delphi
TfrmCadPadraoM
```

defined outside `Modern`.

The `.pas` unit therefore references the legacy unit required by the inherited form.

The `.dfm` MUST use Delphi inherited-form syntax:

```text
inherited <FormName>: T<FormType>
```

rather than:

```text
object <FormName>: T<FormType>
```

The legacy source is a dependency/evidence source only. Modern coding conventions
must not be retroactively applied to it.

## Scaffold Responsibilities

A typical cadastro-form scaffold may declare fields for:

- the `TDataSetGrid` descendant used by the Consulta grid;
- audit support obtained from the dataset when applicable;
- `IUIFormValidator`;
- the current entity/form state;
- other infrastructure already established by the microcontext.

Add only fields required by the target form.

Do not create infrastructure abstractions speculatively.

## `FormCreate`

`FormCreate` is the primary initialization point for the scaffold.

A typical flow is:

```text
create dataset
↓
obtain audit support when applicable
↓
create IFieldsConfigBuilder
↓
connect dataset to inherited grid
↓
obtain EntityMetadata
↓
run dataset Setup
↓
connect filter infrastructure when required
↓
build IUIFormValidator
↓
apply grid configuration
```

The exact sequence may vary when an existing form/microcontext requires it.

Do not duplicate dataset setup logic that belongs inside the `TDataSetGrid`
descendant.

Use the `delphi-dataset-grid` Skill when a new dataset class is required.

## Entity Metadata

When the form edits an entity that has metadata, obtain the corresponding
`EntityMetadata` instance and reuse it for:

- UI validation;
- dataset field configuration when applicable;
- field/attribute identification;
- friendly names.

Do not maintain an independent parallel map of entity field names unless the UI
has a specific presentation-only requirement.

## UI Validation

When the Use Case can return `ValidationEntityOutput`, integrate the form using
the `delphi-ui-form-validation` Skill.

The scaffold may therefore include:

```delphi
FFormValidator: IUIFormValidator;
```

and initialize it in `FormCreate`.

Do not copy entity validation rules into the form.

## Dataset and Grid

When the form's Consulta tab requires database data, use a `TDataSetGrid`
descendant from:

`UI/Datasets/<MicroContext>/`

The form should coordinate the dataset with the inherited grid, while SQL,
field setup, filters, display conversion, and dataset-specific behavior remain
inside the dataset class.

Do not move dataset SQL into form event handlers.

## Filter Integration

When the inherited query UI uses the standard legacy filter infrastructure,
connect the form/filter components to the dataset using the established
`TFilterFrame`, `TFilterFramePadrao`, `TFilterPropsList`, and `TSqlMaker`
integration exposed through `TDataSetGrid`.

Do not reimplement the legacy filter builder inside the form.

Use the filter mechanism already established by the inherited form and dataset.

## Form State

Prefer explicit mapping between UI components and the current entity/state.

Typical methods:

```delphi
procedure MapStateToForm();
procedure MapFormToState();
```

or equivalent names already established by the target microcontext.

### `MapStateToForm`

Use it to project the current entity/state into the form controls.

### `MapFormToState`

Use it to build/update the entity/state from user input before calling a Use Case.

Keep business calculations and decisions outside these mapping methods.

Do not make UI components themselves the domain state.

## Standard Actions

The scaffold may provide handlers for standard inherited actions when required:

- include/new;
- edit;
- delete;
- save/confirm;
- cancel;
- refresh/query.

These handlers should coordinate UI state and call the appropriate Use Cases.

They MUST NOT contain business rules that belong to the application/domain layer.

Use existing Use Cases when available rather than performing persistence directly
from the form.

## Save Flow

A typical save/confirm flow is:

```text
MapFormToState
↓
execute Use Case
↓
validation invalid?
    ├── yes → project validation to form
    └── no  → continue successful UI flow
↓
refresh dataset/grid when required
↓
update form state
```

Do not duplicate repository logic or entity validation inside the form.

## Audit

When audit support is required and available from the dataset, reuse the existing
legacy audit integration.

Do not introduce a new audit architecture inside the form.

The exact audit call is feature-specific and should be based on existing nearby
forms and the operation being performed.

## `.dfm` Generation

Generate only a minimal inherited `.dfm` scaffold when requested.

The generated `.dfm` should:

- inherit from the correct base form;
- preserve inherited components;
- add only components required by the known scaffold;
- use sensible names and parent containers;
- avoid pretending to finalize visual layout.

Leave to the developer:

- precise coordinates;
- final dimensions;
- visual spacing;
- tab order refinement;
- feature-specific captions;
- detailed component arrangement.

Do not generate a large speculative `.dfm` when the required controls are not yet
known.

## Form Opening Behavior

Forms inherited from `TfrmCadPadraoM` are normally used as primary non-modal
screens and commonly opened with:

```delphi
Form.Show();
```

Do not infer that all Modern forms use this behavior.

Simple/specialized forms may use `ShowModal()` instead and may not inherit from
`TfrmCadPadraoM`.

## Generation Procedure

When creating a cadastro-form scaffold:

1. Confirm that `TfrmCadPadraoM` is the appropriate base form.
2. Identify the owning microcontext.
3. Inspect the closest current Modern form that follows the desired pattern.
4. Identify the entity/state edited by the form.
5. Identify the Use Cases invoked by the form.
6. Determine whether an existing `TDataSetGrid` satisfies the Consulta grid.
7. If not, use `delphi-dataset-grid` to create one.
8. Obtain the entity's `EntityMetadata` when available.
9. Add UI validation through `delphi-ui-form-validation` when applicable.
10. Declare explicit state ↔ form mapping methods.
11. Wire standard inherited actions only when needed.
12. Keep business logic and persistence implementation outside the form.
13. Generate only a minimal inherited `.dfm` structure when requested.
14. Leave feature-specific controls, detailed layout, and non-standard events for
    the developer or a later targeted task.

## Reference

See:

`references/cadastro-form-example.md`
