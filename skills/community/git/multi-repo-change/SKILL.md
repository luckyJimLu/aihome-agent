---
name: multi-repo-change
description: Plan and execute coordinated changes spanning two or more manifest-managed repositories without breaking consumers.
compatibility: opencode
---

# Multi-repo change

Use the manifest paths as the workspace map. List the provider/consumer relationship, compatibility window, repository order, tests, release order, and rollback point before editing.

Prefer additive compatibility first: publish the provider change, migrate consumers, verify production compatibility, then remove the old interface in a later reviewed change. Use one Issue or Epic as the cross-repository source of intent and link every PR to it.
