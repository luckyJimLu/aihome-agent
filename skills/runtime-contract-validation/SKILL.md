---
name: runtime-contract-validation
description: Verify external platform or provider behavior that LLMFreeway depends on before treating it as a project guarantee. Use for compatibility PoCs, live API behavior, Cloudflare AI Gateway semantics, provider quota/billing assumptions, retry/fallback behavior, streaming behavior, endpoint compatibility, or any issue whose acceptance criteria require runtime evidence.
---

# Runtime Contract Validation

Use this Skill to prove or falsify external assumptions. Do not use it as an implementation tutorial.

## Canonical inputs

Read the relevant sections of:

- `docs/POC.md`
- `docs/CONTRACTS.md`
- the governing GitHub issue and acceptance criteria
- the adapter/configuration under test

## Workflow

1. **State the hypothesis** — write the exact behavior that must be true.
2. **Retrieve current official evidence** — use current vendor docs for endpoint/API/version prerequisites.
3. **Define the experiment** — environment, credentials class, request, expected result, failure condition and safety limits.
4. **Run in a non-production or explicitly approved environment** — avoid production mutation unless required and authorized.
5. **Capture sanitized evidence** — timestamp, versions, request shape without secrets, status/metadata, observed behavior.
6. **Classify** — `PASS`, `FAIL`, `UNSUPPORTED`, or `INCONCLUSIVE`.
7. **Update project conclusions** — only promote verified behavior into contracts/architecture; otherwise keep the assumption explicit.

Read `references/evidence-protocol.md` when recording evidence.

## Rules

- Documentation says what should happen; runtime evidence shows what happened in the tested conditions. Keep them distinct.
- Never infer a hard cost/security guarantee from a best-effort or eventually consistent platform feature without testing the relevant failure/concurrency path.
- Never expose API keys, tokens, provider prompts containing secrets, or production identifiers unnecessarily in evidence.
- Prefer the smallest reproducible request.
- Record exact package/runtime/API versions when version-sensitive.
- Do not change production routing merely to make a PoC pass.
- A local build/typecheck is not runtime evidence for a remote service.

## Composition

Use `cloudflare-ai-gateway` for AI Gateway implementation details, `test-engineering` for repeatable automated tests, and `security-review` when credentials, billing, deployment or trust boundaries are involved.

## Completion

Report the hypothesis, environment, evidence source, observed result, classification, affected project assumption, and any remaining uncertainty.