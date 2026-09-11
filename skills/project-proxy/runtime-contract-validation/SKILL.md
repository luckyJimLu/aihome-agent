---
name: runtime-contract-validation
description: Prove or falsify external/runtime assumptions for Proxy Subscription Hub, including Sub-Store behavior, Mihomo/client-format compatibility, Cloudflare Access/Tunnel behavior, QNAP/Container Station behavior, Docker networking or release/runtime compatibility. Use when documentation alone is insufficient for a project guarantee.
metadata:
  adapted_from: LLMFreeway runtime-contract-validation
---

# Runtime Contract Validation

Use evidence, not expectation.

## Protocol
1. State the exact hypothesis.
2. Record relevant implementation/version/environment.
3. Check current authoritative documentation.
4. Design the smallest safe reproducible experiment.
5. Use sanitized inputs; never place real subscription tokens or Access secrets into committed fixtures/evidence.
6. Record outcome as PASS, FAIL, UNSUPPORTED or INCONCLUSIVE.
7. Separate observed behavior from inferred behavior.

Do not promote a local smoke test into a universal compatibility claim.