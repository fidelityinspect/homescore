# HomeScore Project — Claude Workspace Memory

> **Every Claude session (Code, Chat, Cowork) should read this file first.**
> This is the single source of truth for project context, decisions, and status.

## Quick Start for Any New Session

1. Read this file completely
2. Check `.workspace/status.md` for current project state
3. Check `.workspace/decisions.md` before making architectural choices
4. After completing work, **update status.md and session-log.md** before ending

## Project Overview

**HomeScore** is a home inspection/lifecycle scoring tool that helps homeowners
understand the condition, remaining lifespan, and replacement costs of major
home components. It visualizes this data through interactive graphs and cards.

### Key Files

| File | Purpose |
|------|---------|
| `homescore-v6.1.html` | CSV export feature for component data |
| `page` | Main application page |
| `Graph_Cards` | Graph and card UI components |
| `v10_graph_only` | v10 graph-only view |
| `probabilities` | Probability calculations for component lifecycles |

## Cross-Device Workflow

This repo is the shared memory across all devices. Before starting work:

```bash
git pull origin main
```

After finishing work, always commit and push:

```bash
git add -A && git commit -m "sync: <brief description>" && git push
```

## Rules for Claude Sessions

1. **Never hallucinate file contents** — always read files before referencing them
2. **Check `.workspace/decisions.md`** before proposing alternatives to past decisions
3. **Log what you did** in `.workspace/session-log.md` at end of session
4. **Update `.workspace/status.md`** if project state changed
5. **Don't duplicate work** — check session log for what's already been done
6. **Ask before large refactors** — small focused changes are preferred
