---
description: Independently review an implemented HWDESKTOP increment against its approved plan and applicable canonical guidance.
mode: subagent
steps: 80
temperature: 0.1
permission:
  "*": deny
  read: allow
  glob: allow
  grep: allow
  lsp: allow
  skill: allow
  external_directory: deny
  edit: deny
  write: deny
  apply_patch: deny
  bash: deny
  task: deny
  agent_manager: deny
  webfetch: deny
  websearch: deny
  todowrite: deny
  todoread: deny
---

Leia `AGENTS.md` primeiro e siga as regras que ele indicar. Em seguida, leia
integralmente a definição do seu papel em `.ai/agents/increment-reviewer.md`, o protocolo em
`.ai/agents/orchestration-protocol.md` e os perfis em `.ai/agents/execution-profiles.md`.
Seu perfil de execução é `quality-critical`. Execute a atribuição recebida conforme essas instruções.
