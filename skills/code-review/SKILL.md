---
name: code-review
description: Perform the final evidence-based review of meaningful LLMFreeway code changes for correctness, contract compliance, regressions, scope, and integration risk. Use after non-trivial implementation, before merge/release, or when a focused review is requested. Defer specialist security, frontend, Cloudflare runtime, testing, or contract analysis to the relevant Skill instead of duplicating every checklist here.
metadata:
  adapted_from: Anthropic code-review
  source: https://github.com/anthropics/claude-plugins-official/tree/main/plugins/code-review
  license: Apache-2.0
---

# Code Review

Review the changed scope, not the entire repository by default. Prefer high-confidence, actionable findings over speculative lists.

## Workflow

1. Identify intended behavior, governing issue and acceptance criteria.
2. Read `.agents/AGENTS.md`, relevant canonical contracts and surrounding code.
3. Inspect the diff plus enough context to prove each concern.
4. Confirm required specialist gates were used when relevant:
   - `security-review` for trust/credential/cost/deployment boundaries,
   - `control-plane-contracts` for schema/compiler/generated-artifact semantics,
   - `runtime-contract-validation` for external behavior claims,
   - `test-engineering` for executable contract coverage,
   - `web-design-guidelines` / `react-best-practices` for substantial frontend changes.
5. Review final integration for correctness, regression, scope creep, error/fallback behavior, maintainability and acceptance-criteria coverage.
6. Report only findings introduced or exposed by the change unless broader review was requested.
7. Rank by severity and confidence.

Read `references/review-policy.md` for reporting/filtering rules.

## LLMFreeway priorities

Pay special attention to managed cost/security constraints, deterministic generated state, stale or missing evidence, retries/fallbacks, rollback/reconciliation, provider/account scoping and claims that overstate unverified runtime behavior.

## Review behavior

Do not duplicate specialist checklists just to produce more findings. Do not report style-only nitpicks already handled by tooling unless they reveal a real maintainability issue. Trace data/control flow before calling something a bug or vulnerability.

When no high-confidence issue exists, say so.