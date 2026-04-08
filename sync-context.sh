#!/bin/bash
# Generates a single context file from the vault for pasting into
# Claude mobile/web sessions or uploading to Claude Projects.
#
# Usage: ./sync-context.sh > context.txt
#   Then copy/paste into Claude chat or upload to a Claude Project

VAULT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "# Claude Workspace Context"
echo "> Auto-generated on $(date '+%Y-%m-%d %H:%M') — paste this into any Claude session"
echo ""
echo "---"
echo ""

echo "## Memory Index"
echo ""
cat "$VAULT_DIR/memory/index.md" 2>/dev/null
echo ""
echo "---"
echo ""

echo "## Preferences"
echo ""
cat "$VAULT_DIR/memory/preferences.md" 2>/dev/null
echo ""
echo "---"
echo ""

echo "## Lessons Learned"
echo ""
cat "$VAULT_DIR/memory/lessons-learned.md" 2>/dev/null
echo ""
echo "---"
echo ""

# Include status for each project
for project_dir in "$VAULT_DIR"/projects/*/; do
    project_name=$(basename "$project_dir")
    if [ -f "$project_dir/status.md" ]; then
        echo "## Project: $project_name — Status"
        echo ""
        cat "$project_dir/status.md"
        echo ""
        echo "---"
        echo ""
    fi
    if [ -f "$project_dir/decisions.md" ]; then
        echo "## Project: $project_name — Decisions"
        echo ""
        cat "$project_dir/decisions.md"
        echo ""
        echo "---"
        echo ""
    fi
done

# Include most recent session log
latest_session=$(find "$VAULT_DIR/sessions" -name "*.md" -type f 2>/dev/null | sort -r | head -1)
if [ -n "$latest_session" ]; then
    echo "## Most Recent Session Log"
    echo ""
    cat "$latest_session"
    echo ""
fi

echo ""
echo "---"
echo "> If you made progress in this session, ask me to summarize it so"
echo "> you can paste the update back into the vault on your computer."
