---
name: web-design-guidelines
description: Review Proxy Subscription Hub UI for accessibility, responsive behavior, keyboard/focus handling, forms/errors, dialogs, localization, long-content handling and honest status communication. Use as a review Skill, not as authority to replace DESIGN.md or UX-CONTRACT.md.
metadata:
  adapted_from: LLMFreeway web-design-guidelines / Vercel interface guidance
---

# Web Design Guidelines

Canonical project UI rules come from `DESIGN.md` and `UX-CONTRACT.md`.

Review modified UI for:
- semantic controls and labels,
- keyboard/focus-visible behavior,
- dialog focus containment/restoration,
- sufficient touch targets,
- responsive layout without unintended horizontal overflow,
- zh-CN copy and long URL/hostname wrapping,
- error messages that explain recovery,
- loading/progress that does not invent percentages,
- reduced-motion/forced-colors behavior where relevant,
- status text accompanying color/icon cues,
- sensitive values masked and clipboard fallbacks reported truthfully.