# git-tools

A small collection of git helpers and shell scripts for working with repositories and worktrees.

## Contents

### [ext-commands/](ext-commands/README.md) — Git subcommands

Custom commands that plug into git as `git <command>`.

| Command | What it does |
|---------|-------------|
| `git wt` | Sets up and manages a **bare-repo + worktree** layout — one container folder holding the bare object store and one sibling folder per branch. Supports `init`, `migrate`, and `add`. |

### [scripts/](scripts/README.md) — Standalone shell tools

Standalone tools that live on your `PATH` but are not git subcommands.

| Script | What it does |
|--------|-------------|
| `gj` / `gj-pick` | Fuzzy-jump to any git repo or worktree under your home directory (or the current directory with `--cwd`). Uses `fzf` to pick and then `cd`s into it. |
