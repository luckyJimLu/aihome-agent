# WebApp UI Layout & Density Guidelines

Guidelines for high-density, professional developer control planes and webapp admin panels.

---

## 1. Information Density Hierarchy

Technical users value seeing critical system states at a glance without scrolling through endless empty whitespace.

### Spacing Guidelines:
- **Base Grid**: 4px base increment (4, 8, 12, 16, 20, 24, 32px).
- **Cards & Tiles**: Internal padding of `p-3.5` or `p-4`, with `space-y-2.5` or `space-y-3`.
- **Headers**: Compact height (`h-12` to `h-14`) with flex alignment.
- **Grids**: Responsive columns that naturally scale from 1 column on mobile to 2 on tablet, 3 or 4 on desktop (`grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4`).

---

## 2. Typography Rules

- **Display Numbers / Key Metrics**: `text-xl` or `text-2xl font-bold font-mono tracking-tight text-white`.
- **Primary Labels**: `text-xs font-semibold text-neutral-200`.
- **Secondary / Sub-labels**: `text-[11px] text-neutral-400`.
- **Technical Tokens, Model IDs, Versions**: `font-mono text-[11px] text-neutral-300 bg-neutral-800/80 px-1.5 py-0.5 rounded border border-neutral-700/50`.

---

## 3. Interaction States

- **Hover**: Subtle background lift (`hover:bg-neutral-800/80 hover:border-neutral-700`).
- **Active / Selected**: Distinct border and light ring (`border-blue-500/80 ring-1 ring-blue-500/40 bg-neutral-800`).
- **Disabled**: Reduced opacity (`opacity-50 cursor-not-allowed`).
- **Focus**: Clear accessibility focus ring (`focus-visible:ring-2 focus-visible:ring-blue-500 focus-visible:outline-none`).
