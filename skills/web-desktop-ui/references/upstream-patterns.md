# Upstream Patterns for Shared Web + Desktop UI

Use this reference when choosing or reviewing LLMFreeway's browser/desktop compatibility architecture.

This file summarizes reusable patterns rather than copying upstream implementation details. Re-check current upstream documentation before implementing version-sensitive APIs.

## Selected upstream projects

### Tauri

Source: https://github.com/tauri-apps/tauri

Why it matters:

- one HTML/CSS/JavaScript frontend can be reused inside a native desktop shell;
- native capabilities are exposed across an explicit frontend/backend boundary;
- the rendering engine is the operating system WebView rather than an application-specific second UI framework;
- reinforces keeping the WebUI shell-neutral.

Pattern adopted by LLMFreeway:

> Keep React/Vite as the shared UI. Put native desktop capabilities behind an adapter instead of duplicating product pages.

Do not infer that LLMFreeway has selected Tauri merely because this pattern is referenced.

### Electron

Source: https://github.com/electron/electron

Why it matters:

- demonstrates the mature alternative of packaging HTML/CSS/JavaScript with a desktop runtime;
- keeps the renderer Web-based while privileged capabilities belong behind desktop-process/preload boundaries;
- reinforces separating renderer UI from native/Node capability exposure.

Pattern adopted by LLMFreeway:

> The shared React renderer must not directly own privileged shell semantics. Desktop APIs stay at the edge regardless of whether the future host is Tauri or Electron.

### shadcn/ui

Source: https://github.com/shadcn-ui/ui
Skill source: https://github.com/shadcn-ui/ui/blob/main/skills/shadcn/SKILL.md

Why it matters:

- source-level, composable UI components encourage a shared design system rather than runtime-specific copies;
- its Skill emphasizes existing components first, composition over reinvention, built-in variants, and semantic tokens;
- supports a UI architecture where browser/desktop differences are handled by composition and capabilities instead of separate visual systems.

Patterns adopted by LLMFreeway:

- reuse existing components before introducing cross-platform duplicates;
- preserve semantic tokens and component variants across runtimes;
- use layout classes for composition rather than runtime-specific styling forks.

### Shadcn Dashboard

Source: https://github.com/shadcndashboard/shadcndashboard

Why it matters:

- React + Vite + Tailwind admin-dashboard composition is close to LLMFreeway's frontend shape;
- demonstrates a responsive admin surface built from reusable component primitives;
- useful as evidence that dense admin interfaces should adapt structurally rather than maintain separate desktop and web pages.

Pattern adopted by LLMFreeway:

> Dashboard sections should collapse, stack, hide secondary detail, or move to drawers according to available space while retaining one information architecture.

## Selected Agent Skills / skill collections

### Responsive design skill families

Source: https://github.com/David-Martel/claude-agents/blob/main/docs/agent-skills.md

Relevant ideas:

- responsive design is a distinct engineering concern based on Grid, Flexbox, component behavior, and accessibility;
- design systems, accessibility, and responsive behavior should cooperate rather than be solved by platform-specific duplication.

Pattern adopted:

> Space-driven composition and accessibility belong in the shared UI layer.

### Design Visual Frontend

Source: https://github.com/Xialiang98/design-visual-frontend

Relevant ideas:

- validate at mobile, desktop, and wide viewports;
- visual quality should be checked against actual rendered layouts rather than assumed from code.

Pattern adopted:

> Validate representative narrow, standard, wide, and short-window states; when a desktop shell exists, test the real shell separately from browser emulation.

### MengTo Skills

Source: https://github.com/MengTo/skills

Relevant ideas:

- reusable UI workflows should extract interaction patterns rather than treat each screen as a one-off generation task;
- rich UI implementation benefits from explicit interaction and visual-system rules.

Pattern adopted:

> Keep runtime adaptation as a reusable engineering policy, not repeated ad-hoc conditions in each component.

### Frontend design skill collections

Sources:

- https://github.com/nhatmobile1/claude-skills
- https://github.com/WomenDefiningAI/claude-code-skills

Relevant ideas:

- modern CSS and responsive behavior;
- performance-first implementation;
- dark mode and tokenized themes;
- accessibility and anti-generic design rules;
- preserve coherent visual language while adapting layout.

Patterns adopted:

- use modern responsive CSS before JavaScript runtime branching;
- keep one token system across browser and desktop;
- treat hover/motion as enhancement, not required behavior;
- validate accessibility and interaction states across layout modes.

## Consolidated architecture lessons

The recurring pattern across these projects and Skills is:

```text
Do not solve cross-platform compatibility by duplicating the page layer.

Prefer:

shared semantic components
  + responsive CSS/layout
  + capability detection
  + small runtime adapters
  + shell-specific chrome at the edge
```

## Decisions for LLMFreeway

### Adopt

1. One React/Vite product UI for browser and desktop packaging.
2. Responsive decisions based on container/viewport constraints.
3. A narrow runtime capability boundary only where platform behavior differs.
4. Shared routes, product state, validation, i18n, tokens, and icons.
5. Browser-safe defaults with progressive desktop enhancement.
6. Explicit validation across window sizes and actual desktop runtime when one exists.
7. Security review for privileged native capability bridges.

### Avoid

1. `DesktopPage` and `WebPage` copies for the same task.
2. Platform-name breakpoints such as `if (isDesktop) useWideLayout`.
3. Desktop API imports spread across feature components.
4. Separate desktop color, icon, or form systems without a product requirement.
5. Assuming a desktop app is always maximized or pointer-only.
6. Assuming browser users have small screens.
7. Claiming desktop compatibility from browser-only testing.

## Framework-selection note

The UI architecture should remain host-neutral.

If LLMFreeway later needs a desktop runtime, choose the shell from product requirements rather than UI aesthetics. Tauri is a strong candidate for a lightweight native wrapper around the existing frontend; Electron remains appropriate when its bundled Chromium/Node ecosystem is materially needed. This reference does not make that architectural decision in advance.
