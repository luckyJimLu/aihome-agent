---
name: agent-skill-migration
description: Analyze a new or existing project and synchronize only the Agent Skills required by its architecture, project documents, runtime, and delivery stage. Use when a project needs to connect to aihome-agent, migrate existing .agents/.claude/.opencode Skills, create or update a project profile, or remove duplicate Skill routing.
---

# Agent Skill Migration

## Goal

Turn project evidence into a minimal, reproducible Skill set. Do not copy every available Skill.

## Inputs

Read in this order:

1. Project README and architecture/design documents.
2. Project AGENTS.md, .agents/, .claude/, .opencode/, agents/, and existing Skill directories.
3. Build, test, deployment, and CI configuration.
4. aihome-agent skills/catalog.yaml and profiles/index.yaml.
5. Relevant Issue acceptance criteria when available.

## Workflow

1. Inventory existing Agent and Skill files.
2. Extract project capabilities, technologies, deployment targets, security boundaries, and current phase.
3. Match capabilities to catalogued Skills.
4. Classify each match as required, useful, duplicate, project-private, or not applicable.
5. Create or update profiles/<project>.yaml with only required and useful Skills.
6. Preserve project-private contracts and secrets in the project repository.
7. Use scripts/sync-project.sh to synchronize selected Skills.
8. Produce a migration report containing source path, destination path, source commit, license, reason, and validation result.
9. Ask for human approval before deleting or replacing local Skills.

## OpenCode execution prompt

Use this prompt from the project root:

Analyze this project and migrate only the Skills required by its design documents and current implementation stage from luckyJimLu/aihome-agent. First produce an inventory and proposed profile. Then run the synchronization script only after checking for duplicate routes, private data, and unsupported assumptions. Do not delete local Skills. Finish with the profile, files changed, validation commands, risks, and Skills used.

## Safety

- Never copy credentials, cookies, private URLs, wallet keys, customer data, or business-only contracts.
- Never enable remote hooks or automatic recall without explicit approval.
- Never replace a project-local Skill automatically.
- Prefer a thin SKILL.md and progressive disclosure through references/.
- Use a pinned commit for production and record provenance.
