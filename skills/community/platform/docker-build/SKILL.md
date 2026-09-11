---
name: docker-build
description: Build and verify reproducible Docker images for AIHome repositories without publishing or deploying them implicitly.
compatibility: opencode
---

# Docker build

Use the repository Dockerfile and pinned base image policy. Keep the build context minimal, avoid secrets in layers, run as a non-root runtime user, and record the source commit and resulting image digest.

Build and scan locally or in CI. Publishing, QNAP installation, and Cloudflare deployment are separate externally mutating actions and require the target and authorization to be explicit.
