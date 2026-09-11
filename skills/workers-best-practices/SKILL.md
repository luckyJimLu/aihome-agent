---
name: workers-best-practices
description: Author or review Cloudflare Workers code for LLMFreeway only when actual Worker source/runtime configuration is in scope or the user explicitly asks to introduce a Worker. Use for Worker handlers, bindings, streaming, async work, global state, runtime security, observability, generated binding types, or Workers-specific configuration. Do not activate merely because AI Gateway is a Cloudflare product.
metadata:
  adapted_from: cloudflare/skills workers-best-practices
  license: Apache-2.0
  source: https://github.com/cloudflare/skills/tree/main/skills/workers-best-practices
---

# Cloudflare Workers Best Practices

First confirm that a real Worker implementation/configuration is part of the task. AI Gateway work alone does not justify introducing or loading Worker-specific guidance.

Use current project versions and current official Cloudflare evidence. Do not rely on remembered API signatures, config fields, testing package names, limits, or compatibility behavior.

## Load references only as needed

- Configuration, generated types, secrets, bindings, logs and traces -> `references/configuration.md`
- Streaming, promise lifetime, request state, bindings, async architecture and runtime security -> `references/runtime-patterns.md`
- Handler signatures, platform classes, binding access and serialization boundaries -> `references/platform-apis.md`

## Core review rules

Flag when relevant:

- buffering large/unbounded bodies instead of streaming,
- floating promises not awaited/returned/attached to `ctx.waitUntil()`,
- request-scoped mutable state at module scope,
- hardcoded secrets or secrets stored as ordinary vars,
- unnecessary Cloudflare REST calls where a Worker binding exists,
- hand-written binding interfaces that drift from generated types,
- unsafe casts/suppressions hiding platform type errors,
- incorrect binding access patterns,
- obsolete platform APIs/classes,
- weak observability or error handling.

## LLMFreeway-specific constraints

When Worker behavior affects cost policy, retries/fallbacks, streamed responses, credentials, deployment, or managed routing guarantees, read `docs/CONTRACTS.md` and use `security-review` as required.

Use `runtime-contract-validation` when a remote Worker/Cloudflare behavior must be proven rather than merely implemented.

## Validation

1. Check binding/config consistency.
2. Regenerate binding types when configuration changes.
3. Run repository checks that actually exist.
4. Run Worker-runtime tests only when the project has a current supported Worker test setup.
5. Use current Cloudflare docs for version-sensitive test tooling/configuration.
6. Never claim remote behavior is validated by a local build alone.
