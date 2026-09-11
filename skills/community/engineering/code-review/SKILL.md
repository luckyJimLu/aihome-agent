---
name: code-review
description: Review code changes for correctness, regressions, security, tests, and maintainability, with findings tied to evidence.
compatibility: opencode
---

# Code review

Start from the requested diff and repository guidance. Prioritize concrete defects and regression risks over style. For each finding, state the affected path/location, triggering conditions, impact, and smallest credible correction.

Run focused checks when available. Distinguish verified failures from hypotheses and note important untested paths. Do not mutate code unless the user asks to fix the findings.
