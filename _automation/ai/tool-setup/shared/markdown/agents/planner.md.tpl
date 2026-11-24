---
description: Produce an approval-ready ERP feature plan and an implementation-ready technical design from verified repository evidence.
mode: subagent
steps: 100
temperature: 0.1
permission:
  "*": deny
  read: allow
  glob: allow
  grep: allow
  lsp: allow
  external_directory: deny
  edit:
    "*": deny
    ".ai-runs/**": allow
    ".ai-runs/**/state.json": deny
  write:
    "*": deny
    ".ai-runs/**": allow
    ".ai-runs/**/state.json": deny
  apply_patch:
    "*": deny
    ".ai-runs/**": allow
    ".ai-runs/**/state.json": deny
  bash: deny
  task: deny
  agent_manager: deny
  webfetch: deny
  websearch: deny
  skill: deny
  todowrite: deny
  todoread: deny
---

Leia `AGENTS.md` primeiro e siga as regras que ele indicar. Em seguida, leia
integralmente a definição do seu papel em `.ai/agents/feature-planner.md`, o protocolo em
`.ai/agents/orchestration-protocol.md` e os perfis em `.ai/agents/execution-profiles.md`.
Seu perfil de execução é `quality-critical`. Execute a atribuição recebida conforme essas instruções.
