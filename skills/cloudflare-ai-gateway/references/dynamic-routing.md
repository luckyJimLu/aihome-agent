# Dynamic Routing

Use current Cloudflare AI Gateway documentation as the authority for route schema and invocation behavior.

Current official references:

- https://developers.cloudflare.com/ai-gateway/features/dynamic-routing/
- https://developers.cloudflare.com/ai-gateway/features/dynamic-routing/usage/
- https://developers.cloudflare.com/ai-gateway/features/dynamic-routing/json-configuration/
- https://developers.cloudflare.com/api/resources/ai_gateway/subresources/dynamic_routing/
- https://developers.cloudflare.com/ai-gateway/configuration/request-handling/
- https://developers.cloudflare.com/ai-gateway/configuration/fallbacks/

## LLMFreeway route model

Treat each public logical model as a named Dynamic Route only after it has qualified candidates.

```text
role/policy compiler
    -> .generated/role-manifest.json
    -> .generated/routes/<alias>.json
    -> AI Gateway route version
    -> deployed route
```

The generated route must remain derivable from the policy/evidence snapshot. Do not make the dashboard the canonical desired-state editor.

## Invocation

As of the 2026 Cloudflare documentation, Dynamic Routes are invoked through the AI Gateway compatibility path using a model value such as:

```text
dynamic/<route-name>
```

Cloudflare's newer REST inference API is preferred for new single-model integrations, but do not assume it can invoke Dynamic Routes. Verify the current Dynamic Route usage documentation before changing the endpoint.

Route-management REST APIs and route-invocation APIs are separate concerns. Cloudflare exposes API operations for route CRUD, versions, and deployments even when runtime invocation uses the compatibility endpoint.

## Route graph rules

When compiling a route:

1. Start from qualified candidates only.
2. Preserve deterministic candidate order.
3. Apply policy constraints before ranking.
4. Encode only conditions that the data plane can evaluate reliably.
5. Keep route logic explainable from the manifest.
6. Avoid duplicating business policy in both generated route JSON and hand-maintained dashboard state.

Use current JSON Configuration docs for exact element names and properties.

## Fallback

Fallback exists to preserve reliability inside already-approved policy boundaries.

Never use fallback to relax:

- FREE_ONLY,
- paid ceilings,
- provider allow-lists,
- capability requirements,
- credential restrictions,
- security policy.

If all eligible candidates fail, return explicit route failure or move to the project's verified blocking state.

## Retry accounting

AI Gateway supports retry configuration and Dynamic Routing can also combine retries/timeouts/fallbacks. Cloudflare currently also supports gateway-level automatic upstream retries.

Before changing retry settings, compute the worst-case upstream attempt count across all layers.

For LLMFreeway, `docs/CONTRACTS.md` owns the allowed attempt/deadline policy. Platform defaults must not silently increase it.

Review:

```text
client retries
adapter retries
gateway retries
model-node retries
fallback count
provider SDK retries
```

Count every paid attempt toward the request cost policy.

## Streaming

Fallback before any client-visible output may be acceptable when it remains within deadline/cost policy.

After response bytes or tool-call output have been exposed:

- do not transparently replay,
- surface an explicit interrupted response according to the project contract,
- do not automatically repeat tool execution.

Verify current Cloudflare streaming/fallback behavior in the PoC before claiming the gateway enforces this by itself.

## Response evidence

Dynamic Route responses expose route outcome metadata such as the selected model/provider in Cloudflare response headers. Use current docs for the exact headers.

Capture enough non-secret evidence in smoke tests to prove:

- which route was invoked,
- which provider/model served it,
- whether fallback occurred,
- request status/duration,
- relevant cost/token data when available.

Do not expose credentials or user prompt content in test artifacts unless explicitly safe and required.
