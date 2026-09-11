---
name: frontend-design
description: Design, critique, normalize or substantially refactor the existing Proxy Subscription Hub household admin UI when UI work is explicitly requested. Use for configuration-page layout, forms, navigation, responsive behavior, visual hierarchy, anti-generic cleanup, save/error/destructive flows. This repository is not React; preserve the current server/static architecture unless migration is explicitly required.
metadata:
  adapted_from: LLMFreeway frontend-design
---

# Frontend Design

`DESIGN.md` and `UX-CONTRACT.md` are canonical for UI work. Read `references/proxy-hub-ui-context.md` before substantial changes.

For settings/configuration work also read `references/admin-config-ui.md`. For redesign/polish read `references/anti-ai-ui.md`. Before completion read `references/refactor-checklist.md`.

## Priority

```text
correct household task
  > privacy and safe persistence
  > UX-CONTRACT behavior
  > information hierarchy
  > responsive accessibility
  > visual polish
```

Do not introduce dashboard KPIs, marketing hero sections, terminal decorations, map imagery, arbitrary glass/glow or framework dependencies that do not serve the household configuration task.