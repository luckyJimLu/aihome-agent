# Runtime Evidence Protocol

Use this reference when a PoC or live check produces evidence that may influence project contracts.

## Evidence record

Capture at minimum:

- `hypothesis_id` or related issue,
- UTC timestamp,
- environment (`local`, `sandbox`, `staging`, approved `production`),
- provider/platform and endpoint family,
- relevant package/runtime/API versions,
- sanitized request shape,
- expected behavior,
- observed behavior,
- status/error/response metadata needed to support the conclusion,
- classification: `PASS | FAIL | UNSUPPORTED | INCONCLUSIVE`,
- reviewer notes and follow-up.

## Redaction

Never store secret values, bearer tokens, provider keys, session cookies, private prompts, or unrelated customer data. Replace sensitive identifiers with stable placeholders when identity is not part of the test.

## Reproducibility

Prefer deterministic fixtures and the smallest request that exercises the behavior. Record prerequisite account/gateway/model configuration without copying credentials.

## Freshness

External evidence ages. When a conclusion depends on a fast-changing API, billing path, provider model, limit, or compatibility behavior, record when it was verified and revalidate before relying on stale evidence for a high-impact production change.

## Result discipline

- `PASS` means the tested condition behaved as required under the recorded setup.
- `FAIL` means the observed behavior contradicts the required contract.
- `UNSUPPORTED` means current official/runtime behavior cannot provide the required capability.
- `INCONCLUSIVE` means the experiment or environment could not establish the claim.

Do not convert `INCONCLUSIVE` into a positive assumption.

## Storage

When the repository defines an evidence location such as `.evidence/poc/`, follow that ownership convention. Evidence artifacts should be machine-readable where practical and safe to publish within the repository's visibility/security model.