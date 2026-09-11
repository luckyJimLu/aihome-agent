# Code Review Policy

## Purpose

`code-review` is the final integration/correctness gate. Specialist Skills should own deep security, frontend, platform-runtime, test, and control-plane analysis; this policy consumes their evidence rather than duplicating every checklist.

## Severity

- **Blocker** — unsafe release, data/secret exposure, managed-policy bypass, destructive behavior, or major correctness failure.
- **High** — likely user-visible bug, material security weakness, contract violation, broken failure handling, or missing required acceptance behavior.
- **Medium** — meaningful maintainability, reliability, accessibility, deterministic-output, or performance issue with concrete impact.
- **Low** — useful polish; normally omit unless exhaustive review is requested.

## Confidence

Prefer findings strongly supported by code, repository contracts, tests, runtime evidence, or a clear acceptance-criteria mismatch. As a practical rule, report concerns at roughly 80/100 confidence or higher unless potential impact is severe and uncertainty is explicit.

## Review inputs

Before final review, identify when relevant:

- governing GitHub issue and acceptance criteria,
- canonical `docs/CONTRACTS.md` sections,
- changed code/config/generated artifacts,
- tests/fixtures and actual command results,
- evidence produced by `runtime-contract-validation`,
- specialist review results from `security-review`, `control-plane-contracts`, `web-design-guidelines`, `react-best-practices`, or other applicable Skills.

Missing required specialist evidence can itself be a review finding when the issue/contract requires it.

## False-positive filtering

Normally omit:

- pre-existing unrelated problems,
- subjective style preferences,
- issues already guaranteed to fail current tooling unless the failure itself matters,
- hypothetical scaling concerns without present evidence,
- intentional behavior documented by a canonical contract,
- duplicate findings with the same root cause,
- speculative external-platform claims not backed by current docs or runtime evidence.

## Verification questions

Before reporting a finding, ask:

1. Is the behavior reachable in the changed scope?
2. Is the problematic input/state possible?
3. Does another layer already prevent or validate it?
4. Does it violate a canonical contract or acceptance criterion?
5. Was it introduced/exposed by the current change?
6. Is required specialist evidence missing or contradictory?
7. For generated artifacts, is output deterministic and free of secret values?
8. Can the finding point to a concrete location and realistic fix?

## LLMFreeway integration checks

For routing/control-plane changes, verify at final integration level that restrictive eligibility decisions are not reintroduced later, generated artifacts remain deterministic where required, paid execution is not enabled outside canonical policy, unknown/stale evidence does not silently qualify, retries/fallbacks do not bypass failure/cost contracts, credentials remain references rather than values, and rollback/reconciliation does not treat historical state as automatically safe.

Use the relevant specialist Skill for detailed analysis rather than expanding this section indefinitely.

## Output format

Prefer:

```text
severity — file:line — concise finding
Why it matters: ...
Evidence: ...
Recommended fix: ...
```

Put findings first. Add a short summary after findings. If no material issue is found, state that directly and mention validation/evidence limitations.