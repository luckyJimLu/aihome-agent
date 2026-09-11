---
name: test-engineering
description: Design or implement verification for Proxy Subscription Hub: TypeScript/server logic, subscription generation, regex/policy fixtures, HTTP/session behavior, UI contracts, Docker/Compose smoke checks, release artifacts or failure/recovery paths. Do not assume a test framework exists; inspect package scripts first.
metadata:
  adapted_from: LLMFreeway test-engineering
---

# Test Engineering

Current repository tooling is authoritative. `npm run build` is a typecheck today; do not call it a production bundle unless implementation changes.

Prioritize deterministic tests around:
- input validation and sensitive-value redaction,
- source CRUD/revision/idempotency,
- generated client outputs and policy fixtures,
- auth/session/read-only sharing boundaries,
- dirty-state and error recovery behavior,
- CORS/LAN binding configuration,
- offline bundle contents and secret absence.

Use live tests only when the behavior cannot be verified locally and sanitize all evidence.