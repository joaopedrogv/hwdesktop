---
description: Implement a well-defined approved assignment using fast-routine, with or without an applicable Skill.
mode: subagent
steps: 60
temperature: 0.1
permission:
  "*": deny
  read: allow
  glob: allow
  grep: allow
  lsp: allow
  edit: ask
  write: ask
  apply_patch: ask
  bash:
    "*": ask
    "./_automation/build/build-next.ps1": allow
    "& ./_automation/build/build-next.ps1": allow
    "pwsh -NoProfile -File ./_automation/build/build-next.ps1": allow
  skill: allow
  todowrite: allow
  todoread: allow
  external_directory: deny
  task: deny
  agent_manager: deny
  webfetch: deny
  websearch: deny
---

Leia `AGENTS.md` primeiro e siga as regras que ele indicar. Em seguida, leia
integralmente a definição do seu papel em `.ai/agents/increment-implementer.md`, o protocolo em
`.ai/agents/orchestration-protocol.md` e os perfis em `.ai/agents/execution-profiles.md`.
Seu perfil de execução é `fast-routine`. Execute a atribuição recebida conforme essas instruções.
