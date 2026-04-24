You are currently in a git worktree. Your job is to merge this worktree's branch back into main and handle everything autonomously.

IMPORTANT: All commits must be made under the user's own GitHub name and account. Do NOT add any Claude Code co-author trailers, Claude references, or AI attribution to any commits.

1. Run `git branch --show-current` to get your branch name.
2. Check `git status` for uncommitted changes. If there are any, run `git add -A && git commit -m "<descriptive message>"`.
3. Get the main worktree root: `git worktree list | head -1 | awk '{print $1}'`
4. Rebase onto main to incorporate any changes that landed while you were working: `git rebase main`. If there are rebase conflicts, resolve them before proceeding.
5. In the main worktree, attempt the merge:
   `git -C <main-worktree-path> merge <your-branch> --no-ff --no-commit`
6. Check for merge conflicts:
   - If NO conflicts: complete the merge commit and report what was merged.
   - If there ARE conflicts:
     a. Read both versions of each conflicting file.
     b. Analyze what this branch was trying to accomplish and what main has.
     c. **Present a plan** to the user describing how you intend to resolve each conflict. Explain what changes you will keep, discard, or combine, and why.
     d. **Wait for user approval** before making any conflict resolution edits.
     e. After approval, resolve the conflicts in the main worktree, stage the resolved files, and complete the merge commit.
7. Report what was merged and any conflicts that were resolved.
