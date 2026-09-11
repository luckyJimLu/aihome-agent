---
name: github-actions
description: Create or migrate GitHub Actions workflows to the shared AIHome reusable CI contracts while preserving repository-specific tests.
compatibility: opencode
---

# GitHub Actions

Inspect existing workflow triggers, permissions, secrets, caches, matrices, required checks, and deployment environments. Replace duplicated mechanics with a small caller workflow targeting a reviewed version of the reusable workflow.

Use least-privilege job permissions and pinned major action versions or stronger pinning required by the repository. Preserve repository-specific commands as inputs or local wrapper scripts. Validate YAML and run the caller on a branch before making its check required by a Ruleset.
