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

Use the `delphi-dataset-grid` Skill for this task.

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
