# Next — AI working instructions

These instructions supplement ../AGENTS.md for Next work, including sources
identified with a Next header. See [Next screens](README.md) for the host API,
screen registration and build pairing.

## Scope and delivery

Implement only the agreed short, executable delivery. Combine UI, integration
and infrastructure when needed so the developer can open the application and
validate the result. Do not finish entire layers before providing usable behavior.
Grow documentation from implemented, verified contracts; do not anticipate Skills
or copy Modern's instruction system.

## Responsibilities

- Keep business domains, Use Cases, validations, Ports and reusable adapters in
  their owning Modern contexts, with one source of maintenance. Read
  ../Modern/AGENTS.md for that scope; Rio-only sources may also live in Modern.
- Next owns its presentation, internal service contracts, runtime composition
  and host integration. Build independent visual/read components; do not inherit
  uCadPadraoModal, uDataSet_OOP or legacy-backed Modern bases, or import the
  legacy global singleton as Next's context.
- The chosen stack is Delphi Rio 10.3.3/Win32, native VCL/TDBGrid and FireDAC.
  Grid-only reads use an encapsulated native dataset with the complete filtered
  result; no mandatory business Use Case, Port or intermediate record list.
  Business operations continue through their Modern contracts.
- Use Spring4D only in composition and supply dependencies to consumers. Do not
  resolve dependencies from a global container in forms, presenters or Use Cases.
- The ERP host supplies session and connection data. Keep resource ownership
  explicit. The host side targets Delphi 2006; the module side targets Rio.
  Cross that boundary through an explicit ABI, not Delphi objects, datasets or
  containers. Sharing source does not share objects between the two runtimes.

## Window lifecycle

- Open forms through the shared bridge API and a stable textual identifier.
  Register a creation function in the DLL catalog. It composes dependencies
  when a new instance is needed.
- Editable forms report pending edits through HasPendingChanges. The base
  confirms individual closes and the host applies the instance's close policy.
  User changes and ERP shutdown use collective closure.
- Keep MDI/modal presentation, single/multiple instances and hide/destroy-on-close
  policies distinct. Queries default to a reusable single instance with hiding.
  Modal openings use their own instance, normally destroyed when closed, without
  converting an existing MDI instance into a modal.
- Common window management coordinates the Delphi 2006 host wrapper and Rio
  content. It finds reusable instances before construction; the Next base form
  supplies common integration so descendants do not repeat lifecycle machinery.
- The ERP changes users, not companies. User changes invalidate all retained
  windows, including hidden ones. Collective shutdown releases those instances
  regardless of their individual close policy; do not reuse an old user's view.
- Hidden instances still own resources. Do not unload the DLL merely because no
  windows are visible. Preserve module ownership and safe callback/message lifetimes.

## Compatibility and continuity

Within Next/, Delphi Rio 10.3.3 is the default. Do not add a redundant Next header.
Use `// Delphi 2006` on the first line for sources that must preserve Delphi 2006
compatibility. This is a compatibility requirement, not a prohibition on Rio use:
shared ABI contracts must support both actual consumers and their dependencies.

For sources owned by Modern/, follow ../Modern/.ai/rules/delphi-compatibility.md,
including its Next marker and explicit dual-target exception. A marker does not
relocate a source or replace its owner's rules. Preserve encoding and line endings;
do not annotate or convert existing sources in bulk. Follow the root execution
authority boundaries; this entry grants no additional build, test or database
execution.

Use the approved plan for the current delivery. Context and reasons are in
D:/Hw/ai-docs/hwdesktop/temas/modernizacao-delphi/README.md; consult only the
relevant record when needed. Record actual capabilities as work advances.
