# Accessibility and Interaction Reference

Use this reference for accessibility, interaction, form, focus, and error-state review.

## Semantics

- Prefer native semantic elements before adding ARIA.
- Use `<button>` for actions and `<a>` for navigation.
- Keep heading levels meaningful and ordered.
- Ensure form controls have programmatic labels.
- Give icon-only controls accessible names.
- Do not use color as the only way to communicate meaning.

## Keyboard and focus

- All interactive controls must be keyboard reachable.
- Focus indicators must remain visible.
- Do not create custom interaction patterns that trap focus unintentionally.
- Ensure menus, dialogs, popovers, and dismissible surfaces have predictable keyboard behavior.

## Forms

- Use specific labels rather than placeholders as the only instruction.
- Use appropriate input types and autocomplete attributes where relevant.
- Place validation close to the affected field.
- Preserve user-entered values after recoverable failures.
- Error messages should explain both the problem and the next action.

## States

Check relevant states:

- disabled,
- loading,
- selected,
- expanded/collapsed,
- success,
- warning,
- error,
- empty.

A disabled control should look and behave disabled. A loading state should not appear broken or frozen.

## Interaction clarity

- Do not hide critical actions behind hover only.
- Keep destructive actions explicit and appropriately guarded.
- Use clear action labels such as `Save API key` instead of vague text such as `Continue` when possible.
- Keep touch targets comfortably usable on mobile.

## Contrast and meaning

- Maintain sufficient text/control contrast.
- Pair status colors with text, icons, or another non-color cue.
- Avoid low-contrast placeholder-like text for essential information.