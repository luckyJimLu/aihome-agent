---
name: feature-dev
description: Develop a non-trivial Proxy Subscription Hub feature or issue spanning multiple files. Use for discovery, design, implementation, verification and delivery when the change affects server behavior, scripts, Docker, workflows, subscription generation or UI. Do not activate for trivial typo-only edits.
metadata:
  adapted_from: LLMFreeway feature-dev / Anthropic feature-dev workflow
---

# Feature Development

## Workflow
1. Read the governing issue/request and relevant repository docs.
2. Inspect the existing implementation and nearby tests/checks.
3. Identify explicit non-goals and security/deployment impact.
4. Select only the domain Skills required by the change.
5. Implement the smallest coherent solution.
6. Verify using real repository commands and relevant smoke checks.
7. Review failure paths, rollback/recovery, secrets and compatibility.
8. Report concrete changed files and evidence.

Do not add frameworks, services or abstractions for hypothetical future needs. Preserve current household/QNAP scope unless the task explicitly changes it.