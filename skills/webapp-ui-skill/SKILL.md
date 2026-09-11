---
name: webapp-ui-skill
description: Architecture, layout, and implementation standards for modern web application user interfaces, admin control planes, and dashboard panels. Use when building, restructuring, or polishing admin dashboards, telemetry panels, developer control planes, master-detail interfaces, or command bars. Emphasizes compact information density, mathematical layout rhythms, high contrast semantic status, anti-AI visual discipline, resilient i18n, and clear state persistence.
metadata:
  standard: Developer Control Plane & WebApp UI Specification
  category: frontend-design-system
---

# WebApp UI & Admin Dashboard Panel Skill

Use this skill when designing, building, or refactoring web application user interfaces, particularly developer control planes, admin dashboard panels, operational cockpits, and configuration surfaces.

---

## 1. Core Philosophy: The Developer Control Plane

Admin dashboards and control panels for technical products must feel like high-precision instruments, not marketing landing pages or generic SaaS templates.

```text
Operational Intent
  → Executive Telemetry & System Health
  → Topology & Route Matrix
  → Interactive Command & Action Bar
  → Dense, High-Contrast Data Layout
  → Explicit Persistence & Non-Blocking Feedback
```

### Key Doctrines:
1. **Instruments, Not Marketing**: No hero banners, oversized headline fluff, or vague vanity metrics. Show real, actionable state immediately.
2. **Dense but Structured**: High information density without clutter. Use fine 1px borders (`border-neutral-800`), dark canvas surfaces (`bg-neutral-950`, `bg-neutral-900`), and monospace fonts for technical identifiers, models, and numbers.
3. **Four-State Semantic Color Palette**:
   - **Emerald / Green (`emerald-400`, `emerald-500/10`)**: Healthy, Ready, Active, 100% Free / Zero-Cost, Passed.
   - **Amber / Yellow (`amber-400`, `amber-500/10`)**: Warning, Paid Fallback, Setup Required, Pending Action.
   - **Rose / Red (`rose-400`, `rose-500/10`)**: Unconfigured, Offline, Failure, Hard Stop, Blocked.
   - **Slate Blue / Cyan (`blue-400`, `blue-500/10`)**: Primary selection, Active Navigation, Interactive Action.
4. **Anti-AI Cliché Filter**:
   - Strictly no purple-to-blue decorative gradients.
   - No glowing drop shadows or blurry glassmorphism in dark mode.
   - No arbitrary nested cards inside cards.
   - No empty decorative charts without actionable data.
   - No truncated critical data (e.g. model names or error messages cut off without tooltips).

---

## 2. Admin Dashboard Panel Architecture

A production-grade Admin Dashboard Panel for a routing/controller system must be organized into clear functional layers:

### Layer A: Executive Status & Telemetry Bar
- **System Health Pill**: Real-time connection status (e.g., Cloudflare AI Gateway connectivity, GitOps source URL).
- **Hard-Stop Guarantee Badge**: Explicit confirmation of policy invariants (e.g. `FREE_ONLY: 100% Zero-Cost Guaranteed`).
- **Sync & Version Indicator**: Shows configuration schema version, last sync timestamp, and polling state.

### Layer B: KPI & Metrics Grid (Telemetry Cards)
- Metric tiles must display:
  - Concise label (1-2 words).
  - Prominent value with tabular numbers.
  - Qualitative context or sub-metric (e.g., `8 enabled / 1 reserved`).
  - Semantic status indicator (emerald/amber/red dot or badge).
  - Direct interactive trigger or navigation link to inspect the underlying assets.

### Layer C: Rapid Command Center & Action Bar
- Group primary operational controls in an accessible, consolidated strip:
  - **Pull / Sync Now**: Refresh configuration from remote GitOps.
  - **Policy Shortcut**: E.g. "Apply Free-First Gateway Priority".
  - **Compiler & Gateway Links**: Direct deep-links to export artifacts or open provider dashboards.
  - **Simulation Run**: 1-click test of fallback chains.
  - Clear separation between non-destructive quick actions and destructive state resets.

### Layer D: Topology & Routing Matrix
- Visual matrix or heat-map summarizing logical roles and model chains.
- Each item displays role key, primary candidate, latency, fallback depth, and gateway readiness dot.
- Clicking any role in the matrix navigates directly to that role's configuration pipeline.

### Layer E: Provider Fleet Health & Distribution
- Overview of all connected upstream model providers (Cloudflare Workers AI, Google Gemini, Groq, OpenRouter, DeepSeek).
- Quota and billing distribution ($0.00 zero-price vs free-allowance vs paid fallback).

### Layer F: Activity & Audit Stream
- Chronological, timestamped log of control plane events: sync fetches, manual overrides, fallback hops, and gateway verifications.

---

## 3. Layout Engineering & Visual Rhythm

- **Outer Canvas**: `bg-neutral-950` with `text-neutral-100`.
- **Card Containers**: `bg-neutral-900/90` with fine `border border-neutral-800`.
- **Spacing Rhythm**:
  - Container padding: `p-4 sm:p-5 lg:p-6`.
  - Component gaps: `gap-3 sm:gap-4 lg:gap-6`.
  - Tight grouping for related data: `space-x-1.5`, `space-y-1`.
- **Typography Scale**:
  - Headings: `text-base font-semibold` or `text-lg font-bold`.
  - Body / Labels: `text-xs font-medium text-neutral-300` or `text-neutral-400`.
  - Monospace Identifiers: `font-mono text-xs` or `text-[11px]`.
  - Metrics Values: `text-xl sm:text-2xl font-bold font-mono tracking-tight`.
- **Border Radii**:
  - Panels & Cards: `rounded-xl` (12px).
  - Buttons & Inputs: `rounded-lg` (8px).
  - Badges & Pills: `rounded-full` or `rounded-md`.

---

## 4. State Semantics & Persistence Guidelines

1. **Explicit Boundaries**: Distinguish clearly between persisted state, remote fetched state, and local draft changes.
2. **Optimistic Feedback**: Provide immediate tactile feedback upon clicking actions (e.g., spinner during sync, green checkmark upon copying).
3. **Non-Blocking Toasts**: Surface operation outcomes in top notification banners or toast notifications without covering functional buttons.
4. **Audit Trail**: Every significant state modification should append an entry to the live session audit trail.

---

## 5. Accessibility & Internationalization (i18n)

- **Contrast**: All body text must pass WCAG AA (minimum 4.5:1 against background).
- **Keyboard Navigation**: All cards, buttons, and tab controls must have crisp `:focus-visible` outlines (`ring-2 ring-blue-500`).
- **Bilingual Resilience**: Every label, metric name, tooltip, and button must support both English and Chinese without word wrapping or layout displacement (`truncate` or flexible flex wrappers).

---

## 6. Verification Checklist

Before considering an admin dashboard or webapp UI complete:
- [ ] Are all metrics backed by real data from application state?
- [ ] Do all quick-action buttons trigger real state handlers?
- [ ] Does clicking matrix or metric cards navigate to the corresponding detail view?
- [ ] Is the layout responsive from 360px mobile to 1920px desktop?
- [ ] Does language switching (EN/ZH) preserve formatting without overflow?
- [ ] Have all generic AI-UI cliches (unnecessary gradients, glowing shadows) been eliminated?
