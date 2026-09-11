# Proxy Subscription Hub Agent Skills

Skills use progressive disclosure: routing metadata and core workflow stay in `SKILL.md`; detailed project rules stay in repository docs or focused references.

## Skill set

### Workflow and quality
- `feature-dev` — issue-driven multi-file development.
- `test-engineering` — deterministic verification, smoke/failure tests and fixtures.
- `code-review` — final correctness/contract review.
- `code-simplifier` — optional post-correctness cleanup.
- `focused-output` — explicit-request-only action-first response shaping.

### Project domains
- `subscription-config-contracts` — source, collection, client output and routing-policy boundaries.
- `cloudflare-zero-trust` — Tunnel/Access/service-token exposure and retrieval-first Cloudflare guidance.
- `qnap-docker-release` — Docker Compose, QNAP/Container Station, offline bundles and release integrity.
- `github-actions-control-plane` — workflow permissions, concurrency, build/release artifacts and secret handling.
- `runtime-contract-validation` — evidence for external/runtime assumptions.
- `security-review` — secrets, URLs, auth, CORS, SSRF, exposure and privacy.

### UI
- `frontend-design` — current static/server-rendered household admin UI; governed by `DESIGN.md` and `UX-CONTRACT.md`.
- `web-design-guidelines` — accessibility, responsive, interaction and localization audit.

## Intentionally not imported from LLMFreeway

The following LLMFreeway Skills are not suitable here and must not be referenced unless this repository later adopts their domain:

- `cloudflare-ai-gateway`
- `control-plane-contracts`
- `react-best-practices`
- `workers-best-practices`
- `wrangler`

AI Gateway semantics are unrelated to this product. React is not in the current stack. Tunnel/Access work is handled by `cloudflare-zero-trust`, not Worker/Wrangler Skills.

## Routing model

```text
AGENTS.md
  -> workflow Skill when needed
  -> project-domain Skill
  -> security/test gates
  -> code-review
  -> focused-output only when explicitly requested
```

Load only Skills that materially apply. Repository docs remain canonical.