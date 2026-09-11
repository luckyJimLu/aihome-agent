# React Rendering and Performance Reference

Use this reference when investigating unnecessary renders, expensive render work, async waterfalls, or bundle/load issues.

## Eliminate avoidable work first

Before adding memoization:

- remove duplicated calculations,
- move invariant work outside render,
- avoid creating expensive derived structures repeatedly,
- narrow state ownership so unrelated state changes do not rerender large trees,
- avoid effects that immediately set derived state.

## Memoization

Use `useMemo`, `useCallback`, or `memo` only when there is a concrete reason:

- expensive computation,
- referential stability required by a meaningful dependency,
- large child subtree demonstrably rerendering unnecessarily,
- integration with an API that depends on stable identity.

Do not blanket-memoize components or callbacks.

## Async work

Avoid serial async work when operations are independent.

- Start independent requests together.
- Do not wait for data earlier than the UI actually needs it.
- Keep loading/error ownership close to the workflow that consumes the data.
- Avoid request logic duplicated across multiple components.

## Lists

- Use stable keys that represent item identity.
- Avoid array indexes as keys when order can change.
- Avoid expensive mapping/filtering repeatedly when inputs are unchanged and the cost is material.
- Consider virtualization only for genuinely large lists.

## Events and subscriptions

- Clean up timers, subscriptions, and listeners.
- Avoid registering duplicate global listeners across many component instances.
- Keep event handlers close to the action they represent.

## Bundle discipline

- Prefer existing lightweight dependencies and platform APIs.
- Avoid importing entire libraries for one small utility.
- Lazy-load large, non-critical feature code when it materially improves startup.
- Do not introduce a library solely to avoid writing a small clear local implementation.

## Rendering stability

- Avoid layout shifts caused by content whose dimensions can be known ahead of time.
- Avoid large hidden component trees when conditional rendering is sufficient.
- Keep expensive syntax highlighting, charts, editors, or rich widgets outside the initial path when they are not immediately needed.

## Validation

Prefer evidence over intuition:

- run the existing build/type checks,
- inspect bundle output when bundle size is the concern,
- use browser/React profiling when performance is observable but the cause is unclear,
- never claim a performance gain without measurement when the difference is not obvious from eliminated work.