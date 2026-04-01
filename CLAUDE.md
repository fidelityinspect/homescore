# Claude Workspace — Master Index

> **This is the root of a multi-project knowledge management system.**
> Claude: Read this file first, then selectively load only what's relevant.

## How This System Works

This repo is organized as a **vault** — a central hub for all projects, memory,
and documents. It's designed to scale across dozens of projects over years.

**Claude should NOT read everything.** Follow this protocol:

1. Read this file (the index)
2. Read `memory/index.md` to understand what exists
3. Based on what the user is asking about, load ONLY the relevant project
   or memory files — not the whole vault
4. At end of session, update the relevant project status + add a session log entry

## Directory Structure

```
homescore/                    ← repo root (rename to "vault" or "workspace" later)
│
├── CLAUDE.md                 ← YOU ARE HERE — master index & routing rules
│
├── memory/                   ← Persistent cross-project memory
│   ├── index.md              ← Master catalog of everything in the vault
│   ├── preferences.md        ← User preferences, coding style, tool choices
│   ├── contacts.md           ← People, accounts, services referenced
│   └── lessons-learned.md    ← Mistakes to avoid, patterns that work
│
├── projects/                 ← One subfolder per project
│   └── homescore/            ← Example: the HomeScore project
│       ├── README.md         ← Project overview & current status
│       ├── decisions.md      ← Architectural decisions for THIS project
│       ├── status.md         ← Current state, next steps, blockers
│       └── src/              ← Actual project files
│
├── sessions/                 ← Session logs organized by month
│   └── 2026-04/              
│       └── 2026-04-01.md     ← What happened today across all projects
│
└── documents/                ← Reference docs, research, saved conversations
    └── README.md             ← Index of stored documents
```

## Rules for Claude Sessions

1. **Be selective** — Don't read files you don't need. Check the index first.
2. **Never hallucinate** — Always read a file before referencing its contents.
3. **Check before proposing** — Read the project's `decisions.md` before
   suggesting alternatives to past decisions.
4. **Log your work** — Add to `sessions/YYYY-MM/YYYY-MM-DD.md` before ending.
5. **Update the index** — If you create new projects or documents, update
   `memory/index.md` so future sessions can find them.
6. **Don't duplicate work** — Check session logs for what's already been done.

## Cross-Device Sync

```bash
# Starting work on any device
git pull origin main

# Finishing work on any device
git add -A && git commit -m "sync: <brief description>" && git push
```

## Quick Commands for Users

- "What projects do I have?" → Claude reads `memory/index.md`
- "Pick up where I left off on X" → Claude reads `projects/X/status.md` + latest session log
- "What did we decide about X?" → Claude reads `projects/X/decisions.md`
- "Save this conversation" → Claude writes to `documents/` and updates index
