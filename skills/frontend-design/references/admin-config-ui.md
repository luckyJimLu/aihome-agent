# Enterprise Admin Configuration UI

Use this reference for settings pages, admin consoles, configuration centers, provider setup, routing-policy forms, environment/runtime tuning, security settings, and other input/decision-dense B2B interfaces.

Configuration UI is not a dashboard. Its primary job is to help users make precise changes, understand consequences, validate them, save them safely, and recover from mistakes.

## Core principle

Optimize for:

```text
correct decision
  > clear configuration scope
  > safe persistence
  > validation and recovery
  > efficient navigation
  > visual polish
```

A configuration screen should minimize ambiguity, missed fields, accidental destructive actions, lost edits, and uncertainty about whether a change has taken effect.

## 1. Choose the layout from the task topology

Do not choose a layout because it looks modern. Choose from the configuration structure, field count, dependency graph, maintenance frequency, and user expertise.

### A. Master-Detail Split

Use when:

- configuration domains are numerous,
- users switch frequently between sibling resources/categories,
- the product needs a stable global mental map,
- the structure may expand over time,
- cross-module comparison is common.

Typical structure:

```text
left navigation / tree  200-260px
          |
          v
right configuration workspace
```

Good for:

- provider settings,
- routing domains,
- IAM/RBAC,
- organization/repository settings,
- microservice/network governance.

Rules:

- keep the navigation position stable,
- preserve current selection and scroll where possible,
- do not let the left rail squeeze form content below a usable width,
- at narrow widths collapse the rail into a drawer/sheet,
- treat navigation as location, not decoration.

### B. Annotated Section Layout

Use when:

- configuration density is low-to-medium,
- users benefit from business explanation beside controls,
- the audience includes non-specialists,
- modules are independent enough to scan vertically.

Typical desktop structure:

```text
explanation / help       configuration controls
~ 1/3                    ~ 2/3
```

Rules:

- left side explains purpose, consequences, and help links,
- right side contains the actual editable surface,
- collapse to one vertical column on narrow screens,
- avoid using a card merely because a section exists,
- when the page grows beyond roughly 15-30 meaningful fields/modules, consider stronger navigation or progressive disclosure.

Good for:

- SaaS business settings,
- billing/tax/shipping-style settings,
- provider onboarding,
- configuration with significant explanatory context.

### C. Tabs or Accordion

Use tabs when:

- groups are peers at the same cognitive level,
- the user works on one group at a time,
- screen height must remain bounded,
- group count stays small enough to remain discoverable.

Prefer tabs for fewer than about six dense peer modules.

Use accordion when:

- groups are independent,
- users need only a subset at a time,
- advanced/rare settings should remain collapsed,
- cross-group comparison is not frequent.

Rules:

- never hide validation errors silently inside inactive tabs/collapsed panels,
- show dirty/error status on the tab or accordion header,
- if users frequently compare values across groups, do not use accordion as the primary structure,
- avoid creating many simultaneously expanded panels that destroy scanability.

### D. Multi-Step Wizard

Use when:

- configuration has strong sequence/dependency,
- later fields depend on earlier choices,
- initialization is complex,
- the cost of incomplete/invalid setup is high.

Typical structure:

```text
stepper
  ↓
current-step form
  ↓
Back | Save & continue | Review/Submit
```

Rules:

- each step should contain only the information needed for that stage,
- validate dependency-breaking input before allowing progression,
- show a final review/summary before committing high-impact configuration,
- preserve data when moving backward,
- do not use a wizard for everyday non-linear maintenance.

Use wizard primarily for initialization/provisioning, then provide a direct maintenance layout later.

### E. Drawer or Modal

Use a modal when:

- the action requires focused commitment,
- there are very few fields (typically <= 5),
- the task is short and self-contained,
- the background context should be blocked.

Use a drawer when:

- the user is editing one item from a list/table,
- preserving list filters, pagination, and scroll matters,
- the edit should not navigate away from the parent context.

Typical drawer width on desktop:

```text
30-50% viewport
```

Rules:

- do not put large tables or complex multi-column grids inside a narrow drawer,
- do not stack modal-on-drawer or drawer-on-drawer unless an exceptional workflow requires it,
- keep focus management and escape/close behavior predictable,
- on narrow screens allow the drawer to become a full-screen sheet.

## 2. Form layout rules

### Default to single-column forms

Single-column vertical flow is the baseline for configuration forms because it gives users one clear reading/tab order and maps naturally to keyboard/screen-reader navigation.

Use local two-column/grid layout only for strongly paired fields such as:

- start/end,
- min/max,
- IP/port,
- latitude/longitude,
- value/unit,
- dual-list transfer controls.

When a local grid is justified, keep gutters approximately 16-24px and preserve an obvious reading order.

Do not create two-column forms merely to fill desktop width.

### Control the content width

For normal single-column configuration forms, target a main editable width around:

```text
640-800px
```

Do not stretch text inputs to the full width of a large desktop monitor.

Use remaining horizontal space for meaningful secondary context such as:

- help/documentation,
- live preview,
- audit history/diff,
- status/impact explanation.

### Density modes

Comfortable default:

```text
vertical field spacing: ~20-24px
normal control height: ~40px
```

Compact expert mode:

```text
vertical field spacing: ~12-16px
control height: ~32px
```

Use compact density for high-frequency expert administration, not simply to fit more content.

## 3. Progressive disclosure

Do not expose every technical parameter on first view.

Guideline:

- keep unrelated visible controls on a single initial screen to roughly <= 15 when feasible,
- separate core settings from Advanced Settings,
- collapse rarely tuned parameters by default,
- expose advanced values when the user needs them or when another choice activates them.

Progressive disclosure must not hide critical status, validation failures, or destructive consequences.

## 4. Persistence model

Choose one dominant save mental model for a product area. Do not mix save semantics unpredictably.

### Explicit submit

Use when:

- edits should be reviewed as a group,
- the change is consequential,
- atomic submission is important.

For short forms, bottom Save/Cancel is acceptable.

For long forms, do not rely only on a button several screens below the edited field.

### Contextual save bar

Prefer for large settings pages with grouped changes.

Behavior:

```text
clean state
  -> no save bar

first change
  -> dirty state
  -> persistent save bar appears

save
  -> validation
  -> persist
  -> clean state

cancel/discard
  -> restore baseline
```

The save bar should expose both:

- Discard changes
- Save changes

Keep it reachable regardless of scroll position.

### Auto-save / inline save

Use only for independent low-risk values or high-frequency micro-adjustments.

Required states:

```text
idle
saving
saved
error
rollback/retry
```

On failure:

- tell the user what failed,
- preserve or restore a known-good value,
- never leave the UI appearing saved when persistence failed.

### Never mix semantics silently

If one setting auto-saves and another requires Save, make the difference explicit. Prefer consistency within the same configuration domain.

## 5. Dirty-state protection

For explicit or contextual-save flows, protect unsaved changes at both layers.

### In-app navigation guard

When dirty:

- intercept internal navigation,
- explain that unsaved changes exist,
- offer Stay / Save / Discard-and-leave as appropriate.

### Browser unload protection

Attach `beforeunload` only while dirty and remove it when clean.

Do not keep global unload blocking active permanently.

## 6. Validation hierarchy

Validation must help users locate and fix problems, including errors hidden outside the viewport.

Use three levels for deep settings pages.

### Level 1: Page-level summary

After a blocked save, show a clear banner such as:

```text
Save blocked — 4 configuration errors need attention.
```

### Level 2: Group/navigation indicators

If errors exist inside inactive tabs, accordions, or navigation sections:

- mark the container,
- show an error count where useful,
- make the problem location discoverable.

### Level 3: Field-level guidance

At the field:

- show error styling,
- provide a concrete corrective message,
- move/focus/scroll to the first actionable error after save when appropriate.

Prefer:

```text
Subnet mask must be between /16 and /28.
```

over:

```text
Invalid value / validation_error_42
```

Do not make users infer that Save did nothing.

## 7. Destructive operations / Danger Zone

High-risk actions must be physically separated from normal maintenance actions.

Put destructive operations at the bottom or in a clearly isolated danger area.

Use:

- explicit destructive heading,
- consequence description,
- restrained danger styling (border/subtle background),
- outline/ghost destructive trigger rather than an unnecessarily dominant solid red button for the initial trigger.

For irreversible/high-impact operations, require a blocking confirmation dialog.

For very high-risk actions, require deliberate typed confirmation such as the exact resource/environment name.

Example:

```text
Type `corp-prod-db-replica` to confirm deletion.
```

Do not place Delete next to Save as equal adjacent actions.

## 8. Responsive degradation rules

At narrower desktop/tablet widths (around 1024px as a practical design checkpoint):

- persistent left navigation may collapse to a drawer,
- annotated two-column sections should collapse to vertical flow,
- side-by-side preview/context may stack or become toggleable,
- tabs need overflow/alternative navigation handling,
- drawers may become full-screen sheets.

Do not allow the configuration page itself to require horizontal scrolling.

Preserve:

- task priority,
- field labels,
- save/discard access,
- validation location,
- destructive-action separation.

## 9. Live preview / split-pane configuration

Use split-pane live preview when the configuration materially changes a rendered or workflow outcome, for example:

- templates,
- visual branding,
- low-code output,
- routing/workflow diagrams,
- notification content.

Prefer:

```text
editor / form
     |
     v
live preview / resulting state
```

Do not use live preview when it adds visual noise without reducing uncertainty.

## 10. Auditability and rollback

Production-affecting configuration should support traceability beyond the UI.

Where the product contract supports it, expose or plan for:

- who changed it,
- when it changed,
- old/new value diff,
- deployment/applied state,
- historical versions/snapshots,
- rollback/revert path.

The UI must distinguish configuration editing from actual runtime/deployed state when they are not the same.

Never claim rollback/safety guarantees that the backend/control-plane does not implement.

## 11. LLMFreeway layout recommendations

### Provider / model / routing settings

Prefer:

```text
Master-Detail or vertical section navigation
        +
compact single-column forms
        +
advanced-settings disclosure
```

Use a contextual save bar when several related route/provider values are edited as one change set.

### High-frequency network/runtime tuning

Prefer:

```text
Master-Detail
  + vertical tabs when peer groups are few
  + compact density
```

Use inline save only for truly independent low-risk values with robust rollback/error states.

### Initial provider/gateway setup

Use a wizard when credentials, provider selection, validation, route generation, and final review are sequentially dependent.

After setup, expose direct maintenance pages rather than forcing the wizard again.

### Row-level model/provider edits

Use a drawer when editing from a registry/table and preserving list context matters.

### Credentials, secret rotation, route deletion, production teardown

Use focused modal confirmation and a clearly separated danger area where appropriate.

Route deletion or production-affecting destructive actions should require stronger confirmation proportional to impact.

## 12. Configuration page decision matrix

Use this quick selector:

```text
Many domains / frequent switching?
  -> Master-Detail

Need explanation beside moderate-density controls?
  -> Annotated Sections

Few peer groups and limited viewport?
  -> Tabs

Independent advanced groups used occasionally?
  -> Accordion

Sequential initialization with dependencies?
  -> Wizard

Quick row-level edit while preserving parent context?
  -> Drawer

Few high-focus fields / confirmation?
  -> Modal
```

Then choose persistence separately:

```text
Grouped consequential edits
  -> explicit/contextual save

Long settings page
  -> contextual save bar

Independent low-risk micro-setting
  -> auto-save with rollback
```

## 13. Admin configuration completion checklist

Before completing a configuration UI, verify:

### Structure

- Layout was selected from task topology, not aesthetics.
- Core settings are easier to reach than advanced settings.
- Single-column flow is the default form structure.
- Main form width is bounded on wide screens.
- Cross-module comparison is not trapped behind excessive tabs/accordions.

### Persistence

- Save semantics are obvious and consistent.
- Dirty state is visible.
- Long forms do not require hunting for Save.
- Internal navigation protects dirty changes.
- Browser unload protection is scoped only to dirty state.
- Auto-save has saving/saved/error/recovery states.

### Validation

- Save failure has page-level feedback.
- Hidden-tab/accordion errors are surfaced at the container level.
- Field messages explain how to fix the issue.
- First meaningful error can be reached/focused without manual searching.

### Safety

- Destructive actions are physically isolated.
- High-impact actions require deliberate confirmation.
- Destructive and normal actions are not visually/physically easy to confuse.
- UI safety claims match actual backend/control-plane guarantees.

### Responsive/accessibility

- Narrow widths collapse structure intentionally.
- No page-level horizontal scrolling is required.
- Tab order follows visual/logical order.
- Keyboard users can reach save, cancel, errors, navigation, and dialogs.
- Drawer/modal focus is contained and restored correctly.
- English/Chinese text-length differences remain usable.

### Auditability

- Desired/configured state and applied/runtime state are distinguished when necessary.
- Change history/diff/rollback affordances are included when the product supports them.
