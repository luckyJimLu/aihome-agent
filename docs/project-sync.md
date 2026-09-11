# Project synchronization

From a new project's root:

    git init
    mkdir -p .aihome
    git clone https://github.com/luckyJimLu/aihome-agent.git .aihome/agent
    .aihome/agent/scripts/sync-project.sh --profile cloudflare

Available profiles are listed in profiles/index.yaml.

Use --ref v0.1.0 or a commit SHA for reproducible setup. Use --force only when intentionally replacing a project-local copy of a Skill. The script never copies secrets or business-specific contracts.
