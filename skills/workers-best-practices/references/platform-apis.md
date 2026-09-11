# Workers Platform API Checks

## Source of truth

For handler signatures, platform classes, bindings, and serialization rules:

1. inspect project-generated types and installed package types,
2. inspect the installed Wrangler schema,
3. consult current official Cloudflare docs when uncertain.

Do not force a type to fit with `any` or `as unknown as T` when the platform contract disagrees.

## Binding access

Use the correct binding access pattern for the execution model:

- module handlers receive bindings through the handler environment parameter,
- Cloudflare platform base classes generally expose bindings through their instance environment.

Verify the exact current class/API pattern from project types or official docs before editing.

## Platform classes

When using Cloudflare base classes, verify:

- import path,
- whether the class should be extended,
- generic parameters,
- constructor expectations,
- current property names,
- runtime compatibility requirements.

Do not copy old Durable Object, Workflow, Agent, or WorkerEntrypoint examples without checking current types.

## Serialization boundaries

Do not assume one serialization model applies everywhere.

Verify the target API for:

- Queue messages,
- Workflow step inputs/results,
- Durable Object storage,
- Durable Object SQL parameters,
- WebSocket messages,
- RPC/service-binding payloads.

Encode data explicitly when the boundary requires it.
