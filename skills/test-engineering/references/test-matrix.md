# LLMFreeway Test Matrix

Use the smallest deterministic layer that can prove the requirement.

| Area | Preferred tests | Key failures to cover |
|---|---|---|
| Zod/YAML schemas | unit + fixtures | unknown fields, missing required fields, invalid enums, unsafe coercion |
| Provider/access normalization | fixtures + unit | partial catalogs, stale evidence, unknown pricing/access, account-scoped differences |
| Role/policy compiler | unit + table-driven fixtures | FREE_ONLY, paid ceilings, capability intersections, no eligible candidate |
| Generated manifests/routes | deterministic snapshot/byte comparison when required | unstable ordering, non-deterministic timestamps, schema drift |
| Retry/fallback accounting | unit + failure injection | multiplied attempts, auth retry storms, fallback after visible output |
| Gateway sync/reconciliation | integration with fake adapter | drift, failed publish, stale version, unsafe rollback |
| GitHub Actions controller | workflow lint + script/unit tests for controller logic | stale run, excessive permissions, artifact leakage, concurrent deployment |
| UI prototype | component/manual/browser checks as available | loading/empty/error, responsive overflow, accessibility, localization |
| External Cloudflare/provider behavior | runtime-contract-validation | endpoint semantics, billing, rate/spend limits, streaming, provider availability |

## Test layering

Prefer:

1. pure unit tests,
2. sanitized fixture tests,
3. integration tests with local/fake adapters,
4. explicit sandbox/staging tests,
5. production probes only when unavoidable and authorized.

## Live test rules

Live tests must be opt-in, quota-aware, safe for repeated execution, and excluded from default CI unless the project explicitly creates a controlled environment for them. Record external evidence separately from deterministic unit test results.