---
name: icon-system
description: Design, select, normalize, review, or refactor icons in the LLMFreeway React UI. Use when adding or replacing navigation icons, action icons, status icons, empty-state illustrations, provider/model/routing/security/configuration icons, brand marks, icon-only controls, icon sizing/stroke/color rules, or when a UI task explicitly asks which icon library to use. Default functional UI icons to Lucide because it is already installed. Use Tabler only as a narrow fallback when Lucide lacks a clear semantic match, and Simple Icons only for recognizable brand marks. Do not activate for non-UI backend/control-plane work.
---

# Icon System

Treat icons as a semantic interface system, not decoration.

LLMFreeway already depends on `lucide-react`; preserve Lucide as the default functional icon language. Do not add another icon package merely because it has more icons or a higher GitHub star count.

Use this skill together with `frontend-design` when icon decisions are part of a broader redesign. Use `react-best-practices` when icon abstractions materially affect React component structure. Use `web-design-guidelines` for final accessibility review.

## Library policy

Use this priority order:

```text
functional UI icon
  -> Lucide
  -> Tabler Icons only if Lucide has no clear semantic match

brand / vendor logo
  -> Simple Icons when an official recognizable brand mark is required
  -> otherwise use a neutral functional Lucide icon

cross-library abstraction
  -> do not introduce Iconify unless the task explicitly requires a dynamic/multi-library icon layer
```

### Lucide — default

Use Lucide for navigation, actions, state, settings, infrastructure, security, model/provider, routing, developer-tool, and general product UI.

Reasons:

- already installed as `lucide-react`;
- consistent line language;
- strong React/TypeScript ergonomics;
- tree-shakeable named imports;
- visually aligned with the existing LLMFreeway prototype.

Do not replace working Lucide icons with another family without a concrete semantic or product reason.

### Tabler — narrow fallback

Use Tabler only when all of the following are true:

1. the required concept is important enough to need a specific icon;
2. Lucide has no sufficiently clear semantic equivalent after inspecting the available exports;
3. a generic Lucide icon would materially reduce comprehension;
4. the extra dependency is justified by more than one isolated decorative need, unless the user explicitly requests it.

When Tabler is introduced, keep it visually compatible with surrounding Lucide icons: match apparent size, stroke weight, alignment, and color. Do not mix Lucide and Tabler icons arbitrarily within the same control group.

### Simple Icons — brands only

Use Simple Icons for recognizable vendor/product marks such as GitHub, Cloudflare, Google, OpenAI, OpenRouter, Docker, or similar providers when brand recognition is part of the user task.

Do not use brand marks as generic functional controls. A Cloudflare logo can identify Cloudflare; it should not mean "network settings" or "deploy".

If a brand package is not already installed, first determine whether a neutral Lucide icon is sufficient. Add a brand-icon dependency only when branded identification materially improves the UI or multiple brand marks are required.

## Workflow

1. Identify the icon's job: navigation, action, status, domain concept, brand, or decoration.
2. Inspect nearby icons and existing component conventions before choosing a new one.
3. Prefer the clearest familiar metaphor, not the most visually interesting glyph.
4. Search Lucide first and verify that the selected icon actually exists in the installed package version; never invent export names.
5. Reuse an existing project icon for the same concept when one already exists.
6. Use Tabler only under the fallback rules above.
7. Use Simple Icons only for brand identity.
8. Normalize glyph size, stroke, alignment, color, hover, selected, disabled, loading, and destructive states.
9. Add accessible labeling for icon-only interactive controls.
10. Review the page for duplicate metaphors, ambiguous meanings, excessive icon density, and mixed visual languages.

## Semantic classes

### Navigation

Navigation icons must help scanning and location recognition.

Good categories include:

- overview/dashboard;
- models/providers;
- roles/policies;
- routing;
- simulator/testing;
- configuration/settings;
- security/credentials;
- activity/logs;
- developer/API tooling.

Use one stable icon per destination. Do not change the navigation glyph between normal and selected state; express selection through text color, background, border, or other navigation state.

Prefer familiar concepts such as dashboard/layout, CPU/brain/box for model-oriented areas, route/git-branch/network for routing, sliders/settings for configuration, shield/lock/key for security, activity/clock/list for history, and terminal/code for developer tooling. Verify exact Lucide exports before implementation.

### Actions

Action icons represent verbs. Prefer conventional metaphors:

```text
create/add        -> plus
edit/configure    -> pencil/sliders/settings
remove/delete     -> trash
copy              -> copy
refresh/sync      -> refresh/rotate
reset/rollback    -> rotate/undo
search            -> search
filter            -> filter/sliders
open external     -> external-link
expand/collapse   -> chevrons
play/run/test     -> play
save              -> save/check only when semantics are unambiguous
```

Do not use an icon-only control for a high-consequence or unfamiliar action when a text label can prevent mistakes. Destructive operations should normally retain explicit text in menus, dialogs, confirmation areas, or danger zones.

### Status and feedback

Status icons reinforce state; they must not be the only state signal.

Use icon + text, and when appropriate semantic color, for states such as:

- success / valid / connected;
- warning / degraded / attention;
- error / blocked / invalid;
- pending / scheduled / waiting;
- syncing / loading;
- disabled / unavailable.

Do not rely on green/red or shape alone. Keep the label readable without the icon.

Use animation only for genuinely active progress, such as a spinner during an in-flight operation. Do not animate normal navigation, status, or decorative icons simply to make the UI feel dynamic.

### LLMFreeway domain concepts

Prefer consistent mappings across the product.

```text
Models / inference       -> CPU, brain, boxes, or another established model metaphor
Providers                -> cloud/server/provider identity; brand logo only when provider identity matters
Routes / routing         -> route, git-branch, network, split/merge metaphor
Roles / policy           -> shield, badge, layers, route-policy metaphor
Credentials / API keys   -> key, lock, shield
FREE_ONLY / guardrails   -> shield/check/lock plus explicit text; never icon alone
Usage / telemetry        -> activity, chart, gauge, clock as context requires
Configuration            -> settings, sliders
Developer / generated    -> terminal, code, file-code
Sync / repository state  -> refresh, git-related, check/warning state
External platform link   -> external-link plus platform identity where useful
```

Do not assign several unrelated icons to the same domain concept across different pages. When refactoring, prefer a small project vocabulary over a large icon catalog.

## Sizing and geometry

Use a restrained size scale rather than one-off values.

Recommended defaults:

```text
14–16 px  dense table metadata / compact inline controls
16 px     standard button glyphs and compact form controls
18 px     sidebar/navigation and common toolbar actions
20 px     prominent page actions or larger navigation treatment
24 px     standalone section-level symbol only when hierarchy needs it
32–48 px  empty-state or onboarding illustration icon
```

Treat these as glyph sizes, not click-target sizes. Interactive targets must remain comfortably clickable and accessible even when the glyph itself is 16–20 px.

Keep functional line icons near the existing Lucide visual weight. Prefer the library default or an apparent stroke around 1.75–2 where the component API allows it. Do not randomly vary stroke width to indicate state.

Align icons optically with adjacent text. Use consistent gap and baseline behavior. Avoid manually nudging individual icons with arbitrary transforms unless the source glyph has a proven optical-alignment problem.

## Color and state

Default functional icons to the same neutral foreground hierarchy as their adjacent text.

Use accent color for selected/primary state and semantic colors for real status meaning. Do not create a rainbow sidebar in which every destination has a permanent unrelated color.

For destructive actions, use destructive styling at the appropriate interaction stage rather than turning every trash icon bright red at all times if the surrounding design uses restrained actions.

Disabled icons must follow the disabled control state; do not make the icon look active when the control is unavailable.

Brand marks may use their recognizable brand treatment when appropriate, but they still need sufficient contrast in light and dark themes. Do not force brand color into unrelated functional icons.

## Icon-only controls and accessibility

An icon is not an accessible name.

For an icon-only interactive control:

- use a real `button` or semantic interactive element;
- provide an accessible label such as `aria-label` when visible text is absent;
- provide tooltip/help text when the meaning is not universally obvious;
- mark purely decorative SVGs as hidden from assistive technology when appropriate;
- keep focus indication on the interactive target, not only on the SVG;
- do not use title/tooltip as the sole accessible-name strategy when the component needs an explicit label.

Do not put click handlers directly on a decorative SVG when a button is the correct semantic element.

## Density rules

Icons should reduce reading effort, not create visual noise.

Prefer:

- one icon for a stable navigation destination;
- icons for compact repeated actions where the metaphor is well known;
- icons for important state reinforcement;
- a restrained empty-state symbol;
- brand marks only when identity matters.

Avoid:

- an icon tile before every card title;
- decorative icons beside every label or form field;
- multiple icons expressing the same status in one row;
- icons used as filler in KPI cards;
- badges built from arbitrary icon + colored circle combinations;
- emoji as production functional icons;
- raster images for ordinary UI glyphs;
- font-icon systems in new code;
- mixing filled, duotone, outline, and unrelated stroke families on one surface without a deliberate system.

## React implementation

Prefer direct named imports from the chosen package so bundlers can tree-shake unused icons.

Example:

```tsx
import { Settings, Route, ShieldCheck } from 'lucide-react';
```

Do not import an entire icon namespace merely to select icons dynamically unless there is a demonstrated runtime requirement.

For repeated icon usage, a small local mapping is acceptable when it represents stable application semantics:

```tsx
const sectionIcons = {
  routing: Route,
  security: ShieldCheck,
  settings: Settings,
} as const;
```

Do not create a generic icon registry, wrapper hierarchy, or design-system abstraction solely for hypothetical future library swapping. Introduce an abstraction only when it removes real duplication, enforces accessibility, or supports a current dynamic configuration requirement.

## Dependency discipline

Before adding `@tabler/icons-react`, `simple-icons`, an Iconify package, or another icon dependency:

1. confirm the requirement cannot be satisfied clearly with installed Lucide icons;
2. inspect package size/runtime implications relevant to the current bundler path;
3. use named/tree-shakeable imports where supported;
4. avoid loading icon fonts, remote icon scripts, or runtime CDN dependencies for core controls;
5. document why the dependency is needed in the implementation report.

One missing decorative glyph is not sufficient reason to introduce a new icon system.

## Review checklist

Before completing icon-related UI work, verify:

- the same concept uses the same metaphor across affected screens;
- Lucide remains the default functional language;
- Tabler usage, if any, is exceptional and visually normalized;
- Simple Icons usage, if any, is brand-only;
- no invented icon export names were added;
- icon sizes follow the local scale;
- action icons represent verbs clearly;
- dangerous/unfamiliar actions retain text where needed;
- selected state does not swap to an unrelated glyph;
- status is understandable without color or icon alone;
- icon-only buttons have accessible names;
- icons do not overwhelm labels, forms, tables, or cards;
- no unnecessary icon dependency or abstraction was introduced;
- light/dark/hover/focus/disabled/loading states remain coherent where applicable.

## Completion

Report the affected components, the icon vocabulary established or changed, any new dependency and why it was unavoidable, accessibility changes for icon-only controls, and validation performed.

If no new library was required, say that the existing Lucide dependency was preserved.