---
name: control-plane-contracts
description: Design, implement, or review LLMFreeway control-plane schemas, policy compilation, deterministic generated artifacts, FREE_ONLY/cost/capability intersections, evidence eligibility, or manifest/route generation. Use for Zod/YAML contracts, role/provider/model normalization, policy compiler logic, generated state, or any change whose correctness depends on repository contract semantics rather than Cloudflare runtime behavior.
---

# Control Plane Contracts

This Skill owns implementation guidance around LLMFreeway's repository-defined control plane. It does not redefine the contracts themselves.

## Canonical authority

Read the relevant sections of:

- `docs/CONTRACTS.md`
- `docs/ARCHITECTURE.md`
- the governing GitHub issue
- existing schemas/compiler/tests

Treat `docs/CONTRACTS.md` as authoritative for behavior. If the contract must change, update it explicitly instead of silently changing implementation semantics.

## Workflow

1. Identify the input schema, policy rule, output artifact and acceptance criteria.
2. Trace where data is normalized, validated, filtered, ranked and emitted.
3. Preserve restrictive intersections for security/cost/capability requirements.
4. Make compilation deterministic for a fixed input/evidence snapshot.
5. Keep generated artifacts explicit, versioned and reproducible.
6. Add contract-focused tests/fixtures through `test-engineering`.
7. Review changed behavior against canonical contracts before completion.

Read `references/artifact-invariants.md` for generated-artifact and determinism rules.

## Core rules

- Unknown required evidence must not silently become eligible.
- FREE_ONLY and other restrictive managed constraints must not be relaxed by fallback convenience.
- Credentials remain references/identifiers, never secret values in generated artifacts.
- Separate desired state from runtime observations/deployment state according to repository ownership rules.
- Do not hard-code provider-specific behavior into role semantics when an adapter/normalization layer should own it.
- Reject malformed or ambiguous machine input at explicit validation boundaries.
- Avoid non-deterministic timestamps/order/randomness in artifacts whose stability is part of the contract.

## Composition

Use `runtime-contract-validation` when a rule depends on external platform behavior, `cloudflare-ai-gateway` when adapting compiled output to AI Gateway, `github-actions-control-plane` when automation publishes/reconciles artifacts, `security-review` for sensitive boundaries, and `test-engineering` for executable contract proof.

## Completion

Report canonical contract sections consulted, schemas/artifacts affected, deterministic behavior verified, tests run and any unresolved external dependency.