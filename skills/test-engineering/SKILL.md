---
name: test-engineering
description: Design, add, or review tests for LLMFreeway behavior and contracts. Use for Vitest/unit tests, fixtures, snapshots, integration tests, failure injection, deterministic compiler tests, route-policy tests, or acceptance criteria that require executable verification. Live provider/Cloudflare tests must be explicit, quota-aware, and separated from normal CI.
---

# Test Engineering

Test behavior and contracts, not implementation trivia.

## Workflow

1. Read the governing issue/acceptance criteria and relevant canonical contract.
2. Identify the smallest test layer that can prove the behavior.
3. Reuse existing fixtures/helpers before creating new infrastructure.
4. Add normal-path, boundary and failure-path coverage.
5. Keep live/network tests opt-in and isolated from default CI.
6. Run the narrowest relevant test command that actually exists.
7. Report what the tests prove and what remains unverified.

Read `references/test-matrix.md` when choosing test levels for schemas, compilers, routing, PoCs or deployment logic.

## Priorities

Prefer deterministic local tests for:

- Zod/YAML schema validation,
- FREE_ONLY and paid-policy intersections,
- capability/access filtering,
- deterministic generated manifests/routes,
- retry/fallback budget calculations,
- failure classification,
- state reconciliation,
- redaction and artifact safety.

Use `runtime-contract-validation` when a remote platform behavior itself is the subject under test.

## Rules

- Do not delete or weaken a failing test merely to pass CI.
- Do not mock away the behavior the test is supposed to prove.
- Keep fixtures sanitized and stable.
- Snapshot generated artifacts only when byte/shape stability is part of the contract.
- Separate provider/network flakiness from deterministic unit failures.
- Never require production credentials in default CI.
- Do not claim a live integration was tested unless the live check actually ran.

## Completion

State tests added/updated, commands run, coverage intent, failures found, and remaining untested risk.