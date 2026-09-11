---
name: code-simplifier
description: Simplify recently changed Proxy Subscription Hub code only after correctness is established and concrete duplication, nesting or unnecessary indirection remains. Preserve exact behavior and security/UX contracts.
metadata:
  adapted_from: LLMFreeway code-simplifier
---

# Code Simplifier

Simplification is optional, not a default development stage.

Prefer removing duplicate branches, dead helpers, unnecessary wrappers and avoidable nesting. Do not create abstractions solely to reduce line count. Never weaken input validation, security checks, error handling, idempotency, revision/conflict behavior or deployment safeguards for elegance.