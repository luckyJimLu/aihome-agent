---
name: cloudflare
description: Coordinate ambiguous or cross-product Cloudflare platform work for LLMFreeway when no single specialized local Cloudflare skill is sufficient. Use for tasks spanning multiple Cloudflare products or when the correct Cloudflare product/skill must first be identified. Do not activate merely because a task mentions AI Gateway, Workers, or Wrangler when a dedicated skill clearly matches.
metadata:
  adapted_from: cloudflare/skills
  license: Apache-2.0
  source: https://github.com/cloudflare/skills
---

# Cloudflare Platform Router

This is a fallback/coordinator skill, not the default entry point for every Cloudflare-related task.

Treat Cloudflare behavior as retrieval-first. Product APIs, limits, billing, compatibility flags, and deployment behavior change over time.

## Prefer specialist skills first

- AI Gateway, Dynamic Routes, provider/model routing, retries/fallbacks, BYOK, spend/rate limits, AI Gateway logs or route versions -> `cloudflare-ai-gateway`
- Actual Worker source/runtime behavior, bindings, streaming, async lifetime, Worker observability -> `workers-best-practices`
- Actual Wrangler config/CLI/resource deployment -> `wrangler`
- Security-sensitive Cloudflare changes -> also use `security-review`
- External behavior that must be proven for a project contract or PoC -> also use `runtime-contract-validation`
- Non-trivial multi-file feature work -> start with `feature-dev`

Use this umbrella skill only when the task is ambiguous, spans more than one Cloudflare product, or needs product selection before a specialist can be chosen.

## Repository authority

Read the relevant canonical project sources before changing architecture or managed policy:

- `docs/CONTRACTS.md`
- `docs/ARCHITECTURE.md`
- `docs/POC.md`
- `docs/ROADMAP.md`
- related issues

Do not duplicate project contracts inside this skill.

## Retrieval policy

Before using exact Cloudflare API signatures, fields, limits, endpoint semantics, billing behavior, or compatibility assumptions:

1. inspect current repository code/config and installed versions,
2. retrieve current official Cloudflare documentation,
3. prefer current official evidence over model memory,
4. route contract-critical uncertainty to `runtime-contract-validation`.

## Completion

Report which specialist skill(s) were selected, which Cloudflare products were in scope, what was verified, and what remains externally unverified.