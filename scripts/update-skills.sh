#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Update shared aihome-agent Skills.

Usage:
  update-skills.sh --profile <name> [--project <dir>] [--ref <ref>] [--force] [--check]
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

[[ -d "$AGENT_DIR" && -f "$SYNC_SCRIPT" ]] || {
  echo "ERROR: aihome-agent is not connected at $AGENT_DIR" >&2
  exit 1
}

before="$(git -C "$AGENT_DIR" rev-parse HEAD)"
git -C "$AGENT_DIR" fetch --tags origin
git -C "$AGENT_DIR" checkout --detach "$REF" >/dev/null
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

ARGS=(--profile "$PROFILE" --project "$PROJECT_DIR" --ref "$after")
[[ "$FORCE" == "true" ]] && ARGS+=(--force)
"$SYNC_SCRIPT" "${ARGS[@]}"

echo "Updated and synchronized profile: $PROFILE"
echo "Review changes, then commit .aihome and .agents."
