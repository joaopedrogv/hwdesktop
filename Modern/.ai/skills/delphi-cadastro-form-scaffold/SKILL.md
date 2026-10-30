---
name: delphi-cadastro-form-scaffold
description: Create a Modern Delphi cadastro-form scaffold using the selected Modern or legacy base, dataset, metadata, validation, and scoped View/Presenter composition while preserving feature-specific UI decisions.
---

# Delphi Cadastro Form Scaffold

## Purpose

Use this Skill to create the initial structure of a Modern cadastro form using
TModernCadastroForm when its shared behavior matches the selected design, or an
existing direct TfrmCadPadraoM integration where adaptation was not requested.

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
or state, Use Cases, View/Presenter contracts and composition when applicable,
dataset, metadata, validation flow, and required scaffold components are established.

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

## Base Form Selection

For a compatible cadastro using the scoped MVP pattern, select:

```text
UI/Infrastructure/Components/ModernCadastroFormUnit.pas
TModernCadastroForm -> TfrmCadPadraoM
```

Use `.ai/context/ui-integration.md` for the base's actual responsibilities and
the RedBenefPC source reference. Do not redeclare inherited feedback, validator,
auditor, or filter-frame members.

Existing forms may directly inherit from the legacy `TfrmCadPadraoM`. Preserve
that choice unless the requested work includes adaptation. Do not refactor the
legacy base as part of scaffold generation.

The `.pas` unit references the selected base unit, and its `.dfm` MUST use
Delphi inherited-form syntax:

```text
inherited <FormName>: T<FormType>
```

Do not use a new top-level `object` form or duplicate the base's controls.
The legacy source is a dependency/evidence source, not a modernization target.

## Scaffold Responsibilities

A typical cadastro-form scaffold may declare fields for:

- the `TDataSetGrid` descendant used by the Consulta grid;
- the Presenter when the selected pattern requires it;
- audit support and IUIFormValidator only when not already provided by the base;
- the current entity/form state;
- other infrastructure already established by the microcontext.

Add only fields required by the target form. Do not shadow inherited feedback,
validator, auditor, or filter-frame members.

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
connect dataset to inherited grid through SetupDataSetGrid when available
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

When the selected base does not already provide it, the scaffold may include:

```delphi
FFormValidator: IUIFormValidator;
```

Initialize the existing or inherited field in FormCreate; each concrete form
owns its metadata/component binding decisions.

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
TModernCadastroForm supplies FiltroGrid: configure that instance after dataset
setup rather than adding a second filter frame. Reuse the controls already hidden
and disabled in the Modern base DFM rather than repeating those properties locally.
TModernCadastroForm.FormShow now preserves inherited initialization and hides the
six replaced MaskEdit/ComboBox controls afterwards, including a MaskEdit3 re-shown
by the legacy ancestor. Reuse that shared handler rather than adding the same
suppression to every child. Preserve the existing initialization chain/first-show
conditions and add local visibility behavior only for a real feature-specific need.
Do not skip inherited initialization or disable unrelated actions.

Use the dataset Skill for field exposure and lifecycle. FillForm/frame selection
already provides the standard operators, and GetFiltros performs filter validation.
Do not reproduce those mechanisms or add an empty OnFieldChange handler.

## Form State

Prefer explicit mapping between UI components and the current entity/state.

Typical methods:

```delphi
procedure MapStateToForm();
procedure MapFormToState();
```

or equivalent names already established by the target microcontext.

### `MapStateToForm`

Use it to project the current entity/state into the form controls. Do not fetch
lookups or execute Use Cases inside the mapping. Use a separate preparation step,
execute it once, and honor failure before opening or changing the edit view.

### `MapFormToState`

Use it to build/update the entity/state from user input before calling a Use Case.

Keep business calculations and decisions outside these mapping methods.

Do not make UI components themselves the domain state.

## View, Presenter, and Composition

When the selected design uses the scoped MVP pattern:

1. Place the Presenter beside the concrete form. Use IViewFeedback directly when
   only shared feedback is required; the form declares that common interface.
2. Create a feature View beside the form only for additional feature-specific
   presentation needs. Extend IViewFeedback without redeclaring its generic
   validation/error/information/attention methods or creating an empty marker
   merely for structural consistency.
3. Inject application dependencies into the Presenter; do not use Container/factories
   in form interaction handlers or inside the Presenter.
4. Compose the objects at the existing screen-opening boundary, before interaction.
5. Keep controls, simple mapping, the grid read model, permissions, and audit in
   their established UI owners; keep business rules/transactions in the core.
6. Define ownership of the Presenter, interfaces, state, output objects, and lists.
   Check the actual contract instead of inferring ownership from an `I` prefix.

Preserve direct integrations in existing forms outside the requested scope.
Do not create a generic framework to scaffold a single feature.

## Standard Actions

The scaffold may provide handlers for standard inherited actions when required:

- include/new;
- edit;
- delete;
- save/confirm;
- cancel;
- refresh/query.

These handlers coordinate UI state and, with scoped MVP, delegate application
calls to the Presenter. Keep the dataset-driven query/refresh path at its
established UI read-model boundary.

They MUST NOT contain business rules that belong to the application/domain layer.

Use existing Use Cases when available rather than performing persistence directly
from the form.

## Save Flow

A typical save/confirm flow is:

```text
MapFormToState
↓
check the approved permission at the existing UI boundary
↓
Presenter executes the injected Use Case (or preserves an existing direct flow)
↓
validation invalid or operation failed?
    ├── yes → appropriate View feedback; no success continuation
    └── no  → preserve success audit and inherited UI completion
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

Preserve the owning entry point's Show/ShowModal and MDI behavior. Shared ancestry
does not imply one opening mode. When using a Presenter, compose/inject it before
user interaction and preserve the existing form-owner and cleanup contract.

## Generation Procedure

When creating a cadastro-form scaffold:

1. Confirm the appropriate base: shared Modern cadastro base when compatible,
   or the established alternative justified by the screen.
2. Identify the owning microcontext and inspect the relevant RedBenefPC reference.
3. Identify the entity/edit state and its ownership.
4. Identify the Use Cases, their real contracts, results, and lifetime semantics.
5. Select the View/Presenter scope and the existing composition entry point.
6. Determine whether an existing TDataSetGrid satisfies the Consulta grid; use
   delphi-dataset-grid only if a new dataset is needed.
7. Reuse inherited SetupDataSetGrid/FiltroGrid where available; configure the
   dataset, metadata, field displays, and filter callbacks explicitly.
8. Add UI validation through delphi-ui-form-validation, reusing inherited fields.
9. Declare pure state/form mapping methods and a separate preparation step for
   required lookups; execute it once and honor failure in all callers.
10. Wire only the required inherited actions, preserving permission checks,
    manager approval, audit, failure outcomes, and success refresh.
11. Compose/inject dependencies before allowing interaction and preserve opening
    mode and cleanup behavior.
12. Generate only a minimal inherited DFM when requested. Do not disable unrelated
    buttons when replacing the legacy filter controls.
13. Leave detailed layout and unknown feature-specific interactions to the
    developer or a later targeted task.

## Reference

See:

`references/cadastro-form-example.md`
