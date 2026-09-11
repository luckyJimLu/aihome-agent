# Responsive, Content, and Performance Reference

Use this reference for responsive layout, content clarity, motion, media, and interface-performance review.

## Responsive layout

Check at minimum a narrow mobile viewport and a normal desktop viewport.

- Prevent unintended horizontal overflow.
- Preserve primary actions and essential status information.
- Ensure text and controls do not collide at intermediate widths.
- Give dense tables or dashboards an intentional small-screen strategy.
- Ensure sticky/fixed UI does not obscure content.
- Avoid desktop-only assumptions in spacing and alignment.

## Content hierarchy

- Put task-critical information before supporting metadata.
- Keep headings concise and descriptive.
- Prefer specific action labels over generic ones.
- Remove repeated explanation when grouping and hierarchy can communicate the relationship.
- Empty states should explain what happened and what the user can do next.

## Motion

- Use motion to communicate state, relationship, or continuity.
- Prefer compositor-friendly transforms and opacity for simple animation.
- Avoid multiple decorative animations competing for attention.
- Respect `prefers-reduced-motion`.

## Images and media

- Provide meaningful alternative text where appropriate.
- Define dimensions when practical to reduce layout shift.
- Lazy-load non-critical media when useful.
- Do not add heavy media purely as decoration if it harms page load or clarity.

## Interface performance

- Avoid rendering large hidden trees unnecessarily.
- Avoid layout-thrashing read/write loops.
- Keep expensive work out of render paths.
- Avoid heavy libraries for minor visual effects.
- Prefer CSS and existing project capabilities for simple transitions and layout.

For React-specific render and bundle concerns, continue with `react-best-practices`.