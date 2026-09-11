---
name: react-best-practices
description: Refactor or review React + TypeScript frontend code for component boundaries, state ownership, rendering efficiency, async work, bundle discipline, and maintainability. Use whenever changing substantial React component structure, splitting large components, fixing unnecessary re-renders, improving frontend performance, or reviewing React implementation quality.
metadata:
  adapted_from: Vercel React Best Practices
  source: https://github.com/vercel-labs/agent-skills/tree/main/skills/react-best-practices
  project_stack: React 18 + TypeScript + Vite
---

# React Best Practices

Apply this skill to implementation quality after or during frontend redesigns.

This repository uses React 18, TypeScript, and Vite. Do not introduce Next.js assumptions, server-component patterns, or React-version-specific APIs that the project does not use.

## Workflow

1. Inspect the affected component tree, state flow, and data dependencies.
2. Preserve behavior before optimizing structure.
3. Fix ownership and component boundaries before adding memoization.
4. Remove unnecessary work, duplicated state, and avoidable render coupling.
5. Keep dependencies and bundles lean.
6. Run relevant type/build checks and review the resulting diff.

## Priorities

Use this order:

1. correctness,
2. clear state ownership,
3. understandable component boundaries,
4. elimination of avoidable work/waterfalls,
5. render efficiency,
6. bundle/load efficiency,
7. micro-optimization.

Do not optimize code that is already clear and fast enough merely to satisfy a pattern.

## Read references when needed

- Read `references/component-architecture.md` when splitting components, moving state, designing props, hooks, or reusable UI boundaries.
- Read `references/rendering-performance.md` when investigating re-renders, expensive work, async waterfalls, bundle weight, or performance regressions.

Load only the relevant reference when possible.

## Completion

For implementation work, report the affected component boundaries, behavioral guarantees preserved, validation performed, and any performance concern that remains unverified.

For visual decisions use `frontend-design`. For final accessibility and UX review use `web-design-guidelines`.