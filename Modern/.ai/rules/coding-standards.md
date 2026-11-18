---
name: coding-standards
description: Modern-specific business type suffixes and business-validation exception conventions.
applies_to:
  - "**/*.pas"
---

# Modern Coding Standards

Read the shared .ai/rules/implementation-quality.md and
.ai/rules/delphi-coding-standards.md from the checkout root. This Rule adds
Modern's business-code conventions. Follow .ai/rules/architecture.md for
dependency direction. For Fiscal.Calculos/, also read .ai/rules/fiscal-calculos.md;
its explicit naming and architectural exceptions take precedence.

## Business types

- Database entity types use Etd; data models and DTO-like types use Model.
  Preserve established suffixes in existing modules.
- These business-type suffixes do not automatically apply to UI selection or
  option records merely to make their names uniform.

## Business exceptions and validation

- Use EValidacaoNegocio for business-rule exceptions, with clear Brazilian
  Portuguese messages.
- Preserve structured validation results, including ValidationEntityOutput.
  Do not replace them with exceptions to satisfy this Rule.
- Preserve meaningful exception types. Infrastructure, database, network,
  filesystem, programming and unexpected internal failures must not be represented
  as EValidacaoNegocio. Do not catch exceptions merely to suppress them.
