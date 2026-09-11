# Migration plan

## Phase 1 — inventory
- Read existing .agents, .opencode, AGENTS.md and skills from each accessible repository.
- Classify as shared, domain-specific, or business-private.
- Detect duplicate names and overlapping routing rules.

## Phase 2 — canonicalize
- Move reusable Skills to skills/<domain>/<name>/SKILL.md.
- Keep project contracts in the source business repository.
- Preserve source commit and license in THIRD_PARTY.md.

## Phase 3 — integrate
- Add a thin project profile and local AGENTS.md to each repository.
- Start with pinned references; do not enable remote hooks or automatic recall by default.
- Add CI validation for frontmatter, links, duplicate IDs, secrets, and executable scripts.

## Phase 4 — iterate
- Version releases, maintain a changelog, collect failure cases, and update Skills from evidence.
