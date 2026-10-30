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

Configure the write operation explicitly. Reopen edited/generated text using the
intended encoding and check accented literals, captions and metadata labels.
Correct rendering in an editor alone does not prove the compiled strings are
correct. Respect existing BOM and format conventions for verified Rio-only files
and UTF-8 documentation; do not normalize neighboring files.

Apply the same preservation to supporting DFM, DPR, DPK and INC text touched by
the change. Source editing does not authorize compilation; when build/manual
validation is not authorized, report that validation as pending.
