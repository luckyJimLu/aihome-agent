---
name: code-review
description: Review a meaningful Proxy Subscription Hub diff for correctness, regressions, contract violations, security/privacy leaks, release/deployment issues and missing verification. Prefer high-confidence actionable findings over style commentary.
metadata:
  adapted_from: LLMFreeway code-review / Anthropic code-review
---

# Code Review

Read the changed code and relevant canonical docs. Check the actual diff, not hypothetical code.

Prioritize:
1. secret/private subscription exposure,
2. auth/share/CORS/SSRF/public-binding regressions,
3. subscription-policy/output correctness,
4. Docker/QNAP/release breakage,
5. UX-CONTRACT violations and data-loss paths,
6. missing deterministic validation.

Report finding -> evidence/location -> impact -> smallest fix. Do not invent a problem merely to produce findings.