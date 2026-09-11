# Style Preset Adapter

Use this reference when the user asks for a named visual direction such as "Linear-like", "Vercel-like", "Stripe-like", "dark technical", "minimal developer tool", or another aesthetic preset.

A preset is a source of design characteristics, not permission to copy another product's branding, layout, assets, or trade dress.

## Preset workflow

When a named style is requested:

1. Identify the characteristics the user actually wants.
2. Convert those characteristics into project-specific design tokens and layout rules.
3. Preserve LLMFreeway's existing product semantics and information architecture.
4. Check accessibility, localization, responsive behavior, and data density.
5. Apply the minimum coherent set of changes needed to establish the direction.
6. Run the anti-AI critique in `references/anti-ai-ui.md` before completion.

Do not reproduce logos, proprietary illustrations, unique branded assets, or near-identical page structures from another product.

## Default LLMFreeway preset

When no style is specified, prefer:

```text
Developer Control Plane
- neutral technical palette
- restrained single accent
- compact information hierarchy
- fine borders
- low shadow usage
- medium/low radius
- strong status semantics
- dense but readable data presentation
- minimal decorative UI
```

This is the safest default for a routing/control-plane product.

## Preset: Linear-inspired

Use when the user asks for a Linear-like feel.

Extract:

- tight, efficient spacing,
- strong keyboard/tooling feel,
- muted neutral surfaces,
- compact typography,
- subtle borders,
- minimal visual noise,
- clear selected/active states,
- restrained accent usage.

Avoid copying Linear navigation, proprietary colors, exact component proportions, or branded motion.

Good for:

- model registries,
- routing tables,
- issue/workflow-like views,
- configuration panels,
- command-oriented dashboards.

## Preset: Vercel-inspired

Extract:

- strong black/white or near-neutral contrast,
- sharp hierarchy,
- large whitespace where hierarchy benefits,
- simple surface structure,
- deliberate typography,
- minimal decorative color,
- strong code/developer-tool readability.

Use carefully for dense operational views: do not let marketing-style whitespace reduce scanability.

Good for:

- overview pages,
- deployment/status summaries,
- developer-facing settings,
- onboarding surfaces.

## Preset: Stripe-inspired

Extract:

- disciplined information hierarchy,
- strong typography,
- polished form structure,
- precise spacing,
- careful documentation-like explanatory content,
- restrained surface contrast,
- clear data/status organization.

Do not introduce Stripe-specific gradients or branding simply because the preset name was requested.

Good for:

- provider credential/setup flows,
- configuration forms,
- usage/cost presentation,
- documentation-rich settings.

## Preset: GitHub-inspired

Extract:

- utilitarian density,
- clear semantic borders,
- predictable controls,
- restrained color,
- strong list/table readability,
- status labels with explicit meaning,
- familiar developer workflow conventions.

Good for:

- policy/configuration lists,
- manifests,
- audit/event views,
- technical administration screens.

## Preset: Cloudflare-inspired

Extract:

- operational clarity,
- resource/status organization,
- clear environment/account context,
- moderate data density,
- strong action hierarchy,
- practical diagnostic affordances.

Do not reproduce Cloudflare branding or orange-heavy styling unless explicitly requested and justified.

Good for:

- Gateway status,
- route deployments,
- provider/runtime diagnostics,
- control-plane operations.

## Preset: Dark Technical

Use only when dark mode or a dark-first surface is explicitly desired.

Characteristics:

- near-black/neutral background rather than saturated navy/purple,
- low-chroma borders,
- high text contrast for primary information,
- muted secondary text that still meets readability needs,
- one restrained accent family,
- semantic status colors tuned for dark backgrounds,
- little or no glow.

Avoid:

- neon cyberpunk by default,
- purple/blue gradient backgrounds,
- excessive transparency,
- glowing card borders,
- low-contrast gray-on-black text.

## Preset: Dense Operations

Use for highly technical tables or dashboards where scan speed matters more than spacious presentation.

Characteristics:

- compact row height,
- strong column alignment,
- sticky context where useful,
- restrained typography scale,
- inline status and actions,
- fewer large cards,
- strong grouping via spacing and separators,
- predictable filters and controls.

Do not confuse density with clutter. Remove redundant labels and decorative elements before shrinking spacing.

## Preset: Calm Minimal

Use for focused configuration or onboarding experiences.

Characteristics:

- generous but not wasteful whitespace,
- few surfaces,
- concise explanatory text,
- one clear primary action,
- muted neutral palette,
- subtle borders,
- low visual complexity.

Good for:

- first-run setup,
- provider connection,
- empty states,
- small configuration workflows.

## Converting a preset into tokens

Translate a preset into project-local decisions instead of importing a foreign design system wholesale.

Example:

```text
Requested: "Linear-like"

Derived LLMFreeway decisions:
- neutral Zinc/Slate family
- one controlled accent
- compact 32/24/16/8 spacing rhythm
- medium-to-small radius vocabulary
- subtle 1px borders
- minimal shadow
- compact toolbar and table rows
- `tracking-tight` for major headings
- visible focus states
- no gradient branding
```

Use existing Tailwind tokens/utilities where possible. Do not add a design-system dependency solely to obtain a preset.

## Preset selection rules

- Use one dominant preset per view.
- Do not merge three unrelated aesthetics into one screen.
- Product semantics override preset aesthetics.
- Accessibility overrides visual purity.
- Data readability overrides decorative consistency.
- Existing project conventions override unnecessary novelty.
- A preset may change visual language, but not control-plane behavior or backend contracts.

## Completion check

Before shipping a preset-driven redesign, verify:

- the result is recognizably coherent without copying another brand,
- the interface still feels like LLMFreeway,
- primary tasks and operational states remain obvious,
- English/Chinese text lengths remain viable,
- semantic colors still mean the same thing,
- responsive behavior is intentional,
- the anti-AI critique pass has been performed.