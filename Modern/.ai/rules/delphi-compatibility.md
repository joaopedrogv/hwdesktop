---
name: delphi-compatibility
description: Compiler compatibility rules for Delphi 2006 and Delphi Rio 10.3.3 in the Modern project.
applies_to:
  - "**/*.pas"
  - "**/*.dpr"
  - "**/*.dpk"
---

# Delphi Compatibility Rules

## Compatibility Target

**Delphi 2006 is the default compatibility target.**

A source file is Delphi Rio 10.3.3 code only when:

- its first line is `// Delphi Rio`; or
- it is located inside `Tests/`.

If neither condition applies, the file MUST remain compatible with Delphi 2006.

When compatibility is uncertain, assume Delphi 2006.

## Compatibility Boundaries

- Determine compatibility at the source-file level, not from its module, architectural layer, directory, or consuming project.
- A directory MAY contain both Delphi 2006-compatible and Delphi Rio-only files.
- Delphi 2006-compatible units MAY be consumed by both Delphi 2006 and Delphi Rio projects.
- Do not introduce Delphi Rio-only language features, APIs, libraries, components, or dependencies into Delphi 2006-compatible files.
- Do not migrate a Delphi 2006-compatible file to Delphi Rio unless explicitly required by the task.

## Project Compatibility

- Delphi 2006 projects MUST contain only Delphi 2006-compatible dependencies.
- Delphi Rio projects MAY consume both Delphi 2006-compatible and Delphi Rio-only units.
- A project's compiler version does not change the compatibility target of the units it consumes.