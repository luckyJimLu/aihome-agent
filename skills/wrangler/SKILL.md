---
name: wrangler
description: Configure or operate Wrangler for LLMFreeway only when an actual Wrangler project/configuration/resource deployment is in scope or the user explicitly asks to introduce Wrangler. Use for wrangler.jsonc, local Worker development, environments, secrets, bindings, Worker deployments, versions, rollback, dry-runs, type generation, or Cloudflare resource-management commands. Do not activate merely because a task uses Cloudflare AI Gateway.
metadata:
  adapted_from: cloudflare/skills wrangler
  license: Apache-2.0
  source: https://github.com/cloudflare/skills/tree/main/skills/wrangler
---

# Wrangler CLI

First confirm that Wrangler artifacts or commands are genuinely part of the task. AI Gateway API/Dynamic Route work alone should use `cloudflare-ai-gateway` instead.

Use the project's installed Wrangler version and configuration. CLI flags/config fields change, so verify exact syntax from local help, installed schema, or current Cloudflare docs before version-sensitive changes.

## Inspect first

1. identify package manager and local Wrangler version,
2. inspect package scripts,
3. locate source Wrangler configuration,
4. identify target account, Worker, environment and resource,
5. determine whether the action is local, remote, staging or production.

Do not silently install/upgrade Wrangler or create a Worker just to satisfy an unrelated Cloudflare task.

## Configuration and secrets

- Prefer the existing config format; for genuinely new Worker configuration, verify current Cloudflare guidance before choosing the format.
- Keep bindings and generated types synchronized.
- Never place secret values in source, ordinary vars, shell history, logs, issues or committed files.
- Keep local secret files out of Git.
- Treat secret mutation as a production-affecting action.

## Deployment safety

Before a production-affecting Worker/resource deploy, version or rollback:

1. read relevant `docs/CONTRACTS.md` and `docs/SECURITY.md` sections,
2. verify target environment and config diff,
3. verify required bindings/resources without exposing secrets,
4. run relevant checks that actually exist,
5. use current dry-run/deployment capabilities where appropriate,
6. remember local/dry-run success does not prove remote resource behavior.

Use `runtime-contract-validation` if remote behavior must establish a project guarantee.

## AI Gateway boundary

Use `cloudflare-ai-gateway` for AI Gateway endpoints, Dynamic Routes, BYOK, Gateway auth, spend/rate limits and AI Gateway route management. Do not route those tasks through Wrangler unless actual Wrangler-managed Worker/resource configuration is involved.

## Report

State command/config changed, target environment, local vs remote operation, validation actually performed, and remote state that remains unverified.