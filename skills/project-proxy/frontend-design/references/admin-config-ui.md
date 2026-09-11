# Admin Configuration UI

Use for settings forms and household administration.

## Layout selection
- Stable categories/frequent switching -> master-detail or simple section navigation.
- Moderate settings needing explanation -> annotated sections.
- Few peer groups -> tabs, with dirty/error indicators.
- Rare advanced options -> accordion/progressive disclosure.
- Sequential first-time setup -> wizard; do not force wizard for later maintenance.
- Row/item quick edit while preserving parent context -> drawer only when the current architecture supports it.
- Short high-focus confirmation -> modal/dialog.

## Form rules
Prefer a single-column form. Use two columns only for strongly paired values. Bound form width on large screens rather than stretching inputs across the viewport.

## Persistence
Follow `UX-CONTRACT.md`: preserve pessimistic submission/revision/idempotency semantics where defined. Dirty state must be visible and protected. Never show Saved when persistence failed.

## Validation
Provide page/group/field-level error location when complexity requires it. Preserve input on failure and focus the first actionable error.

## Danger operations
Physically separate destructive actions. Require a blocking confirmation with clear object identity; initial focus should favor cancellation when `UX-CONTRACT.md` requires it.