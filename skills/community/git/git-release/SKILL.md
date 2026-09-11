---
name: git-release
description: Prepare consistent GitHub releases across AIHome repositories, including version choice, checks, changelog, tag, and rollback evidence.
compatibility: opencode
---

# Git release

Read [references/release-policy.md](references/release-policy.md). Identify the repository, previous version, release scope, compatibility impact, and target environment.

Run repository-required tests before creating a tag. Draft release notes from merged PRs and verified commits. Show the proposed version and actions before externally publishing; never infer permission to deploy from permission to prepare a release.
