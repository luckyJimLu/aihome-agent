# Proxy Hub UI Context

Canonical sources: `DESIGN.md`, `UX-CONTRACT.md`, and current `hub/` implementation.

The product is a low-frequency household configuration tool, not an enterprise analytics dashboard.

Preserve:
- light theme and existing design tokens unless a task explicitly changes the design system,
- simple connection/source -> household plan -> device mental model,
- one obvious primary action per task,
- native controls where the product contract specifies them,
- zh-CN labels/messages,
- masked sensitive subscription/share URLs,
- explicit distinction between backend saved, generated, and client-updated states,
- failure recovery that keeps user input.

Do not copy LLMFreeway-specific provider/model/cost UI concepts into this repository.