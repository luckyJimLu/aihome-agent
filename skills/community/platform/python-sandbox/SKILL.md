---
name: python-sandbox
description: Run Python tools or tests in an isolated, reproducible environment when host dependencies or untrusted inputs require containment.
compatibility: opencode
---

# Python sandbox

Prefer the repository's pinned environment. Otherwise build from `config/docker/python-sandbox.Dockerfile` in the manifest repository and mount only the required working directory read-only unless output writes are necessary.

Use an unprivileged user, no host Docker socket, explicit dependency versions, and no secrets by default. Disable network access when inputs and dependencies are already available. Report the image identity, command, mounts, network mode, and outputs needed to reproduce the run.
