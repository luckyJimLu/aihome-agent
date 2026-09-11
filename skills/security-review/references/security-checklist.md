# LLMFreeway Security Checklist

Load this reference for security-sensitive changes.

## Secrets and credentials

- No secret literals in source, client bundles, generated files, tests, fixtures, logs, or docs.
- Store only credential references where contracts require references.
- Do not echo provider error bodies if they may contain sensitive information.
- Keep account/profile scope explicit so one credential failure does not disable unrelated paths.

## Input and schema boundaries

Validate external data before use:

- provider catalog responses,
- model IDs,
- URLs/endpoints,
- YAML/JSON configuration,
- GitHub Action inputs,
- environment-derived configuration.

Reject unknown fields where the engineering contract requires strict schemas.

Avoid unsafe deserialization and dynamic code execution.

## Web/UI surfaces

Check for:

- unsafe HTML injection,
- URL injection,
- secrets exposed into browser code,
- dangerous external links or redirects,
- missing authorization assumptions in UI-triggered operations,
- sensitive values retained in local storage or visible diagnostics.

Use normal React escaping. Avoid raw HTML rendering unless content is explicitly sanitized and the need is justified.

## Network and SSRF

For user- or provider-controlled URLs:

- prefer known provider endpoints or allow-listed hosts,
- enforce expected schemes,
- reject local/private/link-local destinations when server-side fetches can be influenced externally,
- bound redirects and timeouts,
- avoid reflecting upstream response details blindly.

## Cost as a security boundary

Unexpected spend is a security/reliability concern in this project.

Verify:

- FREE_ONLY cannot route to billable offers unless the exact billing path has a verified hard stop,
- fallback cannot bypass managed limits,
- retries count against request/aggregate budgets as defined by contract,
- unknown cost does not become an implicit paid fallback,
- health probes and smoke tests have explicit budgets.

## GitHub Actions and deployment

- Use least-privilege permissions.
- Do not print secrets or transformed credentials.
- Treat artifacts as potentially user-visible unless proven otherwise.
- Pin or deliberately manage third-party Actions where appropriate.
- Validate desired commit/current deployment state before mutation.
- Do not allow the automation-state branch to trigger deployment.
- Revalidate rollback targets against current security/cost policy.

## Files and paths

When accepting file/path-like input:

- prevent traversal outside the intended root,
- avoid arbitrary overwrite/delete behavior,
- do not follow untrusted symlinks blindly,
- validate archive extraction paths if archives are ever introduced.

## Review output

For every reported issue include:

- trust boundary,
- reachable flow,
- impact,
- evidence,
- recommended fix,
- residual risk if relevant.

Do not inflate severity for theoretical issues with no reachable path.
