#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Update shared aihome-agent Skills.

Usage:
  update-skills.sh --profile <name> [--project <dir>] [--ref <ref>] [--force] [--check]

Options:
  --profile <name>   Project profile to resync
  --project <dir>    Project directory, default is current directory
  --ref <ref>        Branch, tag, or commit; default is origin/main
  --force             Replace existing project-local Skill copies
  --check             Show pending changes without syncing
EOF
}

PROFILE=""
PROJECT_DIR="$(pwd)"
REF="origin/main"
FORCE="false"
CHECK="false"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --profile) PROFILE="${2:-}"; shift 2 ;;
    --project) PROJECT_DIR="${2:-}"; shift 2 ;;
    --ref) REF="${2:-}"; shift 2 ;;
    --force) FORCE="true"; shift ;;
    --check) CHECK="true"; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
done

[[ -n "$PROFILE" ]] || { echo "ERROR: --profile is required" >&2; usage >&2; exit 2; }
command -v git >/dev/null || { echo "ERROR: git is required" >&2; exit 1; }

PROJECT_DIR="$(cd "$PROJECT_DIR" && pwd)"
AGENT_DIR="$PROJECT_DIR/.aihome/agent"
SYNC_SCRIPT="$AGENT_DIR/scripts/sync-project.sh"

[[ -d "$AGENT_DIR" ]] || {
  echo "ERROR: shared repository is not connected at $AGENT_DIR" >&2
  echo "Run the sync script once before updating." >&2
  exit 1
}
[[ -f "$SYNC_SCRIPT" ]] || {
  echo "ERROR: sync-project.sh not found in $AGENT_DIR" >&2
  exit 1
}

before="$(git -C "$AGENT_DIR" rev-parse HEAD)"
git -C "$AGENT_DIR" fetch --tags origin

if [[ "$REF" == origin/* ]]; then
  git -C "$AGENT_DIR" checkout --detach "$REF" >/dev/null
else
  git -C "$AGENT_DIR" checkout --detach "$REF" >/dev/null
fi

after="$(git -C "$AGENT_DIR" rev-parse HEAD)"
echo "aihome-agent: $before -> $after"

if [[ "$CHECK" == "true" ]]; then
  if [[ "$before" == "$after" ]]; then
    echo "No update available."
  else
    git -C "$AGENT_DIR" diff --stat "$before" "$after"
    git -C "$AGENT_DIR" log --oneline --decorate "$before..$after" | head -20
  fi
  exit 0
fi

"$SYNC_SCRIPT" sync --profile "$PROFILE" --project "$PROJECT_DIR" --ref "$after" $([[ "$FORCE" == "true" ]] && echo "--force")

echo "Updated and synchronized profile: $PROFILE"
echo "Review changes, then commit the submodule and synced Skills."
