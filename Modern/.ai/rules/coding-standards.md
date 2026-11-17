---
name: coding-standards
description: Modern-specific Delphi naming, formatting and exception conventions, supplementing shared coding standards.
applies_to:
  - "**/*.pas"
---

# Modern Coding Standards

Read the shared .ai/rules/implementation-quality.md and
.ai/rules/delphi-coding-standards.md from the checkout root. These rules add
Modern-specific conventions. Preserve existing behavior, public APIs and
unrelated code; use surrounding conventions where no rule applies.

## Naming and language

For Fiscal.Calculos/, .ai/rules/fiscal-calculos.md takes precedence for naming
and architectural fidelity to Java.

- New unit names must not use the U prefix or dotted namespaces.
- Database entity types use Etd; data models and DTO-like types use Model.
  Preserve established suffixes in existing modules.
- Private fields use F + PascalCase; parameters use A + PascalCase.
  Local variables use descriptive names without type-based prefixes.
- Domain and business concepts use Brazilian Portuguese terminology. Technical
  and infrastructure terminology should use English, including mixed names such
  as IClientesRepository and TNotaFiscalModel.

## Formatting and visibility

- Use two spaces, no tabs, and lowercase Delphi keywords.
- Prefer up to 120 characters per new or modified line unless a longer line
  improves readability or preserves an established construct.
- Use the narrowest visibility required. Do not expose private/protected members
  merely to simplify an implementation. Preserve APIs unless the task requires
  their change.
- Do not reformat or rename unrelated code to enforce conventions.

## Exceptions and dependencies

- Use EValidacaoNegocio for business-rule and user-facing validation failures,
  with clear Brazilian Portuguese messages.
- Preserve meaningful exception types. Infrastructure, database, network,
  filesystem, programming and unexpected internal failures must not be represented
  as EValidacaoNegocio. Do not catch exceptions merely to suppress them.
- Follow .ai/rules/architecture.md for dependency direction.
