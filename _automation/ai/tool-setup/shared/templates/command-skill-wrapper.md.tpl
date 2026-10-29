{{canonicalFrontmatter}}

# Canonical Command Adapter

This Skill exposes the canonical `{{commandName}}` Command through the shared
agent-skill discovery path.

Read `AGENTS.md` and `{{canonicalCommandPath}}` completely before acting.
Follow the canonical Command and every artifact it dispatches to.

When this Command starts or resumes a Workflow, the calling primary Agent MUST
assume the canonical `workflow-orchestrator` role
itself. Completely read `.ai/agents/workflow-orchestrator.md`,
`.ai/agents/orchestration-protocol.md`, `.ai/agents/execution-profiles.md`, and the
selected Workflow. Remain strictly within the Orchestrator responsibilities: own
the persistent state, routing, assignments, human gates, accepted results, and
developer communication, and prescribed canonical operational automation. Read the
selected operational Skill and execute its script directly when the Workflow
requires it. Preserve build/test authorization gates. Do not perform Specialist
research, planning, implementation, or independent review.

In Codex, invoke each required Specialist directly from the primary Agent through
the native Subagent mechanism, using the exact configured `*` custom Agent
name as `agent_type`, exactly once per assignment attempt, and wait for its result.
Start every named custom Agent without a full-history fork: set
`fork_context: false` or omit `fork_context`; never combine an explicit
`agent_type` with `fork_context: true`. Pass every required decision, constraint,
authorization boundary, canonical path, and expected result in a complete,
self-contained assignment message. If a required invocation is unavailable,
rejected, or not observably issued, follow the canonical fail-closed and supervised
manual-mode rules. Never ask a Specialist to create nested Subagents.

Use this exact Codex routing table. A configured Agent may satisfy a weaker profile
only when this table explicitly says so; never label or persist a lower-profile
Agent as if it fulfilled a stronger assignment:

- `repository-researcher` + `fast-routine` ->
  `researcher`;
- `repository-researcher` + `balanced-work` or `quality-critical` ->
  `researcher-critical`;
- `feature-planner` + `balanced-work` or `quality-critical` ->
  `planner`;
- `increment-implementer` + `fast-routine` ->
  `implementer-fast`;
- `increment-implementer` + `balanced-work` ->
  `implementer`;
- `increment-implementer` + `quality-critical` ->
  `implementer-critical`;
- `increment-reviewer` + `balanced-work` or `quality-critical` ->
  `reviewer`.

After a successful Codex invocation, keep the primary turn active while any
assignment remains `issued` or `active`. Use the native Agent wait mechanism in
bounded intervals of at most 60 seconds and repeat it until the Agent returns a
terminal result, the developer sends new input, or the Workflow persists a genuine
terminal blocker or failure. A timeout with no state change is not completion: do
not end the turn, ask the developer to prompt again, reread run artifacts, or emit
repetitive status. Immediately wait again, providing only the concise progress
updates required by the active tool. When a result arrives, validate and register
it before issuing dependent work, and release completed Agent slots when the native
mechanism requires it.

Codex Specialists configured as read-only MUST return the complete requested run
artifact in their result instead of claiming to have written it. The primary
Orchestrator may persist that returned content literally to the explicitly owned
path under `.ai-runs/<run-id>/`. It MUST NOT supplement, rewrite, or make technical
decisions while persisting it. If correction or synthesis is needed, assign it back
to the applicable Specialist. This exception does not authorize the Orchestrator to
inspect implementation or produce Specialist content.

The feature-planner is writable for its exact assigned planning documents under
the current run. It saves and verifies its own plan or design and returns the paths.
Do not apply the read-only persistence fallback to the planner. If it cannot save,
record its blocker and correct the profile or use supervised manual mode.

Persist only lifecycle states defined by `.ai/agents/orchestration-protocol.md` or
an explicit compatible extension named by the selected Workflow. Do not invent a
new state merely to represent a pending approval. Keep the current canonical phase
and record that approval in `pending_gate`; transition only after the developer's
decision permits the next canonical state. When resuming a run containing an
adapter-invented state, preserve its history and reconcile it to the matching
canonical phase before issuing new work.

For other tools, use the native delegation mapping of the primary Orchestrator
profile for Specialists. Do not invoke an intermediate Orchestrator Subagent.

Invoking this adapter does not expand the developer's request or grant
implementation, build, test, integration, release, publication, or remote-mutation
authorization that was not explicitly provided.
