# Control Plane Artifact Invariants

Use this reference when changing deterministic compilers, manifests, generated routes, or machine-readable policy output.

## Determinism

For a fixed normalized input and evidence snapshot, generated output must be reproducible.

Avoid non-determinism from:

- unsorted object/map iteration where order affects output,
- wall-clock timestamps in deterministic artifacts,
- random IDs,
- environment-dependent defaults,
- network lookups during compilation,
- implicit locale/timezone formatting.

If timestamps or deployment IDs are operational metadata, keep them outside deterministic artifacts unless the contract explicitly includes them.

## Schema discipline

- Include the repository-required `schema_version` where specified.
- Validate input and output at explicit boundaries.
- Do not silently accept unknown fields when the contract requires strict schemas.
- Preserve forward/backward compatibility only where the contract defines it.

## Security and credentials

Generated artifacts may contain credential references/aliases but must never contain secret values, bearer tokens, private keys, or provider credentials.

## Policy intersections

Compute restrictive intersections explicitly. A fallback or ranking phase must not reintroduce a candidate rejected by security, access, capability, FREE_ONLY, paid-ceiling, freshness, or other mandatory eligibility rules.

## Traceability

Generated decisions should be explainable from source policy and evidence. Preserve enough normalized reason/provenance information to understand why a candidate was included, excluded or ranked without embedding sensitive raw payloads.

## Validation

When stability is contractually important, test output ordering/bytes with fixed fixtures. When only semantic stability matters, compare normalized structures rather than brittle formatting.