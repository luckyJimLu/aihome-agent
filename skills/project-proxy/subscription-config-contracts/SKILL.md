---
name: subscription-config-contracts
description: Work on Proxy Subscription Hub source ingestion, Sub-Store integration, Collections/scenario grouping, node filtering/renaming, Mihomo/Clash.Meta, v2rayN or Shadowrocket output semantics, generated subscription links and policy templates. Use when changes can alter which nodes or rules reach clients.
---

# Subscription Configuration Contracts

Read `docs/DEVELOPMENT.md` before changing subscription semantics.

## Preserve layer boundaries

```text
Source: where node data comes from
Collection: reusable node set
Policy/template: routing and scene behavior
Client adapter: output syntax/format
```

Do not create separate top-level scenes merely because clients differ. Client-specific syntax belongs in adapters/templates.

## Safety invariants
- Never commit real upstream URLs or tokens.
- Never leak protected source credentials into generated client output.
- Keep node filtering/renaming deterministic and explainable.
- Treat regex changes as behavior changes; test representative node names.
- Preserve AI/fixed-exit semantics documented by the project; do not claim anonymity or service compatibility from geography alone.
- Generated outputs must not silently broaden DIRECT/proxy/REJECT behavior.

## Verification
For generator/policy changes, validate at least one representative output for every affected client family and inspect for secret leakage and invalid syntax.