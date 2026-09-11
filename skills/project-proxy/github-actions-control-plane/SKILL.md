---
name: github-actions-control-plane
description: Create or review Proxy Subscription Hub GitHub Actions for Docker images, QNAP offline bundles, releases, scheduled maintenance or CI. Use for permissions, concurrency, provenance, artifacts, caching, release publishing and workflow secret handling.
metadata:
  adapted_from: LLMFreeway github-actions-control-plane
---

# GitHub Actions Control Plane

Inspect existing `.github/workflows/` before changing automation.

## Rules
- Use least required `permissions`.
- Pin critical third-party actions to trusted versions/SHAs according to repository policy.
- Never print secrets or package `.env`/runtime data into artifacts.
- Use concurrency when simultaneous release/build runs could race or publish stale artifacts.
- Make build inputs and produced artifact names deterministic.
- Separate verification from publication when practical.
- A successful build does not prove a QNAP runtime deployment; state the boundary.
- Release assets must match README deployment instructions.

Use `qnap-docker-release` for offline bundle semantics and `security-review` whenever credentials or publication boundaries are involved.