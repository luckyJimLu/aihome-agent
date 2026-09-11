# Layout Engineering Reference

Use this reference when the task is primarily about page structure, grouping, alignment, reading order, responsive behavior, sidebar/content composition, grids, or spacing rhythm.

This reference is inspired by mature layout practices from `jakubkrehel/skills` (`better-layout`) and Impeccable-style layout critique, but is rewritten for LLMFreeway rather than vendored as a separate Skill.

## Layout objective

A good layout should make the interface understandable before decoration is considered.

For each page, establish:

1. what the user is trying to accomplish,
2. what information must be seen first,
3. what can be deferred,
4. what belongs together,
5. what should remain stable across responsive widths.

Prefer information structure over ornamental structure.

## Grouping hierarchy

Group in this order of preference:

```text
proximity / whitespace
  > alignment / shared edges
  > subtle surface grouping
  > separators
  > additional nested containers
```

Related items should be visually closer than unrelated items. As a practical rule, the gap between groups should normally be clearly larger than the gap inside a group.

Avoid using a border, card, or divider merely because two pieces of content are adjacent.

## Reading order

Arrange information in the order users need it:

```text
identity / current state
  -> primary decision or action
  -> important supporting data
  -> secondary controls
  -> metadata / diagnostics
```

For LLMFreeway operational views, do not bury routing state, cost state, provider health, or deployment state beneath low-value metadata.

Within rows and lists:

- lead with the identifying content,
- keep status close to the object it describes,
- place secondary metadata later,
- place row actions consistently,
- avoid making every value equally prominent.

## Progressive disclosure

Do not make the first viewport contain every possible control.

Prefer:

- concise primary view,
- expandable details,
- tabs only when groups are genuinely peer concepts,
- drawers/dialogs for focused secondary tasks,
- advanced configuration behind explicit disclosure.

Do not hide information required to make the primary decision.

## Alignment system

Use a small set of intentional alignment rules.

Prefer:

- shared left/inline-start edges for labels and content blocks,
- aligned numeric columns for comparable metrics,
- consistent toolbar baselines,
- consistent control heights,
- predictable action placement.

Avoid arbitrary centering in data-heavy administrative views.

Think in logical directions (`inline-start`, `inline-end`) rather than hard-coded left/right where practical so future RTL support is not structurally blocked.

## Spacing rhythm

Use the project's 8pt-oriented rhythm:

```text
4   micro adjustment
8   tightly related elements
16  normal component spacing
24  grouped component spacing
32  section separation
48+ major page separation
```

Do not solve clutter by compressing all spacing. First remove duplicate headings, containers, borders, helper text, and redundant controls.

## Page composition patterns

### Dashboard / control plane

Prefer:

```text
PageHeader
  -> primary state / actions
  -> main operational content
  -> secondary diagnostics / details
```

Do not begin with a decorative KPI grid unless those metrics are genuinely the primary task.

### Sidebar application shell

Use a sidebar when navigation categories are stable and numerous enough to justify persistent navigation.

Rules:

- sidebar should not compete visually with page content,
- current location must be obvious,
- narrow widths should collapse or transform intentionally,
- content width should not become unreadably stretched on wide screens,
- sticky navigation must not trap keyboard or mobile users.

### Split pane / master-detail

Use when users repeatedly move between a list and details.

Preserve:

- clear selection state,
- independent scrolling only when it improves usability,
- minimum useful width for both panes,
- a mobile fallback that becomes sequential rather than crushed side-by-side.

### Tables and dense lists

Prefer real table semantics when the information is tabular.

For responsive handling, choose deliberately among:

- horizontal scrolling,
- priority-column reduction,
- stacked detail view,
- drill-in master/detail.

Do not automatically transform every table into unrelated cards on mobile.

### Grid / card collections

Use CSS Grid when two-dimensional alignment matters; use Flexbox for primarily one-dimensional flows.

Cards should represent meaningful independent objects, not arbitrary content chunks.

Avoid bento layouts as a default. Use them only when heterogeneous content importance genuinely benefits from different spans.

## Structural grid style

A visible structural grid/rail aesthetic may be used when explicitly requested.

Treat it as a style treatment, not the base architecture.

If used:

- grid lines must reinforce alignment,
- rail boundaries should match real content regions,
- responsive behavior must preserve hierarchy rather than retain decorative lines at all costs,
- do not add grid decoration that reduces scanability in operational tables/forms.

## Responsive strategy

Design responsive behavior by preserving task priority, not by shrinking desktop geometry.

At each important width, decide:

- which regions stack,
- which controls collapse,
- which metadata can move later,
- whether navigation changes form,
- how tables remain usable,
- whether sticky/fixed elements remain appropriate.

Prefer container-aware component behavior when a component's available width matters more than the viewport width.

Avoid unnecessary breakpoint proliferation. Use the minimum number of structural transitions required by the content.

## Long-content and localization stress test

Always stress important layouts with:

- long model IDs,
- provider names,
- error text,
- cost values,
- English and Chinese labels,
- empty and loading states,
- unusually long status text.

Use wrapping, truncation, tooltips, min-width rules, or overflow deliberately. Never allow important identifiers to disappear without a recovery path.

## Layout critique pass

Before completing a layout refactor, ask:

1. Is the primary task obvious from the first viewport?
2. Can any container be removed without losing meaning?
3. Are related elements closer than unrelated elements?
4. Are major edges and baselines aligned intentionally?
5. Is secondary information visually subordinate?
6. Is there too much content at the first level?
7. Does the layout remain coherent at narrow and wide widths?
8. Do tables/forms retain their semantics rather than becoming decorative cards?
9. Does English/Chinese content break alignment or overflow?
10. Does the layout still feel like a technical control plane rather than a generic SaaS template?

If several answers are weak, fix structure before adding visual polish.
