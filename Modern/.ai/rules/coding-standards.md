---
name: coding-standards
description: Coding conventions and project-specific practices for Delphi code in Modern.
applies_to:
  - "**/*.pas"
---

# Coding Standards

## General

- Keep changes focused on the requested task.
- Do not perform unrelated refactoring, formatting, renaming, cleanup, or modernization.
- Preserve existing behavior and public contracts unless the task explicitly requires changing them.
- New or modified code MUST follow these standards.
- When no rule applies, prefer consistency with the surrounding code.

## Naming

ONLY code under `Fiscal.Calculos/` MUST also follow `.ai/rules/fiscal-calculos.md`,
which take precedence for maintaining compliance with Java.

### Units

- Start new unit and file names with the subject or responsibility to support prefix searches.
  Put the role at the end when it identifies the artifact. Include the module name only when it clarifies scope or resolves ambiguity.
- Unit names MUST NOT use the `U` prefix or dotted namespaces.
- For a unit with a clear primary type, default to its name without the leading `T` or `I`.
  - `TClienteEtd` → `ClienteEtd.pas`
  - `TClienteModel` → `ClienteModel.pas`
  - `IClientesRepository` → `ClientesRepository.pas`
- Use `Unit` only when required by an established convention in the owning area or to resolve a concrete identifier conflict.
  When a variable collides with a unit name, prefer a descriptive variable name such as `ConnectionWrapper`.
- For new forms and frames, use `Form` or `Frame` as the final suffix. Match the base name of the `.pas` and `.dfm` to the unit name.
  - `ClientesCadastroForm.pas` and `ClientesCadastroForm.dfm` → `TfrmClientesCadastro`
  - `ClientesFiltroFrame.pas` and `ClientesFiltroFrame.dfm` → `TfrmClientesFiltroFrame`
- Do not rename existing units solely to enforce these conventions.

### Types

- Concrete classes and custom records MUST use the `T` prefix. New form and frame classes use `Tfrm`.
- Interfaces MUST use the `I` prefix.
- Database entity types MUST use the `Etd` suffix.
- Data models and DTO-like types MUST use the `Model` suffix.
- Preserve established type suffixes in existing modules.

### Identifiers

- Private class and record fields MUST use `F` + PascalCase.
- Method parameters MUST use `A` + PascalCase.
- Local variables MUST use descriptive names without type-based prefixes.

## Language

- Domain and business concepts MUST use Brazilian Portuguese terminology.
- Technical and infrastructure terminology SHOULD use English.
- Mixed names SHOULD preserve the appropriate language for each part, e.g. `IClientesRepository`, `TNotaFiscalModel`.

## Comments

- Use `//` for new comments.
- Comments SHOULD explain why a non-obvious decision, business rule, compatibility constraint, or workaround exists.
- Do not add comments that merely restate the code.
- Preserve meaningful existing comments.
- Apply the shared durable-comment guidance in ../.ai/rules/repository-safety.md.
  Keep Workflow-run decisions and review history in the run's artifacts.

## Formatting

- Use 2 spaces; do not use tabs.
- New or modified lines SHOULD NOT exceed 120 characters unless a longer line improves readability or preserves an established construct.
- Delphi keywords MUST be lowercase.
- Do not reformat unrelated code solely to enforce formatting rules.

## State and User Communication

Apply ../.ai/rules/repository-safety.md's Local Implementation Quality to state
lifetime, coherent data, record identification and user-facing findings.
Prefer existing mechanisms and local derived values when they preserve behavior.

## Visibility and Public APIs

- Use the narrowest visibility required.
- Do not make `private` or `protected` members `public` merely to simplify an implementation.
- Preserve existing public APIs and method signatures unless explicitly required otherwise.
- Do not introduce incidental breaking API changes.

## Exceptions

- Business-rule and user-facing validation failures MUST use `EValidacaoNegocio`.
- User-facing validation messages MUST be clear and written in Brazilian Portuguese.
- Do NOT use `EValidacaoNegocio` for infrastructure, database, network, file-system, programming, or unexpected internal failures.
- Preserve meaningful existing exception types.
- Do not catch exceptions merely to suppress them.

## Memory Management

- Manually created objects whose ownership remains with the current scope MUST have their lifetime explicitly managed, normally with `try...finally` and `.Free`.
- Do not manually free objects whose ownership has been transferred elsewhere.
- Reference-counted interface instances MUST NOT be manually freed.
- Preserve established ownership semantics.
- When ownership is unclear, inspect creation, assignment, ownership, and destruction paths before changing lifetime behavior.

## Unit Dependencies

- Add units to `uses` only when required.
- Remove a unit only when it is clearly unused.
- Do not reorder existing `uses` clauses as part of an unrelated change.
- Prefer existing project abstractions over unnecessary new dependencies.
- Dependency changes MUST respect `.ai/rules/architecture.md`.
