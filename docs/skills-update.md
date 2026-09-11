# Updating shared Skills

Preview updates:

    .aihome/agent/scripts/update-skills.sh --profile cloudflare --check

Update to the latest main branch:

    .aihome/agent/scripts/update-skills.sh --profile cloudflare

Update to a release or exact commit:

    .aihome/agent/scripts/update-skills.sh --profile cloudflare --ref v0.1.0
    .aihome/agent/scripts/update-skills.sh --profile cloudflare --ref <commit-sha>

Replace existing project-local copies intentionally:

    .aihome/agent/scripts/update-skills.sh --profile cloudflare --force

The command fetches the central repository, displays the old and new commit, then re-syncs the selected profile. It does not modify secrets or business-private files.
