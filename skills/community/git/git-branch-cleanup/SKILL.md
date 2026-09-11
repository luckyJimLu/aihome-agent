---
name: git-branch-cleanup
description: Audit and safely clean short-lived GitHub branches after merges or migrations; use when deciding which branches to retain, review, or delete.
compatibility: opencode
---

# Git branch cleanup

Compare every candidate with the repository default branch. Classify it as active, merged with no unique commits, unmerged, or anomalously named.

Before proposing deletion, check open PRs, deployment references, release tags, and collaborator dependencies. Present exact repository and branch names. Deletion requires explicit authorization for the listed targets; never broaden a confirmed list.

Prefer `utils` branch-audit capability when present. A branch is not a module boundary: retained development branches should still be short-lived and linked to an Issue or PR.
