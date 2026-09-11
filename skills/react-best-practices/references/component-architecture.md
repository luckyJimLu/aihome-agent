# React Component Architecture Reference

Use this reference when refactoring component boundaries, props, hooks, or state ownership.

## Component boundaries

Split components when distinct responsibilities can be named independently.

Good reasons to split:

- separate data/control logic from a large presentational region,
- isolate a repeated visual pattern,
- isolate state that changes independently,
- reduce a component whose responsibilities are difficult to explain,
- make a meaningful domain concept explicit.

Do not split merely to reduce line count.

## State ownership

Keep state at the lowest level that needs to coordinate it.

- Derive values during render when they can be computed from existing props/state.
- Avoid mirrored or duplicated state that can drift out of sync.
- Lift state only when multiple siblings genuinely need shared coordination.
- Avoid global state for data that belongs to one local workflow.

## Props

- Prefer small, domain-meaningful props over passing large unrelated objects.
- Avoid boolean prop explosions that encode many modes implicitly.
- Use explicit variants when a component has a small number of meaningful modes.
- Avoid passing callbacks through many layers solely because component boundaries are misplaced.

## Hooks

Extract a custom hook when it represents reusable stateful behavior or clarifies a meaningful domain workflow.

Do not create hooks merely to move arbitrary code out of a component.

- Keep hook inputs and outputs explicit.
- Avoid hidden global side effects.
- Keep effects focused on synchronization with external systems.

## Effects

Before adding `useEffect`, ask whether the work can happen:

- during render as a derived value,
- in the event handler that caused the change,
- in the data-loading layer,
- through component composition.

Use effects for synchronization with external state, subscriptions, timers, browser APIs, or other side effects.

## Reuse

Prefer reuse after a pattern appears, not before.

A good reusable component has:

- one coherent responsibility,
- stable semantics,
- clear inputs,
- minimal knowledge of page-specific context.

Do not build a generic component factory when a few direct components are easier to understand.