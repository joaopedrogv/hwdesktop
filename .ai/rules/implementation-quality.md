---
name: implementation-quality
description: Keep implementation and review simple, reuse existing mechanisms and avoid redundant state, helpers and source comments.
always_apply: true
---

# Implementation Quality

Apply within the assigned change while preserving the owning area's conventions,
approved behavior, compiler compatibility and public contracts. Existing examples
are evidence to evaluate, including their comments.

## Simplicity and state

- Prefer existing mechanisms and the simplest correct representation. Before
  adding persistent fields, check what existing data or operation-local values
  already provide.
- Inspect contracts and actual callers before adding a helper, wrapper or alias.
  A separate member must serve current behavior or a required contract. Another
  name, language or hypothetical future variation is insufficient. Implement a
  required interface method directly when a local alias only forwards its result.
- Reuse an operation's precondition check and failure result when they already
  satisfy the caller. Review methods together with their callers to remove
  repeated checks and forwarding; preserve checks needed for distinct semantics
  or before other side effects.
- Retain cross-call state only for a necessary lifetime. Establish identity,
  invalidation and update points for new caches or recalculation flags, including
  failure and retry. Group fields describing one concept when it improves clarity.

## Source comments

- Default to no comment when names, types and code flow explain the code. Do not
  add method summaries or narrate parameters, returns, failure branches, checks,
  assignments or calls that are already clear. Prefer clearer code first.
- Add a comment only for an essential, non-obvious reason or constraint that the
  reader needs to change the code correctly. Ownership, order, failure handling
  or compatibility do not automatically justify a comment; the same clarity
  criterion applies.
- Keep that explanation short and direct, preferably one short sentence.
  Avoid explanatory blocks for straightforward methods and declarations.
- Explain once, at the owning contract or decision. Read the base declaration
  before commenting an override. An override needs no comment unless it adds an
  essential, non-obvious particularity; do not repeat the inherited contract in
  its declaration, body or callers.
- Evaluate copied comments independently of the reference code. During
  implementation and review, remove unnecessary comments added by the assignment
  rather than adding explanations for their presence.
- Write new or substantively revised comments in Brazilian Portuguese. Preserve
  technical identifiers, compiler directives and tool-recognized markers.
- Keep delivery schedules, pending increments, approval history and run-local
  decisions in task artifacts. Stable specification references may remain when
  essential to understanding the code.

## Messages and review findings

- Write a user-facing message at its point of use. Use a named constant when the
  same message is reused.
- Identify records using recognizable business labels, with enough data to
  distinguish them. Keep internal identifiers in diagnostic evidence when needed.
- Explain a finding's consequence and appropriate action in the user's vocabulary.
  State the data actually checked and match severity and success claims to the
  evidence. Respect valid precedence and intentional broad conditions.
