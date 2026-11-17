---
name: delphi-coding-standards
description: Shared Delphi unit naming and resource-ownership conventions for Modern and Next sources.
applies_to:
  - "Modern/**/*.pas"
  - "Next/**/*.pas"
---

# Shared Delphi Coding Standards

Apply to Modern and Next Delphi sources, preserving specialized exceptions selected
by the owning area's guidance. Other legacy areas keep their local conventions.
Shared source-comment and simplicity rules are in .ai/rules/implementation-quality.md;
source encoding verification remains in .ai/rules/repository-safety.md.

## Names

- Start new unit and file names with their subject or responsibility. Put the role
  at the end when it identifies the artifact; include the module name when it
  clarifies scope or resolves ambiguity.
- Use T for classes and custom records and I for interfaces. New form and frame
  classes use Tfrm. For a unit with a clear primary type, default to its name
  without the leading T or I.
- For new visual units, use Form or Frame as the final suffix and match the unit,
  PAS and DFM base names, such as ClientesCadastroForm/TfrmClientesCadastro.
- Use the Unit suffix only when the area's convention requires it or it resolves
  a concrete conflict. Prefer a descriptive variable name when it collides with
  a unit name. Preserve existing names during unrelated work.
- Use // for new Delphi comments, subject to the shared comment criteria.

## Ownership and dependencies

- Manage manually created objects whose ownership remains in the current scope,
  normally with try...finally and Free. Preserve established ownership; do not
  free objects transferred to another owner or managed by reference counting.
- When ownership is uncertain, inspect creation, assignment and destruction paths
  before changing lifetime behavior. An interface contract alone does not decide
  ownership or the Spring4D registration lifetime.
- Add uses entries only when required. Remove an entry only when verified unused;
  preserve unrelated uses ordering. Prefer established abstractions and follow
  the owning area's dependency rules.
