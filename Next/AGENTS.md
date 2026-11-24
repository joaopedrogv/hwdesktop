# Next — AI working instructions

These instructions supplement ../AGENTS.md for Next work, including Modern
sources identified with a Next compatibility header.

## Scope and required guidance

Next owns presentation, runtime composition and host integration; reusable
business code remains in its owning Modern contexts. Read ../Modern/AGENTS.md
when those sources are involved. A header does not replace the owning area's rules.

Read ../.ai/rules/next-architecture.md for Next work. For forms, frames,
Presenters, View contracts or host window/session integration, also read
../.ai/rules/next-ui.md. Shared implementation quality is loaded by the root entry;
Next Delphi sources also use ../.ai/rules/delphi-coding-standards.md.

Implement only the agreed short, executable delivery. Combine UI, integration
and infrastructure when needed to provide behavior the developer can validate.
Grow guidance from implemented contracts; do not anticipate Skills or copy
Modern's instruction system.

For creating or refactoring a consultation screen or cadastro editor, use
../.ai/skills/next-consulta-cadastro/SKILL.md and select the steps relevant to the
assigned delivery.

## Compatibility

Within Next/, Delphi Rio 10.3.3/Win32 is the default. Do not add a redundant Next
header. Use // Delphi 2006 on the first line for sources that must preserve that
compatibility, including shared ABI contracts and their dependencies.

For Modern-owned sources, follow ../Modern/.ai/rules/delphi-compatibility.md.
Preserve its Next markers and explicit dual-target exception. Source headers and
compiler defaults do not authorize encoding conversion or bulk annotation.

## Build validation

When an authorized implementation affects hw.next.dll, compile it in the working
clone before handoff. From the clone root, run

    pwsh -NoProfile -File ./_automation/build/build-next.ps1

Fix compiler errors caused by the assignment and rerun. Report the outcome or the
concrete blocker. See ../.ai/rules/repository-safety.md for the standing build
grant and ../_automation/build/README.md#compilar-e-publicar-next for output paths.
The DLL goes to bpl/hw.next.dll; DCUs go to Next/Projects/output/dcu-rio/.

## References

README.md describes the host API and screen registration. Use the approved plan
for the current delivery. Context and reasons are in
D:/Hw/ai-docs/hwdesktop/temas/modernizacao-delphi/README.md; consult only the
relevant record when needed.
