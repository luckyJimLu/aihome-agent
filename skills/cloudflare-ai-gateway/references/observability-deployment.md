# Observability, Deployment, and Rollback

Current official references:

- https://developers.cloudflare.com/ai-gateway/observability/logging/
- https://developers.cloudflare.com/ai-gateway/observability/analytics/
- https://developers.cloudflare.com/ai-gateway/observability/custom-metadata/
- https://developers.cloudflare.com/ai-gateway/reference/limits/
- https://developers.cloudflare.com/api/resources/ai_gateway/subresources/dynamic_routing/

## Logging

AI Gateway logs can include request/response payloads, provider/model outcome, status, duration, token usage, and cost information.

Before relying on logs:

- confirm gateway logging is enabled,
- decide whether prompts/responses may be retained,
- understand plan/storage limits,
- use authenticated gateways,
- avoid writing secrets into prompt metadata or test payloads,
- consider DLP/guardrails requirements where applicable.

Logging settings do not define the upstream provider's own retention policy.

## Smoke-test evidence

A production-route smoke test should capture non-secret evidence sufficient to prove runtime behavior.

Useful evidence includes:

- route name/version/deployment identity,
- request status,
- selected provider/model,
- fallback step when observable,
- duration,
- token/cost information when available,
- failure category.

Keep prompts deterministic and non-sensitive.

## Deployment model

Treat route publication and route deployment as separate versioned operations when the current API exposes them that way.

Preferred LLMFreeway flow:

```text
desired policy commit
    -> deterministic generated route
    -> diff against current deployment
    -> pre-deploy policy validation
    -> create/update route version
    -> deploy intended version
    -> smoke test
    -> record manifest/deployment result
```

Do not publish from stale CI runs. Verify the intended policy commit and expected current deployment before mutation.

## Route management API

Cloudflare currently exposes REST management APIs for Dynamic Route CRUD, versions, and deployments.

Use the current Cloudflare API reference for exact request/response schemas and permissions. Do not hardcode old JSON shapes based only on examples in this repository.

Use scoped tokens with the minimum required AI Gateway permissions.

## Rollback

Rollback means selecting a previously created version, not declaring historical state safe.

Before rollback:

1. Revalidate provider access.
2. Revalidate prices/allowances and billing path.
3. Revalidate credential references.
4. Revalidate required capabilities.
5. Revalidate route limits/retry semantics.
6. Confirm the historical version still satisfies the current project contract.

If no historical version is safe, use the project's verified block/disable mechanism instead of restoring a known-unsafe route.

## Drift

Treat dashboard edits as possible runtime drift.

Before an automated sync:

- retrieve deployed state,
- compare it to the expected deployment ledger/manifest,
- detect unexpected manual changes,
- avoid blindly overwriting unexplained production drift.

The Git repository owns desired state; the platform owns actual deployed state; synchronization must compare both.

## Troubleshooting order

When a request fails, identify the failing layer before changing configuration:

```text
client format/auth
    -> gateway authentication
    -> route condition/limit
    -> upstream credential/billing
    -> provider request/model capability
    -> timeout/retry/fallback
    -> response streaming/client handling
```

Do not infer the failing layer from a status code alone.

Inspect AI Gateway logs/analytics and response metadata where available, then correlate with the generated route manifest.

## Production gate

Do not describe a deployment as validated solely because:

- the management API returned success,
- a route version exists,
- a build passed,
- a single happy-path request succeeded.

For safety-sensitive routing, validate the relevant failure, cost, authentication, and fallback paths required by `docs/CONTRACTS.md` and `docs/POC.md`.
