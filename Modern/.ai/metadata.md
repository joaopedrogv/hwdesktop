# Canonical Metadata

## Purpose

This document defines the tool-independent metadata format for canonical artifacts
under `.ai/`. Tool adapters may translate these fields but must not redefine their
meaning or add tool-specific metadata to the canonical source.

## Format

Metadata uses YAML frontmatter at the beginning of a Markdown artifact:

```yaml
---
name: artifact-name
description: Concise routing description for the artifact.
---
```

All directly routable Rules, Context, Skills, Workflows, Commands, and Agent role
definitions must declare `name` and `description`.

Indexes, category READMEs, supporting specifications, Skill reference material,
checklists, and human-facing documentation do not require metadata unless they
become directly routable artifacts.

## Common Fields

### `name`

- Required for every directly routable artifact.
- Must use lowercase `kebab-case`.
- Must be unique across directly routable artifacts under `.ai/`.
- Must match the artifact's Markdown filename without `.md`.
- For a Skill, must match its directory name; the entry file remains `SKILL.md`.
- Is the stable canonical identifier used by natural-language requests, Commands,
  Workflows, and tool adapters.

### `description`

- Required for every directly routable artifact.
- Must concisely state the artifact's purpose and enough routing information to
  distinguish when it is relevant.
- For a Skill, Workflow, Command, or Agent, should describe the operation it can
  perform.
- For a Rule or Context, should identify the constraints or project knowledge it
  contributes.
- Must remain tool-independent and must not name a model, IDE, vendor-specific
  trigger, or provider configuration.

## Rule Scope Fields

Only Rules may declare `always_apply` or `applies_to`.

### `always_apply`

```yaml
always_apply: true
```

- Optional.
- When `true`, the Rule applies to every repository task.
- Omit the field when the Rule is not universal; do not declare
  `always_apply: false`.

### `applies_to`

```yaml
applies_to:
  - "**/*.pas"
  - "**/*.dpr"
```

- Optional.
- Must be a YAML list of repository-relative glob patterns.
- The Rule applies when the task touches a matching path.
- Use forward slashes in patterns.

`always_apply` and `applies_to` are mutually exclusive. A Rule with neither field
is loaded when it is semantically relevant to the task.

The legacy `globs` field is not canonical and must not be used.

## Category-Specific Metadata

No additional metadata fields are currently canonical for Context, Skills,
Workflows, Commands, or Agents. Their operating boundaries, inputs, outputs,
authorization gates, and procedures belong in the artifact body.

Do not add fields such as artifact type, schema version, model, reasoning effort,
cost, IDE command syntax, or provider-specific options without a new canonical
decision. Category comes from the artifact's directory, not from duplicated
metadata.
