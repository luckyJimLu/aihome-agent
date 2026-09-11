# Client and CI Trust Boundaries

Use this reference when changes touch Vite/browser configuration, localStorage, GitHub Actions, deployment automation, or credentials.

## Browser/Vite boundary

Treat all client-bundled values as public to the user running the app.

- Never place API tokens, provider keys, bearer credentials, private URLs, or signing secrets in `VITE_*` variables.
- Do not store secrets in localStorage, sessionStorage, IndexedDB, or generated frontend assets.
- Public identifiers such as account IDs or gateway IDs may be exposed only when they are genuinely non-secret and safe for the product context.
- Do not confuse obscurity or build-time substitution with secret protection.
- Client code must call a trusted backend/control plane for privileged operations.

## GitHub Actions boundary

- Use explicit least-privilege `permissions`.
- Keep production credentials out of pull-request and untrusted-fork contexts.
- Prefer environment-scoped secrets/protection for production jobs.
- Pin sensitive third-party actions to immutable commit SHAs when repository policy requires it.
- Avoid printing credential-bearing commands, headers, payloads, or environment dumps.
- Sanitize uploaded artifacts and logs.
- Keep deployment jobs separate from read-only discovery/validation when possible.

## Generated artifacts

Generated manifests, examples, fixtures, screenshots, issue text, and CI artifacts must contain credential references only, never secret values.

When a change crosses browser -> backend, CI -> production, repository -> external provider, or user input -> network boundary, trace the data flow explicitly before approving it.