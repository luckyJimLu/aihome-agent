---
name: cloudflare-zero-trust
description: Configure, review or troubleshoot Cloudflare Tunnel, Access, service-token authentication, protected subscription endpoints or Zero Trust exposure for Proxy Subscription Hub. Do not use for AI Gateway tasks. Retrieve current Cloudflare docs before version-sensitive configuration claims.
---

# Cloudflare Zero Trust

Project intent is to protect self-hosted subscription sources without exposing NAS management services directly to the Internet.

## Workflow
1. Read `docs/DEVELOPMENT.md` and `.env.example` for intended topology.
2. Identify whether the path is Tunnel ingress, Access policy, service-token client, DNS/hostname or QNAP sidecar fetch.
3. Retrieve current official Cloudflare documentation before using exact fields, headers, CLI commands or policy behavior.
4. Keep QNAP-specific Access credentials runtime-only and scoped to the minimum protected application.
5. Never reuse a service token across unrelated consumers when isolation is intended.
6. Verify that protected source credentials do not flow into Sub-Store or generated subscriptions.

## Boundary
Do not introduce Workers/Wrangler merely to solve a Tunnel/Access task unless the user explicitly chooses a Worker architecture and the repository adopts it.