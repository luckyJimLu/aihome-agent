# Architecture

```
Business repositories
        ↓ thin AGENTS.md + .aihome/project.yaml
aihome-agent: agents / skills / rules / mcp / profiles
        ↓ execution
aihome-tools: scripts / Docker / CI / adapters
```

## Layers

1. Agent role: defines responsibility and decision boundary.
2. Skill: defines one reusable capability.
3. Profile: selects Skills for a repository.
4. Rule: defines cross-project safety and delivery constraints.
5. Tool: implemented in aihome-tools or the business repository.

## Versioning

Business repositories should consume a tagged commit or release of aihome-agent. Floating main is allowed only during development.
