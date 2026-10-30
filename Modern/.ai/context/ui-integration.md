---
name: ui-integration
description: Understand how Modern VCL forms integrate Use Cases, datasets, validation, metadata, authorization, and auditing with the legacy ERP UI.
---

# UI Integration Context

## Purpose

This document describes how the `Modern` UI layer is organized and how it
integrates with legacy ERP infrastructure.

It provides architectural context for AI-assisted development.

Detailed procedures for generating datasets, validation integration, and
standard cadastro forms belong to their respective Skills and are not
duplicated here.

---

## UI Structure

The `UI/` directory contains Modern presentation-layer code.

Main areas:

```text
UI/
├── Datasets/
├── Forms/
├── Frames/
│   ├── Componentes/
│   └── Contextos/
├── Infrastructure/
│   ├── Components/
│   ├── DataSet/
│   ├── Interfaces/
│   ├── Services/
│   └── Types/
└── Utils/
```

UI code is normally organized by microcontext.

Examples:

```text
UI/Forms/NotasFiscais/
UI/Forms/OperacoesInternas/
UI/Datasets/NotasFiscais/
UI/Frames/Contextos/ERP.Features/NFSe/
```

---

## Forms

Modern forms are located under:

```text
UI/Forms/<MicroContext>/
```

There is no universal base class for every form.

The appropriate form architecture depends on its responsibility.

### Standard Cadastro Forms

Main cadastro/query screens commonly inherit from the legacy:

```text
TfrmCadPadraoM
```

located at:

```text
../UCadPadraoModal.pas
```

This inheritance is intentional.

`TfrmCadPadraoM` already provides substantial ERP UI infrastructure,
including:

* Consulta and Cadastro tabs;
* standard query controls;
* DBGrid infrastructure;
* Include/Edit/Delete action buttons;
* OK/Cancel/Exit controls;
* saved grid preferences;
* grid export capabilities;
* other established ERP behavior.

The Consulta tab is `TabSheet2`.

The Cadastro tab is `TabSheet1`.

Modern forms add their feature-specific behavior and components on top of
this infrastructure rather than reimplementing it.

Use the `delphi-cadastro-form-scaffold` Skill when creating a new standard
cadastro form based on this pattern.

### Modern Cadastro Base

Compatible cadastros can reuse `TModernCadastroForm`, defined with its inherited
DFM in `UI/Infrastructure/Components/ModernCadastroFormUnit.pas`. It descends from
`TfrmCadPadraoM`; it does not replace the legacy base or apply to every Modern form.

The shared base provides:

- `ExibirValidacoes`, `ExibirErro`, `ExibirInformacao`, and `ExibirAtencao`;
- the inherited `FFormValidator` field, configured by each concrete form;
- a borrowed `FAuditor` reference supplied by the concrete form/dataset;
- `FiltroGrid: TFilterFramePadrao`;
- `SetupDataSetGrid(ADataSet: TDataSetGrid)`, which connects the grid datasource
  and calls the established legacy grid-configuration setup.

`SetupDataSetGrid` does not create, configure, own, or free the dataset. Dataset
`Setup`, metadata, filter callbacks, validation bindings, and application of field
configuration remain explicit in the concrete form. Do not repeat the legacy
grid-configuration call after using this helper.

Do not redeclare inherited validator/auditor fields or duplicate shared feedback
methods. Initialize the validator before feedback can be invoked. Keep process
codes, authorization, manager approval, and audit labels/outcomes at the established
feature-specific UI boundary; storing the auditor reference does not transfer ownership.

The base DFM disables/hides the legacy filter controls replaced by FiltroGrid.
TModernCadastroForm.FormShow calls inherited first, then hides MaskEdit1/2/3 and
ComboBox1/2/3. This centralizes the runtime state because the legacy FormShow can
re-show a control such as MaskEdit3 for empty/Todos. Reuse that base behavior;
do not repeat the same visibility assignments in each descendant.

Preserve the existing FormShow initialization chain and first-show conditions;
do not skip inherited merely to avoid the legacy filter code. Add a local
visibility rule only for a genuine feature-specific requirement. Preserve unrelated
inherited actions, especially New/Save/Edit/Delete.

### Scoped MVP Presentation Pattern

For compatible cadastros following the RedBenefPC pilot, use the supervising form
of Model-View-Presenter:

| Part | Responsibility |
| --- | --- |
| Concrete form | Controls, simple mapping, edit state, grid/filter wiring, protected-action checks, audit, and inherited visual completion. |
| Presenter | Application calls and presentation response coordination, including validation, failures, and lookup loading. |
| Use Cases/core | Application behavior, business rules, transactions, and persistence abstractions. |
| Composition entry point | Create and inject the Presenter and its Use Cases before interaction is allowed. |

The Presenter belongs to UI, depends on a presentation contract and application
contracts, and must not access VCL controls, the concrete form/base class, datasets,
or the global Container to obtain its dependencies. A form may still coordinate
the established `TDataSetGrid` read model; moving business Use Case calls to a
Presenter does not require moving this UI read infrastructure into the Presenter.

`UI/Infrastructure/Interfaces/IViewFeedbackUnit.pas` defines IViewFeedback for
validation, error, information and attention feedback. A Presenter needing only
these capabilities can depend directly on IViewFeedback; the concrete form declares
that interface and reuses TModernCadastroForm's implementations. Do not create an
empty per-form View interface merely to reproduce the pilot's file structure.

Create a feature View extending IViewFeedback when the flow needs genuinely specific
presentation capabilities, such as showing its own lookup data. Generic feedback
belongs in the shared contract/base; do not put ExibirAtencao in a feature interface
solely because that form was the first consumer. Extending shared infrastructure
still requires an assigned scope; propose a missing common capability instead of
silently broadening a feature assignment. Preserve existing contracts outside scope.

Keep feature Presenters and View contracts beside their form, under
`UI/Forms/<MicroContext>/`. Use established names for existing files; apply naming
Rules when introducing new files. Do not create a generic Presenter hierarchy or
one Presenter per button merely to follow the pilot.

#### Composition, Mapping, and Results

Use the owning screen-opening/composition entry point to create/inject dependencies.
The pilot uses `ShowAjustesRedBenefPC` in `package/PackageSetuptUnit.pas`.
Do not construct Use Cases through factories/Container in the form's interaction
handlers or inside the Presenter. Preserve the screen's modal/MDI behavior.

Keep `MapStateToForm` and `MapFormToState` as mappings. Load prerequisite data
once in an explicit preparation step and honor its result in every caller. For
example, after `PrepararCamposCadastro` has loaded lookups and mapped the state,
do not call the mapping again unconditionally or continue opening/unlocking the
screen when preparation failed.

Do not equate failed reads with a missing record or an empty lookup. Report the
appropriate outcome without duplicate messages. Successful save/delete results
must still trigger the established success audit and visual refresh.

#### Ownership

The form owns its Presenter and explicitly releases it before inherited destruction.
Use Cases implemented with `TInterfacedObject` and retained through real interfaces
are released by reference counting; do not call `.Free` on those references.
An `I` prefix alone is not proof: older factory aliases may be classes.

Entity/model results, lists, and output objects retain their explicit ownership
contracts. In the pilot:

- the form owns its edit state;
- the Presenter releases `CreateEntityUseCaseOutput` after consuming its result;
- `TComboboxEntityPickerFrame.LoadEntities(list, True)` claims the items, not the
  source list container; the caller must still release that container;
- validation results and exceptions passed to the View are consumed synchronously,
  not retained as borrowed objects after the owning scope ends.

#### Source Reference and Scope

Read only the parts needed from:

- `UI/Forms/RedBenefPC/UCadAjustesRedBenefPC.pas` and its DFM;
- `UI/Forms/RedBenefPC/AjustesRedBenefPcPresenter.pas`;
- `UI/Forms/RedBenefPC/AjustesRedBenefPcView.pas`;
- `UI/Infrastructure/Components/ModernCadastroFormUnit.pas` and its DFM;
- `UI/Infrastructure/Interfaces/IViewFeedbackUnit.pas`;
- `package/PackageSetuptUnit.pas`, specifically the screen-opening method.

The developer reported compiling and manually validating this pilot on 2026-10-29.
It is implementation evidence, not a frozen template or proof that every current
caller is correct. Inspect outcomes, ownership, and error paths before reuse.
Existing direct-form integrations are not automatically invalid. Do not migrate
unrelated forms, specialized dialogs, or legacy code as an incidental change.

### Other Forms

Forms that do not require the behavior provided by `TfrmCadPadraoM` may use
another appropriate base class or no custom base class.

Simple modal or specialized forms should not inherit from
`TfrmCadPadraoM` merely for consistency.

The legacy `TfrmPadrao`, located at:

```text
../UPadrao.pas
```

is another available base form.

It does not provide visual components but exposes legacy helper functions
such as registry access, messages, and other common form utilities.

---

## Grid Data Access

Forms MUST NOT implement grid-oriented database access directly when the
existing `TDataSetGrid` infrastructure is applicable.

Modern grid datasets are located under:

```text
UI/Datasets/<MicroContext>/
```

and inherit from:

```text
TDataSetGrid
```

defined in:

```text
UI/Infrastructure/DataSet/DataSetGrid.pas
```

`TDataSetGrid` is the Modern boundary over the legacy `TDataSet_OOP`
infrastructure for grid-oriented read access.

It provides capabilities such as:

* executing predefined grid queries;
* applying filters;
* navigating dataset records;
* refreshing data;
* calculated/selection columns;
* obtaining grid data;
* accessing audit infrastructure.

When a form requires a grid read model that does not already exist, a new
`TDataSetGrid` descendant may be created.

Use the `delphi-dataset-grid` Skill for this task. Its existing public/inherited
API is the preferred boundary for opening and running data, including ClientOpen
and RunSQLMaker. Raw dataset access is still used for VCL/filter bindings; it is
not a reason to duplicate CommandText/Open or bypass field configuration in new code.
Inspect legacy implementation only for the concrete question; root-level access
does not make that implementation the preferred consumer API.

---

## Filtering

The existing ERP filtering infrastructure remains intentionally reused by
Modern UI code.

The conceptual flow is:

```text
Form / Filter Frame
        ↓
TFilterPropsList
        ↓
TDataSetGrid
        ↓
TSqlMaker / FilterMaker
        ↓
Database query
```

The legacy unit:

```text
../Ativos/fonte/hw_filters.pas
```

provides the underlying filtering model and SQL builder infrastructure,
including:

* `TFilterProps`;
* `TFilterPropsList`;
* `FilterMaker`;
* `TSqlMaker`.

`TFilterFrame`, from:

```text
../Ativos/fonte/FilterFR.pas
```

provides reusable dynamic filtering UI.

`TFilterFramePadrao`, from:

```text
../Ativos/fonte/FilterPadraoFR.pas
```

specializes that frame for forms based on `TfrmCadPadraoM`.

Modern code SHOULD reuse this infrastructure rather than introduce a
parallel filtering mechanism without a specific architectural reason.

A TModernCadastroForm descendant reuses FiltroGrid instead of creating a second
copy of the frame. The concrete form binds OnFieldChange only for actual custom
conditions and fills the available fields after dataset/metadata setup and the
normal AfterOpen field configuration. Its query action passes GetFiltros to the
established SQLMaker/FilterMaker. Keep dataset-specific filtering outside the base.

---

## Grid Field Configuration

Grid field configuration uses infrastructure provided by:

```text
../Ativos/fonte/FieldsConfigUnit.pas
```

The main abstractions are:

```text
FieldConfigModel
FieldsConfigModel
IFieldsConfigBuilder
FieldsConfigFactory
```

They describe and build grid column configuration such as:

* field name;
* display name;
* visibility;
* width;
* edit mask;
* display format;
* `GetText` handlers.

Modern `TDataSetGrid` implementations may combine this infrastructure with
`EntityMetadata` when appropriate.

Detailed dataset field-generation rules belong to the
`delphi-dataset-grid` Skill.

---

## UI Validation

Business/entity validation is performed outside the form.

Use Cases may return validation information that the UI projects onto form
components.

The main UI abstraction is:

```text
IUIFormValidator
```

created through:

```text
UIFormValidatorFactory
```

Related interfaces include:

```text
IUIFormValidator
IUIFormComunicator
IUIFormValidatorBuilder
```

This infrastructure connects validation attributes to form components and
can present validation through component hints or messages.

`EntityMetadata` provides the bridge between entity attributes and their
friendly UI representation.

Use the `delphi-ui-form-validation` Skill when integrating validation results
with a form.

Entity validation rules themselves belong to the
`delphi-entity-validation` Skill.

With scoped MVP, the Presenter checks the Use Case output and calls the feature
View's inherited ExibirValidacoes capability. TModernCadastroForm projects the
result through its configured validator; the concrete form still creates the
metadata/component bindings. Do not shadow the inherited FFormValidator field.

---

## Progress Observers

Modern UI infrastructure provides implementations of:

```text
IProgressObserver
```

for different presentation environments.

`ConsoleObserverFactory` creates an observer that writes progress/log
information to the console.

`UIFormObserverFactory` creates an observer that displays progress, counters,
and log messages in a small UI form.

Application code SHOULD depend on `IProgressObserver` rather than directly
depending on one of these presentation implementations.

---

## UI Helpers

Reusable UI helpers exist under:

```text
UI/Utils/
```

Notable examples include:

### `DbGridConfigUtilsUnit`

Applies `FieldsConfigModel` configuration to a `TDBGrid`.

### `UIMasksUtilsUnit`

Provides reusable field-mask helpers.

### `UIUtilsUnit`

Provides general form/UI helpers such as:

* message boxes;
* error-message handling;
* component positioning;
* focus handling.

Prefer existing helpers when they already implement the required UI-only
behavior.

---

## UI Display Types

Some UI-specific representations of application enums are maintained under:

```text
UI/Infrastructure/Services/
```

Examples include:

```text
NFSeTypesDisplayUnit.pas
ResultadoOperacaoDFeUIMessagesUnit.pas
```

These units provide UI-friendly text representations of enum values.

Presentation-only descriptions SHOULD remain in the UI layer when they are
not domain concepts.

---

## Audit Integration

The ERP uses the legacy:

```text
TAudit_OOP
```

from:

```text
../Ativos/fonte/hw_audit_utils.pas
```

for user-action auditing.

Modern UI code may obtain audit support through a `TDataSetGrid` descendant
or create/access it through the established legacy mechanism when no dataset
is involved.

Authorization, process-code planning, manager approval, and audit coverage are
described in `.ai/context/authorization-auditing.md`.

There is no separate Modern audit implementation. Do not introduce one incidentally
while implementing UI functionality.

---

## Modern and Legacy Boundary

The UI intentionally integrates with selected legacy ERP infrastructure.

Important legacy dependencies include:

```text
TfrmCadPadraoM
TfrmPadrao
TDataSet_OOP
TAudit_OOP
FieldsConfigUnit
hw_filters
TFilterFrame
TFilterFramePadrao
```

These dependencies may be inspected and consumed when implementing Modern
functionality.

However:

> Modern conventions MUST NOT be assumed to apply to legacy source code.

Do not refactor, rename, reorganize, or modernize legacy code merely because
Modern code depends on it.

When possible, Modern-specific abstractions such as `TDataSetGrid` SHOULD
contain the interaction with legacy infrastructure.

Direct legacy integration is acceptable where an established Modern boundary
does not exist and creating one would provide no meaningful architectural
benefit.

---

## AI Guidance

When working on Modern UI code:

1. Identify the microcontext before creating files.
2. Inspect nearby Modern UI implementations before choosing a form pattern.
3. Do not assume every form inherits from `TfrmCadPadraoM`.
4. Use `TDataSetGrid` for grid-oriented database access when applicable.
5. Keep SQL out of form event handlers when dataset infrastructure can own it.
6. Keep entity/business validation outside the form.
7. Use `EntityMetadata` for established attribute/display mappings.
8. Reuse existing filtering, grid configuration, audit, and UI helper
   infrastructure.
9. Treat legacy code as an integration dependency, not as a target for
   Modern conventions.
10. Use the appropriate UI Skills for procedural implementation details.
