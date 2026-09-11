# aihome-agent

## Purpose
Single source of truth for reusable Agents, Skills, rules, and MCP profiles shared by Luke Lu's projects.

## Routing
- Read the project profile in `profiles/` before selecting Skills.
- Prefer one primary Skill and load references only when needed.
- Do not duplicate canonical contracts from business repositories.
- Project-specific credentials, strategies, customer data, and private endpoints stay in the business repository.
- External Skills must be reviewed, pinned, and recorded in `THIRD_PARTY.md`.
- Validate changed Skills before release; report the exact Skills used.

## Change policy
Every change must include scope, affected profiles, validation commands, and compatibility notes.
