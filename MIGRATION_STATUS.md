# Migration status

Updated: 2026-09-11

## Sources discovered

- `luckyJimLu/LLMFreeway/.agents`: routing rules, tests, and provider/control-plane Skills.
- `luckyJimLu/aihome-skills`: community, engineering, git, and platform Skill groups.
- `luckyJimLu/aihome-manifest`: bootstrap and cross-project configuration.
- Existing business repositories: profiles created for LLMFreeway, proxy-subscription-hub, HomeAI, privatecam-edge, utils, trading, and embedded/RIL.

## Migration rule

The central repository is the canonical source for reusable Agent/Skill definitions. Original repositories remain the source of truth for business contracts and private configuration until each migration is validated. No secrets or private runtime values are copied.

## Next migration batch

1. Enumerate every existing `.agents`, `.claude`, `.opencode`, and `agents` directory.
2. Copy reusable files with provenance and license records.
3. Deduplicate overlapping Skills and add thin project entrypoints.
4. Validate each Skill in its target runtime before removing the original.
