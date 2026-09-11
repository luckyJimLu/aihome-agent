---
name: web-design-guidelines
description: Audit explicit LLMFreeway frontend work for accessibility, UX clarity, responsive behavior, interaction quality, forms, motion, content hierarchy, localization/i18n, and interface performance. Use after significant UI changes or when asked to review accessibility, UX, design quality, responsive behavior, or web interface best practices. Do not activate for non-UI control-plane work.
metadata:
  adapted_from: Vercel Web Interface Guidelines
  source: https://github.com/vercel-labs/agent-skills/tree/main/skills/web-design-guidelines
---

# Web Design Guidelines

Use this Skill as a final quality gate for frontend work.

## Workflow

1. Confirm the task actually changes or audits UI.
2. Inspect only the affected UI and immediate dependencies unless a broader audit is requested.
3. Review semantic HTML, keyboard/focus behavior, forms and recoverability first.
4. Review responsive layout, localization/i18n, content clarity, motion and performance-sensitive patterns.
5. Classify findings by user impact.
6. When asked to fix issues, make the smallest coherent corrections and rerun relevant validation.

## Review priorities

1. accessibility blockers,
2. broken keyboard/focus behavior,
3. unusable responsive or localized layouts,
4. unclear/unrecoverable interactions,
5. content/hierarchy problems,
6. visual inconsistency,
7. minor polish.

Prefer native HTML semantics before ARIA workarounds. Use buttons for actions and links for navigation.

## Localization and content resilience

For LLMFreeway's existing i18n-aware UI, check:

- English and Chinese long-label/heading overflow,
- table and code-like identifier overflow,
- truncation that hides critical model/provider/status information,
- number, currency, percentage, date and time formatting,
- hard-coded user-visible strings when the surrounding feature already uses the i18n system,
- responsive behavior when translated text expands,
- accessible names that remain meaningful across locales.

Do not assume English-width screenshots prove localized layouts are safe.

## References

- `references/accessibility-interaction.md` — semantic HTML, keyboard, focus, forms, states, errors and labeling.
- `references/responsive-content-performance.md` — responsive layout, content hierarchy, motion, images and performance-sensitive UI rules.

Load only the reference relevant to the current review when possible.

## Finding format

Prefer `severity — file:line — problem — recommended fix` using `Blocker`, `High`, `Medium`, or `Low`.

Never claim browser, assistive-technology or localization behavior was verified unless it was actually tested. Use `frontend-design` for visual direction and `react-best-practices` for React implementation problems.