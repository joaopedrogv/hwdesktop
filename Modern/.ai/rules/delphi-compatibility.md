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

The following single first-line headers declare the source target:

| First line | Compatibility |
| --- | --- |
| `// Delphi Rio` | Existing Rio-only declaration; remains valid |
| `// Next - Delphi Rio` | Next development context, Rio-only |
| `// Next - Delphi 2006 e Delphi Rio` | Next development context, both Delphi 2006 and Rio |

The explicit dual-target header requires compatibility with both compilers,
including dependencies. Otherwise, files inside `Tests/` retain their existing
Rio target. Without a recognized Rio-only header or that test exception, the
file MUST remain compatible with Delphi 2006.

A header occupies only the first line. Next identifies development context,
not a new location or permission to bypass the owning area's rules.
When compatibility is uncertain, assume Delphi 2006.

## Compatibility Boundaries

- Determine compatibility at the source-file level, not from its module, architectural layer, directory, or consuming project.
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

For Delphi production sources, preserve the area's established ANSI /
single-byte encoding and line endings, including when adding a new unit. Do not
accept UTF-8 or UTF-8 BOM merely because an editing tool uses it by default.

Use the target area's actual production files and explicit source-encoding
configuration when present. The validated checkout's VS Code settings associate
Delphi files with language ID `delphi` or `pascal` and set `files.encoding` to `iso88591` under `[delphi]` or `[pascal]`. Language-specific settings must use the active
extension's language ID.
This is a concrete workspace setting, not permission to convert every module.
ANSI is not ASCII, and ISO-8859-1 is not a synonym for Windows-1252. If required
characters are outside the selected encoding or local evidence conflicts, resolve
that mismatch before writing; do not silently change the file format.

Follow ../.ai/rules/repository-safety.md's Source Encoding Verification for the
write operation and review. Verify the actual bytes of created and modified
Delphi 2006 sources using the identified encoding, including accented literals,
captions and metadata labels. Record the chosen encoding and check result.
UTF-8 validity or correct display in the IDE alone cannot establish compatibility.
Preserve verified Rio-only files and UTF-8 documentation under their own formats.

Apply the same preservation to supporting DFM, DPR, DPK and INC text touched by
the change. Source editing does not authorize compilation; when build/manual
validation is not authorized, report that validation as pending.
