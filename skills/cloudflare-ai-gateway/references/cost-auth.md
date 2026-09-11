# Cost, Authentication, and Credential Boundaries

Current official references:

- https://developers.cloudflare.com/ai-gateway/configuration/authentication/
- https://developers.cloudflare.com/ai-gateway/configuration/bring-your-own-keys/
- https://developers.cloudflare.com/ai-gateway/features/unified-billing/
- https://developers.cloudflare.com/ai-gateway/features/spend-limits/
- https://developers.cloudflare.com/ai-gateway/features/rate-limiting/
- https://developers.cloudflare.com/ai-gateway/reference/pricing/

## Separate three concerns

Do not conflate:

1. **Gateway authentication** — who may call the gateway.
2. **Upstream provider credential** — which provider/account credential executes the request.
3. **Billing path** — BYOK, Unified Billing, provider allowance/credit, or paid execution.

A request can be authenticated to AI Gateway and still be unsafe under LLMFreeway cost policy.

## Gateway authentication

Production gateways should be authenticated.

Use the current endpoint-specific authentication guidance. Cloudflare REST APIs and `gateway.ai.cloudflare.com` provider/compat endpoints can use different authorization headers.

Do not copy an authentication header from one endpoint family to another without checking current docs.

Use least-privilege Cloudflare API tokens. Never use a Global API key when a scoped API token is sufficient.

## Provider keys / BYOK

Prefer Cloudflare BYOK / Secrets Store when AI Gateway should own upstream provider credentials.

Do not store provider keys in:

- Git,
- route JSON,
- generated manifests,
- GitHub issues,
- frontend configuration,
- logs,
- test fixtures.

Registry and manifest artifacts may carry credential references/aliases, never credential values.

Authentication failures are scoped to the affected credential/account path. Exclude that path; do not automatically classify the whole provider/model as globally unavailable.

## Spend limits

Cloudflare AI Gateway supports spend limits that track request cost and block requests after configured budgets are reached for supported known-price models.

Treat spend limits as a useful enforcement primitive, not an automatic proof that LLMFreeway's hard-cost contract is satisfied.

Before relying on a spend limit for `FREE_ONLY`, LOW_COST, or paid ceilings, verify in the PoC:

- supported billing paths,
- provider/model pricing coverage,
- accounting unit and currency,
- reset/window semantics,
- metadata scoping,
- concurrency behavior,
- maximum overshoot,
- retry/fallback attempt accounting,
- behavior when price is unknown,
- response/status when the limit blocks.

If Cloudflare cannot enforce the exact contract, narrow the supported profile or block deployment.

## FREE_ONLY

`FREE_ONLY` means no monetary charge can occur.

Do not classify an offer as FREE_ONLY-safe merely because:

- its model name contains `free`,
- the provider advertises a free tier,
- the account currently has credit,
- BYOK is configured,
- the first candidate is free,
- a spend limit exists but has not been validated for that billing path.

A free allowance or credit qualifies only when the exact account/billing path has verified evidence and a hard stop before monetary billing under project policy.

If quota is exhausted, remove the candidate from eligibility. Do not silently fall through to paid execution.

## Rate limit vs spend limit

Rate limits control request volume. Spend limits control cost.

Do not use request rate as a substitute for a monetary ceiling.

For route design, these may both apply:

```text
security/access constraints
    -> rate limit
    -> spend/cost limit
    -> candidate route
```

Check current Dynamic Routing support for limit elements before generating route JSON.

## Retries and cost

Every retry/fallback can incur provider usage.

The cost model must include:

- initial attempt,
- gateway retries,
- fallback attempts,
- client/SDK retries that reach the gateway,
- smoke/health probes when project policy counts them.

Do not configure automatic retries independently from the aggregate request budget.

## Custom metadata

Use custom metadata only for non-secret dimensions needed for routing, attribution, policy scope, or analysis, such as project/role identifiers.

Never put provider API keys, access tokens, raw secrets, or unnecessarily sensitive user data in custom metadata.

Verify current metadata field/count/size limits before designing a schema.
