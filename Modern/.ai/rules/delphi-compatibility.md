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

**Within Modern/, Delphi 2006 is the default compatibility target.**

The following single first-line headers declare exceptions:

| First line | Compatibility |
| --- | --- |
| `// Delphi Rio` | Rio-only source |
| `// Next` | Next development context, Rio-only |
| `// Next - Delphi 2006 e Delphi Rio` | Next context with explicit compatibility for both compilers |

The explicit dual-target header requires both compilers, including dependencies.
Use it when a Next-context source also needs a real Delphi 2006 consumer.
The earlier `// Next - Delphi Rio` header retains its Rio-only meaning; do not
rewrite existing headers in bulk. Files inside `Tests/` retain their existing
Rio target. Without a recognized Rio-only header or that test exception, a Modern
source MUST remain compatible with Delphi 2006.

A marker occupies only the first line. Next identifies development context, not
a new location or permission to bypass the owning area's rules. These Modern
defaults do not override Next/AGENTS.md: Next/ has a Rio default and marks its
Delphi 2006 compatibility exceptions. When a Modern source's target is uncertain,
assume Delphi 2006.

## Compatibility Boundaries

- Determine each source's target from its owning area's default, explicit first-line marker and actual consumers; an architectural layer or a Rio consumer does not make a shared source Rio-only.
- A directory MAY contain both Delphi 2006-compatible and Delphi Rio-only files.
- Delphi 2006-compatible units MAY be consumed by both Delphi 2006 and Delphi Rio projects.
- Do not introduce Delphi Rio-only language features, APIs, libraries, components, or dependencies into Delphi 2006-compatible files.
- Do not migrate a Delphi 2006-compatible file to Delphi Rio unless explicitly required by the task.

When a demand introduces a real Delphi 2006 consumer for a Rio-only source,
check syntax, APIs, transitive dependencies, encoding and behavior before widening
its target. Make the necessary adaptation within the requested scope, preserving
results and contracts. Record compatibility evidence and unperformed compiler
checks; a Rio build alone does not prove Delphi 2006 compatibility. Surface
material behavioral or dependency changes instead of forcing the adaptation.
Do not change existing headers or migrate sources in bulk.

## Project Compatibility

- Delphi 2006 projects MUST contain only Delphi 2006-compatible dependencies.
- Delphi Rio projects MAY consume both Delphi 2006-compatible and Delphi Rio-only units.
- A project's compiler version does not change the compatibility target of the units it consumes.

## Source Encoding

Follow ../.ai/rules/repository-safety.md for source encoding, format preservation
and normal diff review.

Source editing does not authorize compilation; when build/manual validation is
not authorized, report that validation as pending.
