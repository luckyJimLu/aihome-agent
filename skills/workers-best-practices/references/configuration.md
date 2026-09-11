# Workers Configuration & Observability

Use the project's Wrangler configuration and installed Wrangler schema as the version-specific baseline. Verify current behavior against Cloudflare documentation when uncertain.

## Compatibility

- New Workers should use a current `compatibility_date`.
- Existing Workers should not have their compatibility date advanced casually; review compatibility changes and test first.
- Add compatibility flags only when required by the project or dependencies.

## Generated binding types

Prefer Wrangler-generated environment/binding types over hand-written duplicates.

After adding, removing, or renaming bindings:

1. update the source Wrangler configuration,
2. run the project's Wrangler type-generation command,
3. run TypeScript validation.

Binding names are case-sensitive and configuration must match code.

## Secrets

- Never put API keys, auth tokens, provider credentials, or Cloudflare tokens in source or `vars`.
- Use Cloudflare secrets for deployed Workers.
- For local development use the project's chosen secret-file mechanism and keep it ignored by Git.
- If `secrets.required` is used, keep required names aligned with runtime usage.
- Never print secret values in logs or error messages.

For LLMFreeway, provider credentials must remain secret references consistent with `docs/CONTRACTS.md`.

## Bindings

Prefer Workers bindings for Cloudflare services when available instead of Cloudflare REST calls from inside the Worker.

Before editing a binding:

- confirm the binding type,
- confirm the exact config key from the installed Wrangler schema/current docs,
- confirm the resource/environment target,
- ensure code and config names match.

## Observability

Production Worker changes should preserve useful logs and traces.

Prefer structured logs containing stable fields such as:

- event/message,
- request or correlation ID where safe,
- route/model/provider identifiers where non-secret,
- status/outcome,
- duration,
- error category.

Do not log credentials, raw authorization headers, or sensitive prompt/content unless the project explicitly requires and protects it.

Sampling must be intentional; observability should not accidentally create uncontrolled cost or data exposure.

## Environments

Do not assume default-environment bindings or secrets are inherited by staging/production. Check each target environment explicitly.

For Cloudflare Vite-plugin projects, verify how the selected environment is resolved at dev/build time before changing deployment commands.
