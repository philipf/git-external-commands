# shell-init.sh — shell wrappers for the git-tools commands.
#
# These are the bits that must live in your shell (not in a standalone binary)
# because a child process can't change its parent shell's working directory.
# Each wrapper runs the real tool, then cd's where it points.
#
# Install: source this from your shell rc (~/.zshrc / ~/.bashrc — works in both):
#
#   source ~/projects/git-tools/shell-init.sh
#
# The tools themselves (git-wt, gj-pick) must be on your PATH — see
# wt/README.md and gj/README.md for those install steps.

# wt — `git wt`, but cd into the worktree it creates (add/init/migrate).
# git-wt writes the target path to $GIT_WT_CD_FILE on success; we read it back.
# Plain `git wt …` (var unset) is unaffected and just prints a cd hint.
wt() {
  local f d
  f=$(mktemp) || { git wt "$@"; return; }
  GIT_WT_CD_FILE="$f" git wt "$@"
  local status=$?
  d=$(cat "$f" 2>/dev/null); rm -f "$f"
  [ -n "$d" ] && [ -d "$d" ] && cd "$d"
  return $status
}

# gj — fuzzy-pick a git repo/worktree and cd into it (gj-pick prints the path).
gj()  { local d; d=$(gj-pick "$@") || return; [ -n "$d" ] && cd "$d"; }

# gjj — same as gj, but scoped to the current directory.
gjj() { gj --cwd "$@"; }
