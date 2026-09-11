#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  sync-project.sh --profile <name> [--project <dir>] [--ref <ref>] [--force]
EOF
}

PROFILE=""
PROJECT_DIR="$(pwd)"
REF=""
FORCE="false"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --profile) PROFILE="${2:-}"; shift 2 ;;
    --project) PROJECT_DIR="${2:-}"; shift 2 ;;
    --ref) REF="${2:-}"; shift 2 ;;
    --force) FORCE="true"; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
done

[[ -n "$PROFILE" ]] || { echo "ERROR: --profile is required" >&2; usage >&2; exit 2; }
command -v git >/dev/null || { echo "ERROR: git is required" >&2; exit 1; }

PROJECT_DIR="$(cd "$PROJECT_DIR" && pwd)"
AGENT_DIR="$PROJECT_DIR/.aihome/agent"
PROFILE_FILE="$AGENT_DIR/profiles/$PROFILE.yaml"
SKILLS_DIR="$PROJECT_DIR/.agents/skills"

if [[ ! -d "$AGENT_DIR/.git" && ! -f "$AGENT_DIR/.git" ]]; then
  mkdir -p "$PROJECT_DIR/.aihome"
  echo "Adding aihome-agent as a submodule..."
  git -C "$PROJECT_DIR" submodule add "https://github.com/luckyJimLu/aihome-agent.git" .aihome/agent
fi

git -C "$AGENT_DIR" fetch --tags origin --quiet
if [[ -n "$REF" ]]; then
  git -C "$AGENT_DIR" checkout "$REF"
fi

[[ -f "$PROFILE_FILE" ]] || { echo "ERROR: profile not found: $PROFILE_FILE" >&2; exit 1; }

mkdir -p "$SKILLS_DIR"
mapfile -t SKILLS < <(
  awk '
    /^skills:[[:space:]]*$/ { in_skills=1; next }
    in_skills && /^[^[:space:]]/ { exit }
    in_skills && /^[[:space:]]*-[[:space:]]*/ {
      sub(/^[[:space:]]*-[[:space:]]*/, "")
      sub(/[[:space:]]+#.*/, "")
      print
    }
  ' "$PROFILE_FILE"
)

for skill in "${SKILLS[@]}"; do
  [[ -n "$skill" ]] || continue
  source="$AGENT_DIR/skills/$skill"
  target="$SKILLS_DIR/$skill"

  if [[ ! -d "$source" ]]; then
    echo "WARNING: skill source not found, skipped: $skill"
    continue
  fi
  if [[ -e "$target" && "$FORCE" != "true" ]]; then
    echo "SKIP: target exists (use --force to replace): $target"
    continue
  fi
  [[ ! -e "$target" ]] || rm -rf "$target"
  mkdir -p "$target"
  cp -R "$source"/. "$target"/
  echo "SYNC: $skill"
done

cat > "$PROJECT_DIR/.agents/AGENTS.md" <<'EOF'
# Project Agent Entry

This project consumes the shared Agent catalog from .aihome/agent.

Before a non-trivial task:

1. Read .aihome/agent/AGENTS.md.
2. Read .aihome/project.yaml and the selected profile.
3. Load only Skills relevant to the current task.
4. Keep secrets, business contracts, and private runtime values in this repository.
5. Report the exact Skills used after completing the task.
EOF

cat > "$PROJECT_DIR/.aihome/project.yaml" <<EOF
project:
  profile: $PROFILE
  agent_repository: luckyJimLu/aihome-agent
  agent_path: .aihome/agent
  ref: ${REF:-main}
sync:
  skills_path: .agents/skills
  force: $FORCE
EOF

echo "Completed: profile=$PROFILE"
echo "Review changes, then run: git add .aihome .agents"
