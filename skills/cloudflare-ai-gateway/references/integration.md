# Integration and Adapter Boundaries

Current official references:

- https://developers.cloudflare.com/ai-gateway/get-started/
- https://developers.cloudflare.com/ai-gateway/features/dynamic-routing/usage/
- https://developers.cloudflare.com/ai-gateway/usage/rest-api/
- https://developers.cloudflare.com/ai-gateway/usage/worker-binding-methods/
- https://developers.cloudflare.com/ai-gateway/usage/providers/
- https://developers.cloudflare.com/ai-gateway/glossary/

## Choose endpoint by use case

Do not use one AI Gateway endpoint family for every use case.

For new single-model integrations, follow the current REST API or Worker binding guidance.

For LLMFreeway Dynamic Routes, follow the current Dynamic Route usage guide. As of 2026, route invocation uses the AI Gateway compatibility endpoint and a `dynamic/<route-name>` model identifier.

Do not replace a working Dynamic Route call with a single-model REST call merely because the latter is newer.

## Keep an adapter boundary

Cloudflare integration should remain behind an LLMFreeway gateway adapter so platform changes do not leak through the entire project.

Prefer:

```text
policy compiler
    -> normalized route model
        -> cloudflare gateway adapter
            -> Cloudflare route/API representation
```

The policy compiler should not depend directly on transient Cloudflare response shapes when a stable internal representation is sufficient.

## Generated artifacts

Use the repository's canonical artifacts from `docs/CONTRACTS.md`.

The generated route should include enough normalized information to explain:

- policy commit,
- logical alias,
- ordered eligible candidates,
- provider/model identity,
- effective constraints,
- exclusions/evidence where required.

Do not include secret values.

Avoid wall-clock-only noise in deterministic desired-state artifacts.

## Model and capability compatibility

Before placing candidates in the same fallback chain, validate the safe client-visible capability intersection required by the project contract.

Check as applicable:

- context window,
- output limits,
- streaming,
- tools/tool calls,
- structured-output dialect,
- modalities,
- provider-specific request differences.

Do not advertise a union of capabilities when fallback candidates cannot all satisfy it.

## Authentication path

Gateway authentication and upstream provider authentication are separate.

At integration boundaries, explicitly model:

```text
Cloudflare gateway credential
provider/account credential reference or Unified Billing path
logical route
project/role metadata
```

Never expose provider credentials to the browser or client config merely to simplify integration.

## Custom metadata

Use metadata to improve traceability and policy attribution, not as a second policy engine.

Good candidates include stable non-secret identifiers such as:

- project profile,
- logical role/alias,
- policy version/hash,
- request class when required for a route condition.

Verify current Cloudflare limits before depending on a particular number of metadata dimensions.

## Response metadata

When Dynamic Route response headers identify selected provider/model, capture them in adapter-level diagnostics where useful.

Do not make business logic depend on undocumented response headers. Use documented headers only and keep retrieval-first verification.

## Error normalization

Normalize platform/provider failures into project-level categories rather than leaking every upstream shape through the control plane.

Distinguish at minimum:

- gateway authentication failure,
- provider credential failure,
- policy/rate/spend limit block,
- invalid/unsupported request,
- transient provider failure,
- timeout,
- interrupted streaming response,
- no eligible/safe candidate.

Never translate these into a generic fallback that weakens cost/security policy.

## Migration rule

When Cloudflare deprecates an endpoint or introduces a new API:

1. Retrieve current official migration guidance.
2. Determine whether Dynamic Routes support the new path.
3. Compare authentication, billing, streaming, tools, and response semantics.
4. Add adapter coverage/tests.
5. Migrate behind the adapter.
6. Do not change public LLMFreeway semantics unless required and documented.
