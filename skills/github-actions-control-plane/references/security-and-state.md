# GitHub Actions Security and State

Use this reference for workflows that read/write repository state, run scheduled discovery, or deploy routing changes.

## Permissions

- Set explicit least-privilege `permissions` at workflow or job level.
- Separate read-only discovery from write/deploy jobs.
- Keep production credentials out of PR/untrusted contexts.
- Prefer environment-scoped secrets and protection rules for production changes.
- Treat third-party actions as supply-chain dependencies; pin sensitive actions to immutable SHAs when practical.

## Concurrency and stale runs

Use a concurrency key when overlapping runs can publish the same state or deploy the same environment. A newer run must not allow an older stale run to overwrite newer desired state.

For scheduled controller workflows, make reconciliation idempotent and compare the intended revision/state before mutation.

## State ownership

Keep:

- desired policy/configuration in normal repository-controlled sources,
- generated deterministic artifacts in their documented generated locations,
- operational observations/evidence in their documented state/evidence locations,
- credentials only in approved secret stores.

Do not turn workflow artifacts, caches or job environment variables into a hidden second database.

## Artifacts and logs

Before upload/logging:

- redact tokens/keys/auth headers,
- avoid raw sensitive prompts/provider payloads,
- include revision/schema/version metadata needed for audit,
- use bounded retention where appropriate.

## Deployment jobs

Production-affecting jobs should validate the exact revision/artifacts they deploy, enforce contract/security gates, record deployment identity, and fail closed when required evidence is missing or stale.