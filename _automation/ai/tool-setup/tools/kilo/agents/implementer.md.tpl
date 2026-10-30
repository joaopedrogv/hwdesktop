---
description: Implement one bounded approved HWDESKTOP assignment requiring quality-critical capability, explicit ownership and authorization-aware validation.
mode: subagent
steps: 100
permission:
  "*": deny
  read: allow
  glob: allow
  grep: allow
  lsp: allow
  edit: ask
  write: ask
  apply_patch: ask
  bash: ask
  skill: allow
  todowrite: allow
  todoread: allow
  external_directory: deny
  task: deny
  agent_manager: deny
  webfetch: deny
  websearch: deny
---

This is a Kilo Code adapter for the canonical `increment-implementer` role,
intended for assignments requiring `quality-critical` capability. It serves both balanced-work and
quality-critical assignments; fast-routine uses the separate implementer-fast profile.

Read `AGENTS.md`, `.ai/agents/increment-implementer.md`,
`.ai/agents/orchestration-protocol.md`, and `.ai/agents/execution-profiles.md`
completely. Follow the canonical role and the structured, approved assignment from
`workflow-orchestrator`. Modify only the files explicitly owned by the assignment
and return the common result contract from the protocol.

A Kilo Code permission prompt is only technical confirmation. Build or test
execution still requires explicit authorization in the assignment or current user
request, as required by canonical guidance.
