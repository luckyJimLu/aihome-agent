# Frontend Refactor Checklist

Before finishing substantial UI work verify:

## Contract
- `DESIGN.md` tokens/direction remain intentional.
- `UX-CONTRACT.md` persistence, conflict, error, session/share and recovery behavior is preserved.
- Sensitive URLs stay masked by default.

## Structure
- Primary household task is obvious.
- Related settings use proximity/alignment before extra cards.
- Single-column form flow remains the default.
- Mobile/narrow widths have an intentional layout with no accidental page-level horizontal scroll.

## States
Check relevant loading, empty, dirty, saving, success, error, conflict, disabled, focus and offline states.

## Accessibility
- labels are programmatically associated,
- field errors use `aria-invalid`/descriptions where applicable,
- dialogs constrain/restore focus,
- keyboard order follows visual order,
- status is not conveyed by color alone.

## Anti-generic
No decorative dashboard/gradient/glass/card patterns were added without product purpose.