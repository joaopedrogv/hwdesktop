---
name: manage-ai-tool-setup
description: Plan, apply, verify, switch, or safely remove repository-local AI tool adapters through the canonical setup automation.
---

# Manage AI Tool Setup

## Purpose

Provide a stable, tool-independent entry point for managing generated AI tool
setups without editing tool directories ad hoc.

Use this Command when the developer asks to configure, add, update, verify, switch,
or remove the setup of Kilo, AiderDesk, or Codex. The same intent may be expressed in
natural language without naming this Command.

## Canonical Automation

Use only:

```text
Scripts/AI/Sync-AIProfiles.ps1
```

Do not reproduce its copy, rendering, model-selection, ownership, or removal logic
with ad hoc shell commands.

## Intent Mapping

- configure, add, install, or update a tool — `-Action Apply`;
- preview configuration — `-Action Plan`;
- verify or check a tool — `-Action Check`;
- switch to a tool — `-Action Switch` with that tool as the target;
- remove or uninstall a tool setup — `-Action Remove`;
- mention of every supported setup — `-Tool All` only when the developer clearly
  requests that scope.

`Apply` is idempotent and does not remove other tool setups. `Switch` applies and
validates the target before removing other installed tool-specific setups. Shared
adapters remain installed. `Remove` deletes files recorded in the setup state,
artifacts explicitly allowlisted as disposable in the tool manifest, and
directories that become empty.

## Authorization

The developer's explicit request determines authorization:

- “configure” or “add” authorizes `Apply` for the named tool;
- “switch” authorizes applying the target and removing other managed tool-specific
  setups;
- “remove” authorizes removal of the named managed setup, its manifest-declared
  disposable artifacts, and its empty directories;
- a request to inspect or explain does not authorize mutation.

Before a mutating operation, execute the equivalent preview with `-WhatIf` or
`Plan` when applicable and inspect conflicts. Stop on unmanaged-file conflicts,
invalid configuration, unresolved templates, or paths outside the repository.
Never remove unknown files, add broad or inferred disposable paths, or weaken the
script's safeguards.

Removing the setup used by the current session may require a restart. Perform that
removal last and do not depend on the removed configuration for subsequent work.

## Completion

Report:

- requested tool and action;
- installed, updated, preserved, or removed managed components;
- conflicts or drift;
- whether Shared remains installed;
- whether the active tool must be restarted.

An Agent without terminal access must provide the exact script command and must not
claim the setup was changed.
