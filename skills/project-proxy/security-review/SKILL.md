---
name: security-review
description: Review Proxy Subscription Hub changes involving secrets, subscription URLs/tokens, Cloudflare Access, authentication/sessions, external fetches, CORS, SSRF, public/LAN binding, sharing links, Docker environment variables, logs, backups or release artifacts. Use as a mandatory gate for trust-boundary changes.
metadata:
  adapted_from: LLMFreeway security-review
---

# Security Review

Read the security sections of `docs/DEVELOPMENT.md` and relevant `UX-CONTRACT.md` rules.

## Check
- Secrets are references/runtime values, never committed, logged, rendered or baked into images/releases.
- External URLs are validated against the intended scheme/host policy and do not create SSRF pivots into LAN/metadata services.
- CORS is allowlisted to actual origins; do not normalize to `*` for convenience.
- Management interfaces bind only to intended LAN/local interfaces.
- Public access uses authenticated/tunneled paths rather than direct router port exposure unless explicitly designed otherwise.
- Session cookies, share tokens and admin actions have least privilege; read-only links cannot mutate.
- Sensitive subscription/share values are masked by default in UI and logs.
- Error messages do not echo credentials or full protected URLs.
- Docker/Actions artifacts do not retain `.env`, runtime data, private URLs, logs or backups.
- Destructive operations require deliberate confirmation proportional to impact.

Report only concrete, evidenced findings.