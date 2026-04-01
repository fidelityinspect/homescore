# Architectural Decisions

> Before proposing a new approach, CHECK HERE to see if it was already decided.
> Format: Date — Decision — Reasoning

## Decisions Log

### 2026-04-01 — Use Git repo as cross-device sync layer
**Decision:** Store all project memory, context, and session history directly in
the Git repository rather than external services.
**Reasoning:** Git is already set up, works on all devices, Claude Code reads it
natively, and it creates an auditable history of changes. No extra tooling needed.

### 2026-04-01 — CLAUDE.md as session bootstrap
**Decision:** Use CLAUDE.md at repo root as the primary context file that every
Claude session reads automatically on startup.
**Reasoning:** Claude Code, Chat, and Cowork all support reading CLAUDE.md as
project instructions. This gives every session immediate context.

### 2026-04-01 — .workspace/ directory for structured memory
**Decision:** Use `.workspace/` directory with specific files (status.md,
decisions.md, session-log.md, scratchpad.md) for persistent project memory.
**Reasoning:** Keeps memory organized and queryable. Separating concerns
(status vs decisions vs logs) prevents files from becoming unwieldy.
