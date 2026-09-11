---
name: qnap-docker-release
description: Work on QNAP TS-462C / Container Station deployment, Dockerfiles, Compose, offline image bundles, install scripts, amd64 packaging, health checks, release assets or local NAS upgrade/rollback behavior for Proxy Subscription Hub.
---

# QNAP Docker Release

Read `README.md` and deployment/release sections in `docs/DEVELOPMENT.md` first.

## Principles
- Optimize for reproducible, beginner-safe QNAP deployment.
- Keep runtime secrets/config outside image layers and release archives.
- Preserve offline installation as a first-class path.
- Do not assume QNAP has arbitrary build tooling; release assets should contain what deployment docs promise.
- Pin or explicitly record external image/tool versions where reproducibility matters.
- Keep containers least-privileged: read-only filesystem, dropped capabilities and no-new-privileges where compatible.
- Health checks must reflect actual service readiness, not only process existence.

## Release verification
Check artifact names against README links/instructions, architecture (`amd64` where required), included images/files, compose references, executable script permissions and absence of `.env`, runtime data, tokens, logs or private subscriptions.