# Anti-AI UI Doctrine

Use this reference when redesigning, polishing, normalizing, or critiquing an interface that feels generically AI-generated.

The goal is not to reject modern UI patterns. The goal is to remove visual decisions that are present only because they are common defaults in generated interfaces rather than because they serve LLMFreeway's product needs.

## Core test

For every prominent visual choice, ask:

1. What product or information problem does this solve?
2. Would the interface still be clear if this decoration were removed?
3. Does this choice reinforce LLMFreeway's technical, routing, cost, or status concepts?
4. Is the pattern repeated because it is useful, or merely because it is fashionable?

If a visual element has no clear answer, simplify it.

## Common generated-UI anti-patterns

Actively detect and reconsider:

- saturated purple/indigo/blue gradients used as default branding,
- gradient text used without semantic purpose,
- glassmorphism or glow effects on ordinary product surfaces,
- every section wrapped in a rounded card,
- cards nested inside cards,
- oversized corner radii applied indiscriminately,
- heavy shadows where a subtle border or surface contrast would work,
- large decorative hero headings inside operational/dashboard screens,
- identical KPI cards with equal visual weight regardless of importance,
- decorative badges and pills for plain metadata,
- rounded-square icon tiles placed before every heading,
- oversized icons used to make sparse content feel substantial,
- floating decorative shapes or background blobs,
- excessive empty marketing copy in a data-heavy product,
- random accent colors that do not represent state or action,
- animation on every hover or state change,
- repeated 'modern SaaS' layouts that could belong to any unrelated product.

These are not absolute bans. Use one only when it has a concrete product purpose and fits the chosen visual direction.

## Preferred LLMFreeway character

Aim for a developer-tool interface that communicates:

- control,
- trust,
- routing visibility,
- cost awareness,
- system state,
- diagnosability,
- restrained technical confidence.

Prefer:

- neutral surfaces,
- deliberate information density,
- clear typography,
- fine borders,
- restrained radius,
- one controlled accent family,
- semantic status colors,
- compact but readable controls,
- visual emphasis proportional to operational importance.

Do not imitate a specific product brand. Extract useful design characteristics and adapt them to LLMFreeway.

## Color discipline

Use a neutral base such as Zinc, Slate, or another existing project neutral system.

Choose one primary accent family for interactive emphasis. Semantic colors remain reserved for meaning such as success, warning, error, degraded state, or informational status.

Avoid introducing multiple saturated accent families in the same view unless they encode distinct data categories users genuinely need to compare.

Before adding a gradient, answer why a flat color, border, typography, or spacing cannot communicate the same hierarchy more clearly.

## Surface discipline

A surface should communicate one of:

- grouping,
- state,
- elevation,
- interaction boundary,
- meaningful contrast.

Do not create a card merely because content forms a rectangular block.

Prefer spacing and alignment for grouping before adding another container.

Preferred hierarchy:

```text
page background
  -> section grouping by spacing
  -> subtle bordered/surface container when needed
  -> popover/dialog elevation only where actual depth exists
```

## Typography discipline

Use typography to establish hierarchy before visual effects.

- Keep the type scale small and intentional.
- Use strong weight differences sparingly.
- Prefer `tracking-tight` or equivalent for important compact headings when it fits the existing type system.
- Keep body copy concise in operational views.
- Use muted text only for genuinely secondary information.
- Do not make every label bold.

For IDs, costs, latency, token counts, percentages, and aligned metrics, prefer numeric treatment that improves comparison when supported by the current font stack.

## Spacing discipline

Use a consistent spacing rhythm. An 8pt-oriented system is preferred for normal layout decisions, with 4px only for micro-adjustments.

Typical rhythm:

```text
4   micro adjustment
8   tightly related content
16  normal component spacing
24  grouped component spacing
32  section separation
48+ major page separation
```

Do not fix clutter by shrinking all spacing. First remove redundant containers, labels, dividers, and decoration.

## Interaction discipline

Interactions should feel responsive, not theatrical.

Prefer subtle 150-250ms feedback for color, border, background, opacity, or small transforms.

Every relevant control should have intentional:

- default,
- hover,
- focus-visible,
- active/selected,
- disabled,
- loading,
- error states.

Avoid motion that does not explain state or spatial relationship. Respect reduced-motion preferences for meaningful animation.

## Dashboard/data-view discipline

For model/provider/routing/cost views:

- prioritize scanability over decoration,
- give high-impact state more visual weight than metadata,
- align comparable values,
- keep actions near the objects they affect,
- avoid treating every metric as equally important,
- distinguish configured/desired state from deployed/observed state when both exist,
- never use color alone to communicate policy state.

## Anti-AI critique pass

Before completing a substantial visual refactor, perform this pass:

1. Remove one layer of unnecessary containers where possible.
2. Remove decorative gradients/glows that do not communicate product meaning.
3. Reduce unnecessary radius variation.
4. Replace heavy shadows with spacing, borders, or surface contrast where possible.
5. Remove decorative badges/pills that carry no meaningful state.
6. Check whether the page still resembles a generic SaaS template.
7. Strengthen product-specific information hierarchy instead of adding decoration.
8. Verify that the design remains usable in both English and Chinese content lengths.

A successful result should feel intentionally designed for LLMFreeway rather than merely 'more polished'.