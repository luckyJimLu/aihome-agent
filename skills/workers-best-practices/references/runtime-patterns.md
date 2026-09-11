# Workers Runtime Patterns

## Streaming

Stream large or unbounded bodies instead of buffering them fully in memory.

Buffering is acceptable only when the payload is known to be small and bounded.

For LLMFreeway this matters especially for model streaming: once output bytes are exposed, do not transparently replay the request in a way that violates `docs/CONTRACTS.md`.

## Promise lifetime

Every async operation must be:

- awaited,
- returned, or
- attached to `ctx.waitUntil()` when it is legitimate post-response work.

Do not leave floating promises.

Use `ctx.waitUntil()` for non-critical post-response work such as telemetry when failure does not need to delay the response. Do not use it to hide work that must complete before correctness is established.

## Request state

Workers may reuse isolates across requests. Do not store request-specific mutable data in module-level state.

Pass request state explicitly through parameters or request-local objects.

## Cloudflare bindings

Use Cloudflare service bindings instead of calling Cloudflare REST endpoints from a Worker when a binding provides the capability.

For Worker-to-Worker calls, prefer service bindings over public-network calls when the architecture supports them.

## Long-running work

Move long-running, retriable, or durable multi-step work away from request handlers when appropriate.

Use the platform primitive that matches semantics:

- Queue: buffering, fan-out, simple asynchronous work,
- Workflow: durable multi-step execution,
- Durable Object: stateful coordination.

Do not introduce these services solely because they exist; justify them with a current requirement.

## Security

- Use Web Crypto for security-sensitive randomness.
- Avoid timing-sensitive direct comparisons of secrets when a constant-time approach is required.
- Return controlled errors; do not leak credentials or internal provider details.
- Avoid fail-open behavior that silently bypasses LLMFreeway routing, cost, or security constraints.

## Testing

Prefer Cloudflare's current Workers Vitest integration for Worker-runtime unit/integration tests when adding Workers-specific test infrastructure.

A Node-only test suite is not sufficient evidence for Workers-runtime-specific behavior.
