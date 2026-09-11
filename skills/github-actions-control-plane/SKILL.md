---
name: github-actions-control-plane
description: Design, implement, or review GitHub Actions workflows used as the LLMFreeway control-plane scheduler/controller. Use for catalog discovery schedules, reconciliation jobs, route deployment workflows, CI gates, concurrency, environments, permissions, artifacts, state branches, secret scope, or workflow-trigger safety.
---

# GitHub Actions Control Plane

Treat GitHub Actions as orchestration, not as the source of domain truth. Repository code, schemas and contracts own behavior; workflows should invoke those deterministic tools with explicit permissions and state boundaries.

## Workflow

1. Read the governing issue, `docs/CONTRACTS.md`, `docs/ARCHITECTURE.md`, `docs/SECURITY.md`, and existing workflows/scripts.
2. Identify trigger, inputs, outputs, state mutation, credentials, environment and concurrency hazards.
3. Keep workflow YAML thin; put domain logic in tested repository scripts/modules.
4. Use least-privilege `permissions` and environment-scoped secrets.
5. Prevent stale/concurrent runs from racing production state.
6. Sanitize logs/artifacts and separate observation artifacts from desired state.
7. Validate workflow syntax plus the invoked scripts/tests.

Read `references/security-and-state.md` for deployment/security/state rules.

## Rules

- Do not put production provider credentials in ordinary CI jobs.
- Pin security-sensitive third-party actions to immutable commit SHAs when practical and consistent with repository policy.
- Use explicit `permissions`; do not rely on broad defaults.
- Use environments/protection rules for production-affecting jobs when available.
- Use `concurrency` when overlapping runs could publish stale desired state or duplicate deployment.
- Never let a discovery job directly weaken cost/security policy; discovery produces evidence/state for deterministic policy compilation.
- Keep generated artifacts auditable and sanitized.
- Do not encode large business rules directly in workflow expressions or shell one-liners.

## Composition

Use `security-review` for credentials/supply-chain/deployment boundaries, `control-plane-contracts` when workflows publish or consume policy artifacts, `test-engineering` for controller scripts, and `runtime-contract-validation` for live external checks.

## Completion

Report trigger/cadence, permissions, environment/secrets scope, concurrency behavior, state/artifacts touched, validation performed and any production risk that remains.