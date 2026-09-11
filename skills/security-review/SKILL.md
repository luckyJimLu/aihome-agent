---
name: security-review
description: Review LLMFreeway changes that cross a trust boundary or affect credentials, authentication, FREE_ONLY/paid ceilings, retries/fallbacks, deployment/rollback, untrusted input, browser-exposed configuration, GitHub Actions, generated artifacts, provider/network data, or secret handling. Use proactively for security-sensitive changes, not as a generic style review.
metadata:
  adapted_from: Anthropic security-guidance
  source: https://github.com/anthropics/claude-plugins-official/tree/main/plugins/security-guidance
  license: Apache-2.0
---

# Security Review

Treat security as data flow plus trust boundaries, not a keyword scan.

## Workflow

1. Identify sensitive assets and trust boundaries touched by the change.
2. Trace external/user/provider data through validation, transformation, storage, logging and outbound calls.
3. Check credential exposure, authorization assumptions, injection surfaces, URL/network access, file/path handling and deployment permissions.
4. Check whether retries/fallbacks or failure recovery can bypass managed cost/security policy.
5. Verify client/server and CI/production boundaries.
6. Report concrete, reachable findings with evidence and the smallest safe remediation.

Read:

- `references/security-checklist.md` for general review checks,
- `references/client-ci-boundaries.md` when browser/Vite/localStorage or GitHub Actions/CI boundaries are involved.

## LLMFreeway priorities

Pay special attention to provider/API credentials, Cloudflare tokens, GitHub Actions secrets/artifacts, user-controlled provider/model identifiers, remote catalogs, YAML/JSON parsing, generated manifests, URLs used for discovery/health checks, deployment/rollback, and paid-policy bypass risk.

## Required behavior

- Never hard-code or commit secrets.
- Never place secret values in generated artifacts, logs, fixtures, examples, screenshots, browser bundles, or `VITE_*` variables.
- Treat `VITE_*` values as public-to-client build-time data.
- Keep public identifiers separate from credentials/secrets.
- Prefer schema validation and allow-lists at external boundaries.
- Keep credential failures scoped to the affected account/path.
- Do not silently relax managed cost/security constraints to recover from failure.
- Treat third-party/provider data as untrusted until validated.
- Use least privilege and safe secret scope in GitHub Actions.

## Reporting

Prioritize reachable Blocker/High findings. Distinguish verified vulnerabilities from defense-in-depth suggestions. Do not duplicate the final correctness review owned by `code-review`.