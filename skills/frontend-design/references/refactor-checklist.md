# Frontend Refactor Checklist

Use before completing a substantial page, dashboard, settings surface, or navigation redesign.

## Structure

- Primary task is obvious within a few seconds.
- Important state/status is visible before secondary configuration.
- Related content is grouped semantically.
- Repeated headings, labels, and explanatory copy have been reduced.
- Layout does not depend on unnecessary wrapper/card nesting.
- Desired/configured state is visually distinguishable from deployed/observed state where both exist.

## Admin configuration pass

Read `admin-config-ui.md` for settings/admin/configuration work and verify:

- Layout choice follows task topology: Master-Detail, annotated sections, tabs/accordion, wizard, drawer, or modal is justified by field volume, dependency, and maintenance frequency.
- Single-column form flow is the default; local multi-column layout is reserved for strongly paired fields.
- Wide-screen form content is bounded instead of stretched across the viewport.
- Advanced/rare settings use progressive disclosure without hiding critical state or errors.
- Save semantics are consistent and understandable within the configuration domain.
- Long forms use a reachable persistence pattern such as a contextual save bar rather than forcing users to hunt for a bottom Save button.
- Dirty state is visible and internal navigation protects unsaved changes.
- Browser unload protection, when implemented, is active only while dirty.
- Auto-save exposes saving/saved/error/recovery behavior and never implies success after persistence failure.
- Validation provides page-level summary, group/tab indicators when needed, and field-level corrective guidance.
- The first meaningful error can be reached/focused without manually searching the entire page.
- Destructive actions are physically isolated from normal maintenance actions.
- High-impact destructive actions require deliberate confirmation proportional to risk.
- Drawers preserve parent context and do not contain inappropriate large tables/multi-column layouts or stacked overlays.
- Wizards are used for sequential initialization/dependency flows, not routine non-linear maintenance.
- Desired/configured state and deployed/runtime state are distinguished when necessary.
- Audit/diff/rollback affordances are shown only when the underlying system actually supports them.

## Layout engineering pass

Read `layout-engineering.md` when layout changed and verify:

- Grouping is communicated primarily through proximity, alignment, and whitespace before extra borders/containers.
- Gaps between groups are visibly stronger than gaps inside groups.
- Reading order matches task priority.
- Secondary controls/details are progressively disclosed when appropriate.
- Major edges, control heights, numeric columns, and row actions align consistently.
- Responsive behavior preserves task priority instead of merely shrinking desktop layout.
- Tables remain semantically tabular; they are not converted into card grids without a concrete reason.
- Sidebar, split-pane, grid, and sticky behaviors have intentional narrow-screen fallbacks.
- Layout survives long model/provider IDs, errors, costs, and English/Chinese text lengths.
- Structural grid/rail/bento treatments are used only when they reinforce real content structure.

## Visual system

- Typography scale is consistent.
- Spacing follows a repeatable 8pt-oriented rhythm.
- Radius, borders, shadows, and surfaces are used consistently.
- Primary, secondary, destructive, and disabled actions are distinguishable.
- Color has semantic purpose.
- Neutral surfaces dominate technical/data-heavy views unless another direction is explicitly justified.
- One controlled accent family is used for interactive emphasis.
- Existing Lucide icons are reused where appropriate.
- Important headings use intentional weight and spacing rather than decorative effects to create hierarchy.

## Anti-AI / anti-generic pass

Read `anti-ai-ui.md` and verify:

- No default purple/indigo/blue gradient was added without a concrete product reason.
- No decorative glow/glass treatment is used on ordinary operational surfaces.
- The page is not composed primarily of interchangeable rounded cards.
- Cards are not nested without semantic need.
- Pills/badges represent real state or category rather than decoration.
- Icon tiles are not repeated mechanically before every heading.
- Heavy shadows are replaced by spacing, borders, or subtle surface contrast where possible.
- Radius vocabulary is restrained and consistent.
- Decorative KPI blocks do not give secondary information the same weight as primary operational state.
- The result does not look like a generic SaaS template that could belong to any product.
- The visual system reinforces LLMFreeway's routing, provider, cost, status, and diagnostic concepts.

## Named style/preset adaptation

If the user requested a named visual direction, read `style-presets.md` and verify:

- The implementation extracts characteristics rather than copying another product's layout or branding.
- The chosen preset has been translated into project-local spacing, typography, density, borders, radius, accent, and interaction decisions.
- Only one dominant visual direction is used per view.
- Product semantics, accessibility, and data readability override aesthetic purity.
- No new design-system dependency was introduced solely to obtain the preset.

## Responsive behavior

- Narrow mobile layouts have an intentional structure.
- No unintended horizontal overflow exists.
- Important actions remain reachable.
- Dense tables or data panels have a small-screen strategy.
- Sticky/fixed elements do not hide content.
- Settings sidebars collapse intentionally when horizontal space becomes constrained.
- Annotated two-column configuration sections collapse to a clear vertical flow.
- Drawers can become full-screen sheets when needed.
- English/Chinese text-length differences do not break the layout.

## States

Check relevant:

- loading,
- empty,
- error,
- success,
- dirty,
- saving,
- saved,
- disabled,
- selected,
- hover,
- keyboard focus.

## Behavior preservation

- Existing actions still perform the same job unless change was requested.
- Navigation targets remain correct.
- Forms preserve expected values and validation.
- Data/state logic was not rewritten solely for styling convenience.
- UI copy does not overstate FREE_ONLY, availability, spend protection, deployment safety, rollback, or other runtime guarantees.

## Final polish

- Remove dead styles and obsolete UI fragments.
- Remove decorative effects that do not improve hierarchy.
- Check for inconsistent one-off spacing, radii, or colors.
- Verify text wrapping, IDs, model names, provider names, and long-content behavior.
- Verify focus-visible and keyboard interaction for modified controls.
- Verify drawer/modal focus containment and focus restoration when overlays changed.
- Run the repository's relevant build/type checks.
- Apply `react-best-practices` when substantial React structure changed.
- Apply `web-design-guidelines` for accessibility and UX review.