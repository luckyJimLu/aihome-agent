---
name: frontend-design
description: Design, normalize, critique, polish, or substantially refactor the existing LLMFreeway React/Vite prototype when UI work is explicitly requested or a governing issue makes frontend output a delivery requirement. Use for page layout, grouping, alignment, reading order, visual hierarchy, typography, spacing, dashboard composition, settings/admin/configuration pages, provider or routing-policy setup, anti-generic/anti-AI UI cleanup, named style-direction adaptation, responsive presentation, or visual polish. Do not activate for control-plane/backend work merely because the repository contains a frontend prototype.
metadata:
  adapted_from: Anthropic frontend-design
  source: https://github.com/anthropics/claude-plugins-official/tree/main/plugins/frontend-design/skills/frontend-design
---

# Frontend Design

Treat visual design as a product decision, not decoration.

The existing React/Vite interface is a prototype/visualization surface unless the governing issue explicitly makes frontend work part of the deliverable. Do not expand frontend architecture while implementing control-plane work whose acceptance criteria specify no frontend.

Preserve the existing React, TypeScript, Vite, Tailwind, and Lucide stack unless the UI task itself requires a justified architectural change.

## Workflow

1. Confirm that frontend work is actually in scope from the user request or governing issue.
2. Read `references/llmfreeway-ui-context.md` for project-specific UI boundaries.
3. Inspect the affected page, components, styles, i18n conventions, and product context.
4. Identify the primary user job and information hierarchy.
5. If the task is a settings/admin/configuration surface, read `references/admin-config-ui.md` before selecting tabs, accordions, drawers, forms, save semantics, validation, or destructive-action flows.
6. For layout-heavy work, read `references/layout-engineering.md` before choosing containers, grids, panes, breakpoints, or spacing changes.
7. Choose one coherent visual direction before editing details.
8. For redesign, normalization, critique, or polish work, read `references/anti-ai-ui.md` and remove generic generated-UI defaults that do not serve the product.
9. If the user requests a named aesthetic or product-inspired direction, read `references/style-presets.md` and translate the requested style into LLMFreeway-specific characteristics rather than copying another product.
10. Fix information architecture, grouping, reading order, alignment, responsive structure, persistence flow, and validation behavior before decoration.
11. Establish reusable spacing, typography, surface, color, and interaction patterns.
12. Implement responsive, loading, empty, error, dirty, saving, saved, focus, selected, and disabled states as relevant.
13. Validate behavior; use `react-best-practices` for substantial React structure changes and `web-design-guidelines` for final accessibility/UX review on substantial UI changes.
14. Run the final layout, admin-config (when applicable), and anti-AI critique passes before declaring a redesign complete.

## Design doctrine

Prefer:

```text
product intent
  > information architecture
  > grouping / reading order / alignment
  > safe configuration and persistence
  > interaction clarity
  > typography and spacing
  > restrained surfaces and color
  > decorative effects
```

Use proximity and whitespace before extra containers, typography before effects, subtle borders before heavy shadows, one controlled accent before unrelated saturated colors, and product-specific character before generic AI-dashboard styling.

Do not introduce a new UI framework solely to make the prototype look different. Do not alter control-plane semantics, routing guarantees, cost guarantees, or backend contracts as part of a visual refactor.

## Configuration UI boundary

Treat configuration UI as an input-and-decision workflow, not a data dashboard.

Choose Master-Detail, annotated sections, tabs/accordion, wizard, drawer, or modal from task topology and maintenance frequency rather than visual preference. Default forms to a clear single-column flow, bound their desktop width, use progressive disclosure for advanced settings, keep persistence semantics consistent, surface dirty/error state across hidden containers, and physically isolate destructive actions.

Do not claim that a value is saved, deployed, rolled back, FREE_ONLY-safe, or otherwise guaranteed unless the underlying product contract and implementation support that state.

## Layout boundary

Treat layout as a structural system, not a collection of arbitrary margins.

Prefer meaningful grouping, shared edges, clear reading order, progressive disclosure, and a small number of responsive structural transitions. Do not force desktop geometry onto mobile, and do not convert semantic tables/forms into decorative cards merely to make them responsive.

Visible structural grids, rails, bento compositions, or unusual page geometry are optional style treatments and should be used only when they reinforce real information structure.

## Anti-generic boundary

Do not default to the visual vocabulary commonly produced by generic AI UI generation: purple/indigo gradients, glow-heavy dark themes, cards-inside-cards, oversized radii, excessive pills/badges, rounded icon tiles before every heading, decorative KPI grids, or animation without product purpose.

These patterns may be used only when justified by a concrete product or interaction need.

## Style preset boundary

A request such as "Linear-like", "Vercel-like", "Stripe-like", or "Cloudflare-like" means extract useful design characteristics, not reproduce another product's branding or page structure.

Translate external inspiration into project-local decisions such as spacing rhythm, density, typography, border treatment, radius vocabulary, accent discipline, layout behavior, and interaction behavior.

## References

- `references/llmfreeway-ui-context.md` — always read for substantial LLMFreeway UI work.
- `references/admin-config-ui.md` — read for settings/admin/configuration pages, long forms, save bars, dirty-state protection, validation, danger zones, wizards, drawers, or configuration audit/rollback UX.
- `references/layout-engineering.md` — read for grouping, alignment, reading order, page shells, grids, tables, split panes, spacing rhythm, or responsive restructuring.
- `references/design-direction.md` — read when choosing/correcting visual language, hierarchy, density, typography, or surfaces.
- `references/anti-ai-ui.md` — read for redesign, polish, normalize, critique, or explicit "remove AI look" tasks.
- `references/style-presets.md` — read when adapting a named aesthetic/product-inspired style into LLMFreeway.
- `references/refactor-checklist.md` — read before completing a substantial page/dashboard/settings redesign.

## Completion

Report changed files, UI scope/issue, major layout/design/configuration decisions, persistence and safety behavior when relevant, style direction when applicable, anti-AI cleanup performed, responsive/accessibility/localization considerations, validation performed, and remaining visual debt.