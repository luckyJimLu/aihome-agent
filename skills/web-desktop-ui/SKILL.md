---
name: web-desktop-ui
description: Design, implement, review, or refactor one shared LLMFreeway WebUI so it works coherently in both normal browsers and a desktop application shell such as Tauri or Electron. Use for shared web/desktop UI architecture, responsive window behavior, desktop shell chrome, arbitrary window resizing, capability/runtime adapters, keyboard shortcuts, file/open-external flows, drag-and-drop, viewport and container-query strategy, navigation/deep-link behavior, or preventing web/desktop UI forks. Do not activate for ordinary responsive web-only work unless desktop-shell compatibility is explicitly part of the task.
metadata:
  category: frontend-cross-platform
  pattern: Shared WebUI + Runtime Adapter + Responsive Shell
---

# Web + Desktop Shared UI

Maintain one product UI, not a web UI and a desktop UI that slowly diverge.

LLMFreeway's React/Vite application should remain the shared presentation layer. A future desktop package may embed that same WebUI in Tauri, Electron, or another WebView/Chromium shell, but desktop packaging must not become a reason to fork page structure, component semantics, design tokens, or business state.

Use `frontend-design` for visual direction, `webapp-ui-skill` for dashboard/control-plane composition, `icon-system` for icons, `react-best-practices` for component/state architecture, and `web-design-guidelines` for accessibility/responsive review.

Read `references/upstream-patterns.md` when choosing or reviewing the cross-platform architecture or when introducing a desktop shell.

## Core architecture

Use three layers:

```text
Shared Product UI
React components + routes + design tokens + forms + tables + product state
                    ↓
Runtime Capability Adapter
openExternal / filePicker / notifications / shortcuts / window controls / filesystem bridge
                    ↓
Runtime Shell
Browser                         Desktop shell
URL + browser APIs              Tauri / Electron / other host APIs
```

The dependency direction is downward. Product components may request capabilities through a small adapter, but must not import desktop-shell APIs throughout the component tree.

### Default rule

```text
same task + same information
  -> same component and same layout system

different available space
  -> responsive composition

different runtime capability
  -> capability adapter

different operating-system chrome
  -> shell-only treatment
```

Do not use `isDesktop ? <DesktopPage /> : <WebPage />` for equivalent product workflows.

## 1. Responsive by space, not runtime name

A desktop application window is resizable and may be narrower than a browser tab. A browser window may be wider than a desktop app.

Therefore:

- choose layout from available width/height, not `web`, `desktop`, Windows, macOS, or Linux labels;
- prefer CSS Grid/Flexbox and container queries for component-local adaptation;
- use viewport media queries for true page-shell transitions;
- treat breakpoints as layout thresholds, not device categories;
- support continuous resizing without requiring reload;
- preserve reading order when panes collapse or stack.

A useful starting model is:

```text
compact   -> stacked content, collapsed navigation, drawers where appropriate
standard  -> sidebar + focused content, limited secondary panes
wide      -> persistent navigation + main work area + optional inspector/detail pane
```

Choose the actual thresholds from content constraints. Do not encode assumptions such as `desktop = >= 1280px`.

## 2. Window-safe layout

Design for arbitrary desktop-window geometry, including short windows.

Prefer:

```css
.app-shell {
  min-height: 100dvh;
  height: 100dvh;
}

.workspace {
  min-height: 0;
  min-width: 0;
  overflow: hidden;
}

.scroll-region {
  min-height: 0;
  overflow: auto;
}
```

Use the equivalent project Tailwind utilities where appropriate.

Critical rules:

- prefer `dvh` over assuming classic `100vh` behavior;
- give flex/grid children `min-w-0` and `min-h-0` when they own overflow;
- keep one intentional scrolling owner per major pane;
- avoid accidental body-scroll plus nested-panel-scroll combinations;
- do not use fixed heights for tables/forms when the viewport can resize;
- keep dialogs, command palettes, and dropdowns inside the visible work area.

## 3. Shared application shell

Keep the product shell structurally stable across browser and desktop runtimes:

```text
App
├── Navigation
├── Command / status region
├── Route content
└── Overlays
```

Desktop-specific title-bar or window-control chrome may wrap or occupy a reserved region around this shell, but should not redefine the application information architecture.

If custom desktop title bars are introduced:

- isolate draggable regions from buttons, fields, links, tabs, and other interactive controls;
- reserve OS-appropriate window-control space through shell variables/tokens rather than page-specific padding hacks;
- verify maximized, restored, narrow, and high-DPI states;
- do not render fake minimize/maximize/close controls in the normal web build.

Prefer native window chrome unless custom chrome provides a concrete product benefit.

## 4. Runtime capability adapter

Use capability detection and a narrow adapter when behavior genuinely differs.

Conceptual contract:

```ts
type RuntimeKind = 'web' | 'desktop';

interface RuntimeCapabilities {
  kind: RuntimeKind;
  openExternal(url: string): Promise<void>;
  pickFile?: (options?: unknown) => Promise<unknown>;
  showNotification?: (message: string) => Promise<void>;
  registerShortcut?: (shortcut: string, handler: () => void) => () => void;
  windowControls?: {
    minimize(): Promise<void>;
    toggleMaximize(): Promise<void>;
    close(): Promise<void>;
  };
}
```

This is a pattern, not a required exact interface.

Rules:

- do not scatter `window.__TAURI__`, Electron preload globals, Node APIs, or shell-specific imports across feature components;
- do not expose unrestricted native APIs directly to React components;
- detect the capability needed, not only the runtime brand;
- keep a browser-safe implementation for shared capabilities;
- make unsupported capabilities explicit rather than silently failing;
- introduce the adapter only when real runtime divergence exists; do not build speculative abstraction layers.

## 5. Navigation and deep links

Treat application navigation as shared product state.

For browser use:

- preserve URL-addressable screens where the current router supports them;
- respect Back/Forward behavior;
- keep refresh/deep-link recovery deterministic;
- do not hide essential state exclusively in transient component memory.

For desktop use:

- reuse the same route model when practical;
- let shell launch/deep-link handling enter through one boundary and resolve into normal application routes;
- do not maintain a separate desktop-only navigation tree.

Desktop may add menu or tray entry points, but those entry points should navigate to existing product routes/actions.

## 6. Input modality

Do not equate desktop with mouse or web with touch.

Design core workflows for keyboard and pointer first, then progressively enhance:

- keep visible focus treatment;
- use semantic buttons/links/inputs;
- provide comfortable click targets even when the visual control is compact;
- use hover only as enhancement, never as the only way to discover required actions;
- do not hide critical actions behind right-click only;
- use `hover`, `pointer`, and similar capability media features only when they solve a concrete interaction problem.

## 7. Keyboard shortcuts

Keyboard efficiency is valuable in desktop-like control planes, but shortcuts are progressive enhancement.

Rules:

- core actions must remain available through visible UI;
- use platform-appropriate modifier presentation (`Ctrl` vs `⌘`) when the runtime can determine it safely;
- avoid browser-reserved shortcuts in the web build;
- scope shortcuts to the active context and disable them while typing when appropriate;
- expose shortcuts in tooltips, menus, or command palette when discoverability matters;
- route native/global shortcuts through the runtime adapter, not feature components.

Never make a global desktop shortcut the only path to a required action.

## 8. Files, drag-and-drop, clipboard, external links

Keep the interaction model common while adapting the runtime mechanism.

### File selection

```text
UI intent: Choose configuration file
Web: browser File API / file input
Desktop: shell-native picker if justified
Result: normalized application-level file payload
```

Do not let desktop filesystem paths leak into browser-domain components.

### Drag and drop

- use the same visible drop-zone semantics;
- validate input after normalization;
- handle drag enter/leave without full-page flicker;
- desktop-only filesystem metadata must stay behind the adapter.

### Clipboard

Use web-standard clipboard behavior when sufficient. Add shell privileges only if a real desktop requirement cannot be met safely by the Web API.

### External links

A component should express `open external resource`, not know whether the implementation is `window.open`, an anchor, Tauri opener, or Electron shell API.

Treat external URL handling as a security boundary in desktop builds.

## 9. Persistence and state

Keep product-state semantics runtime-independent.

Distinguish:

```text
server / repository state
local draft state
browser-local preferences
native desktop preferences or filesystem state
```

Do not pretend `localStorage`, IndexedDB, native filesystem, and repository state have the same guarantees.

If persistence mechanisms differ, hide the mechanism behind a focused storage/service boundary while keeping the user-visible states consistent: dirty, saving, saved, failed, conflicted, offline/unavailable where relevant.

Do not silently move security-sensitive configuration from server-side storage into desktop-local storage merely because a desktop shell exists.

## 10. Design-system consistency

Web and desktop builds should use the same:

- typography scale;
- spacing rhythm;
- color/status semantics;
- icon vocabulary;
- component variants;
- focus treatment;
- form semantics;
- loading/error/empty states;
- localization behavior.

Desktop may be denser when the user or product mode explicitly requests density, but do not create an unrelated desktop theme by default.

Use source-level, composable components rather than platform-specific copies. Prefer existing project components before introducing another component framework.

## 11. Platform-specific behavior belongs at the edge

Acceptable runtime-specific differences include:

- window controls and draggable title bars;
- native file/folder dialogs;
- global/native shortcuts;
- OS notifications;
- tray/menu integration;
- native updater surfaces;
- filesystem integration;
- shell-safe external-link opening;
- native deep-link/bootstrap handling.

Usually unacceptable platform forks include:

- duplicate dashboard pages;
- separate form components for the same settings;
- different model/provider tables without a product reason;
- separate color/token systems;
- desktop-only business rules;
- browser-only validation rules.

If behavior differs because the underlying product capability differs, document the capability difference explicitly.

## 12. Desktop shell choice boundary

This Skill does not automatically introduce Tauri or Electron.

When a desktop package is explicitly requested:

- consider Tauri when a small native shell around the existing web frontend and a narrow native capability surface fit the requirement;
- consider Electron when the application genuinely needs the Chromium/Node ecosystem or dependencies that make that tradeoff worthwhile;
- keep the React/Vite UI shell-neutral either way;
- do not let packaging choice leak into domain components.

Retrieve current official framework documentation before implementing version-sensitive shell APIs.

## 13. Performance

One shared UI does not justify shipping every desktop feature to browsers.

- lazy-load shell-only integration code;
- keep native bridges out of the normal web bundle where the toolchain permits;
- avoid large cross-platform dependencies for one small capability;
- preserve tree-shaking and route/component code splitting;
- virtualize genuinely large tables/lists based on data volume, not runtime;
- test resize/render behavior under dense dashboard content.

Do not optimize by maintaining two divergent UIs.

## 14. Security boundary

A desktop WebView/Chromium renderer must still be treated as an untrusted UI boundary relative to privileged native capabilities.

- expose the smallest native command surface necessary;
- validate arguments at the native/preload boundary;
- do not expose raw filesystem/process/shell execution broadly to UI code;
- keep external URL opening explicit and validated;
- avoid remote runtime scripts for privileged desktop UI;
- load `security-review` when desktop-native capabilities, credentials, filesystem access, updater behavior, or external navigation are introduced.

## 15. Validation matrix

Do not validate only at a single 1920px browser viewport.

For meaningful shared WebUI changes, exercise representative states such as:

```text
Browser
- narrow window
- normal laptop window
- wide monitor
- browser zoom / long EN-ZH labels where relevant

Desktop shell when implemented
- initial/default window
- minimum supported window
- maximized window
- restored arbitrary size
- high-DPI display when practical
- Windows/macOS/Linux chrome differences when supported

Interaction
- keyboard-only primary flow
- pointer flow
- resize while a complex page is open
- dialog/drawer/command-palette near short viewport height
- loading/error/empty/dirty states
```

Do not claim desktop compatibility if only the browser build was tested.

## Review checklist

Before completing a web + desktop compatibility task, verify:

- one shared component tree remains the default;
- layout responds to available space rather than runtime labels;
- desktop-native APIs are isolated behind a narrow boundary;
- browser behavior still works without desktop globals;
- navigation/deep-link semantics are not duplicated;
- arbitrary window resize does not break core workflows;
- scroll ownership is intentional;
- custom title-bar drag regions do not overlap controls;
- shortcuts are additive, discoverable, and context-safe;
- file/clipboard/external-link interactions have normalized app-level semantics;
- design tokens and icons remain shared;
- accessibility remains consistent;
- runtime-specific dependencies are justified and lazy/isolated where practical;
- privileged desktop capabilities received security review;
- validation distinguishes tested browser behavior from tested desktop-shell behavior.

## Completion

Report:

- shared UI boundaries preserved or introduced;
- runtime-specific capabilities and where they are isolated;
- responsive/window behavior changed;
- browser and desktop validation actually performed;
- any desktop-shell dependency introduced and why;
- security implications of native bridges;
- remaining platform-specific debt.
