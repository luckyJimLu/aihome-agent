# LLMFreeway UI Context

Use this reference for substantial changes to the existing React/Vite interface.

## Product boundary

The current frontend is a prototype/visualization surface unless the governing GitHub issue explicitly makes frontend work part of the delivery scope. Do not expand frontend architecture while implementing control-plane work whose acceptance criteria specify no frontend.

Frontend code may visualize or configure project concepts, but it does not redefine canonical backend/control-plane contracts.

## Truthfulness

UI labels and status messages must not overstate runtime guarantees. Display a guarantee such as strict free execution, provider availability, spend protection, or deployment safety only when the underlying contract and implemented evidence support that claim.

Distinguish desired/configured state from observed/deployed/runtime state where the product needs both.

## Design priorities

The interface should emphasize:

- free-first and cost-aware routing without implying unsafe guarantees,
- clear logical-model/provider relationships,
- explicit status and failure states,
- low cognitive load for technical users,
- dense data when necessary without visual clutter.

## Localization

Preserve the repository's existing i18n conventions. Account for English/Chinese label-length differences, numbers/currency/dates, table overflow, truncation and responsive layout.

## Architecture restraint

A visual refactor must not introduce a new backend, state service, authentication layer, Worker, or deployment architecture unless the governing task explicitly requires it.