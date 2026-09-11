---
name: code-simplifier
description: Simplify recently changed LLMFreeway code while preserving exact behavior only when the user explicitly requests simplification or concrete complexity remains after correctness is established, such as unnecessary nesting, duplication, indirection, stale comments, or overly clever control flow. Do not activate automatically after every feature or refactor.
metadata:
  adapted_from: Anthropic code-simplifier
  source: https://github.com/anthropics/claude-plugins-official/tree/main/plugins/code-simplifier
  license: Apache-2.0
---

# Code Simplifier

This is an optional quality pass, not a mandatory post-feature stage.

Use it only after the changed behavior is already understood and verified enough that preserving behavior is realistic, and only when there is concrete simplification value.

## Scope

Focus on recently modified code unless a broader cleanup is explicitly requested. Do not turn a targeted cleanup into a repository-wide refactor.

## Trigger evidence

Good reasons to use this Skill include:

- duplicated branches or transformations,
- avoidable nesting,
- unnecessary indirection/wrappers,
- stale comments made obsolete by the change,
- overly clever expressions that obscure behavior,
- repeated local logic that can be safely consolidated.

Do not use it merely because implementation just finished.

## Workflow

1. Read the changed code and nearby conventions.
2. Identify concrete complexity with a clear before/after benefit.
3. Confirm the simplification does not alter public interfaces, contracts, ordering, failure behavior, cost/security semantics, or generated output.
4. Make the smallest readability improvement.
5. Run the most relevant validation that actually exists.
6. Review the diff to ensure scope did not expand.

## Guardrails

Treat `docs/CONTRACTS.md` as behavior, not implementation detail. Never weaken cost ceilings, FREE_ONLY behavior, credential boundaries, failure/fallback rules, deterministic artifacts, or validation strictness.

If exact behavior preservation is uncertain, leave the code unchanged and report the concern instead.