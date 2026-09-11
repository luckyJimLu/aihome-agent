---
name: feature-dev
description: Plan and implement non-trivial LLMFreeway features that touch multiple files, are associated with a GitHub issue, require architectural choices, or change routing/configuration behavior. Use when the task is larger than a small isolated fix; when an issue exists, treat its priority, dependencies, acceptance criteria, non-goals, and closure evidence as the execution contract.
metadata:
  adapted_from: Anthropic feature-dev
  source: https://github.com/anthropics/claude-plugins-official/tree/main/plugins/feature-dev
  license: Apache-2.0
---

# Feature Development

Use a structured workflow for substantial work that needs codebase understanding before implementation.

## Core workflow

1. **Discover** — identify the user-visible outcome and governing issue.
2. **Read the issue contract** — capture priority, delivery stage, dependencies, acceptance criteria, non-goals, and closure evidence.
3. **Explore** — inspect relevant code, tests, contracts, roadmap items, and similar implementations.
4. **Design** — choose the smallest architecture that satisfies the current delivery stage and existing contracts.
5. **Implement** — make focused changes consistent with repository conventions.
6. **Verify** — turn acceptance criteria into concrete checks and run only commands/tests that actually exist.
7. **Review and report** — inspect the diff, specialist gates, closure evidence, and remaining risk.

Read `references/workflow.md` for the detailed checklist.

## LLMFreeway-specific constraints

Before changing routing, provider, model, policy, deployment, cost, evidence, generated artifacts, or control-plane behavior, inspect the relevant sections of `docs/CONTRACTS.md` and `docs/ARCHITECTURE.md`.

Do not treat planned architecture as implemented behavior. Confirm the current repository state first.

## Composition

Use domain Skills when they materially apply:

- `control-plane-contracts` for schemas/compiler/generated artifacts,
- `runtime-contract-validation` for PoC/external behavior evidence,
- `test-engineering` for executable acceptance tests,
- `github-actions-control-plane` for Actions/GitOps controller work,
- `cloudflare-ai-gateway` for AI Gateway adapter/runtime integration,
- frontend Skills only when UI work is explicitly in scope,
- `security-review` for sensitive/trust-boundary changes,
- `code-review` before considering a meaningful implementation complete,
- `code-simplifier` only when concrete complexity remains after correctness is established.

Do not use this Skill for typo fixes or obvious isolated corrections.