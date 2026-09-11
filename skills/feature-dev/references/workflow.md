# Feature Development Workflow

Use this checklist only for substantial feature work.

## 1. Issue and discovery contract

When a related GitHub issue exists, read it first and capture:

- priority and delivery stage,
- dependencies/blockers,
- user-visible outcome,
- acceptance criteria,
- explicit non-goals,
- closure evidence,
- cost/security constraints.

Turn each acceptance criterion into a planned verification step. Do not treat documentation-only changes as completion when code/tests/evidence are required.

## 2. Current-state exploration

Inspect the smallest useful set of sources:

- current entry points and similar implementations,
- shared types/schemas,
- existing tests and scripts,
- `docs/CONTRACTS.md`,
- `docs/ARCHITECTURE.md`,
- `docs/POC.md` when external behavior is uncertain,
- `docs/ROADMAP.md`,
- related issues.

Explicitly distinguish **implemented now** from **planned in docs**. Do not build on a planned command/module/service as if it already exists.

## 3. Dependency gate

Before implementation, verify required upstream issues/capabilities are actually complete enough for this task. If a dependency is missing, implement only the safe prerequisite if it is in scope; otherwise report the blocker rather than inventing an interface.

## 4. Architecture

Prefer, in order:

1. reuse an existing pattern,
2. small extension to an existing abstraction,
3. focused new abstraction,
4. new dependency/service only when justified.

Check impact on schemas/contracts, failure behavior, security boundaries, cost enforcement, testability, compatibility and observability.

## 5. Implementation

Implement in small coherent steps. Keep unrelated code untouched, preserve public behavior unless intentionally changed, keep secrets out of source/artifacts/logs/fixtures, and avoid silent fallback.

## 6. Specialist gates

Load domain Skills only when relevant, for example `control-plane-contracts`, `runtime-contract-validation`, `test-engineering`, `github-actions-control-plane`, `cloudflare-ai-gateway`, frontend Skills, and `security-review`.

## 7. Verification and closure evidence

Run only commands that actually exist in the repository. Map results back to acceptance criteria and closure requirements.

For the current frontend package, known checks may include:

```bash
npm run lint
npm run build
```

Use additional tests/schema/agent validation only after confirming the scripts exist.

## Completion report

Summarize files changed, acceptance criteria satisfied, checks/evidence produced, unresolved blockers/limitations, and `Skills used:`.