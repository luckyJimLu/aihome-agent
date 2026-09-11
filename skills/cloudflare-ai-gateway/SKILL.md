---
name: cloudflare-ai-gateway
description: Implement, review, or troubleshoot LLMFreeway integration with Cloudflare AI Gateway. Use for Dynamic Routes, provider/model routing, retries/fallbacks/timeouts, BYOK, Gateway authentication, spend/rate limits, route versions/deployments, logs, custom metadata, or AI Gateway API/SDK integration. Use runtime-contract-validation separately when external behavior must be proven for a project guarantee or PoC.
metadata:
  based_on:
    - Cloudflare AI Gateway documentation
    - cloudflare/skills AI Gateway references
  source_docs: https://developers.cloudflare.com/ai-gateway/
---

# Cloudflare AI Gateway

Treat AI Gateway as LLMFreeway's runtime data plane. Do not make this Skill a second source of truth for project cost, rollback, failure, identity, or artifact semantics.

## Authority

Before changing project behavior, read the relevant sections of:

- `docs/CONTRACTS.md` for canonical project semantics,
- `docs/ARCHITECTURE.md` for ownership boundaries,
- `docs/POC.md` when behavior remains an external hypothesis,
- the related GitHub issue when one exists.

If an AI Gateway behavior must support a hard project guarantee, route verification to `runtime-contract-validation` instead of treating documentation lookup as proof.

## Retrieval-first rule

Before writing exact endpoint paths, headers, route JSON, limits, billing behavior, retry semantics, or management API calls:

1. inspect the repository's current adapter/configuration,
2. retrieve current official Cloudflare documentation,
3. compare current platform behavior with the repository contract,
4. record unresolved uncertainty explicitly.

## References

Read only what the task requires:

- routing graph, route invocation, fallback/retry behavior -> `references/dynamic-routing.md`
- authentication, BYOK, billing, spend/rate limits -> `references/cost-auth.md`
- SDK/HTTP/Worker integration and adapter boundaries -> `references/integration.md`
- logs, analytics, deployment, smoke checks and rollback workflow -> `references/observability-deployment.md`

## Composition

Also use:

- `security-review` for credentials, auth, billing, paid ceilings, retry/fallback or deployment boundaries,
- `runtime-contract-validation` for PoC/live verification,
- `test-engineering` for fixtures or contract tests,
- `workers-best-practices` only when actual Worker code is involved,
- `wrangler` only when actual Wrangler config/CLI/resource deployment is involved,
- `feature-dev` for non-trivial multi-file work.

## Implementation workflow

1. Identify the logical route, environment, adapter, provider/account path and affected contract section.
2. Retrieve current AI Gateway behavior for the exact feature in scope.
3. Design the smallest adapter/configuration change; keep desired state in repository-owned artifacts.
4. Preserve explainable routing and explicit credential/billing boundaries.
5. Validate schema/config generation and local behavior.
6. Use `runtime-contract-validation` when a remote behavior must be established as evidence.
7. Report changed route/adapter behavior, validation actually performed and unresolved platform assumptions.

## Guardrails

- Do not duplicate `docs/CONTRACTS.md` defaults or thresholds here.
- Do not add a second large fallback tree outside the canonical routing design.
- Do not assume a published route proves provider access, cost safety or failure semantics.
- Do not expose provider or Cloudflare credentials in source, generated artifacts, logs or examples.
- Do not add hidden retry layers without accounting for their effective upstream-attempt impact under the canonical contract.
- Do not replay requests after visible streamed/tool output unless the canonical contract explicitly permits it and the behavior is verified.
- Do not use Workers/Wrangler Skills solely because AI Gateway is a Cloudflare product.
