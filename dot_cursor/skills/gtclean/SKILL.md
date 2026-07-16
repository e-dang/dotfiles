---
name: gtclean
description: >-
  Lists and cleans up local Graphite tracked branches and git worktrees whose PRs
  are merged or closed. Use when the user invokes /gtclean or asks to clean up
  merged Graphite stacks, stale branches, or Cursor worktrees.
disable-model-invocation: true
---

# gtclean — Clean merged Graphite branches and worktrees

Run when the user wants to remove **local** Graphite branches and worktrees that are no longer needed because their PRs have merged or closed.

**This is a destructive workflow.** Always complete Phase 1 (discovery) and Phase 2 (confirmation) before running any delete or remove commands.

## Scope

- **Local only** — delete local branches and worktrees; do not delete remote branches or close PRs on GitHub.
- **Graphite tracked branches** — only branches that appear in `gt log short` (excluding trunk).
- **Merged or closed** — only branches whose associated PR is `MERGED` or `CLOSED`, or whose tip is already contained in trunk (`git branch --merged`).
- **Never touch trunk** (`main`, `master`, or whatever `gt repo` uses as trunk).

If the user names a specific repo, run all commands from that repo root (`git -C <path> …` or `cd` first). Otherwise use the current git repository.

## Phase 1 — Discover (read-only)

Run these from the target repo. Do not delete anything in this phase.

### 1. Refresh remote state

```bash
git fetch origin --prune
```

### 2. Identify trunk

```bash
TRUNK=$(git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null | sed 's|^origin/||')
echo "trunk=$TRUNK"
```

### 3. List Graphite tracked branches

```bash
gt log short --no-interactive
```

Parse branch names from this output (exclude trunk). `gt log` also shows worktree paths for branches checked out elsewhere — capture those.

### 4. List all worktrees

```bash
git worktree list
```

Note the **primary worktree** (first line) and the **current worktree** (where the shell is running).

### 5. Classify each Graphite branch

For every tracked branch except trunk, determine merge status:

```bash
BRANCH="<branch-name>"

# PR state (skip if no PR exists)
gh pr view "$BRANCH" --json state,mergedAt,closedAt,url 2>/dev/null

# Local merge into trunk
git merge-base --is-ancestor "$(git rev-parse "$BRANCH")" "origin/$TRUNK" 2>/dev/null && echo "merged-into-trunk"
```

A branch is a **cleanup candidate** when:

- Its PR state is `MERGED` or `CLOSED`, **or**
- Its tip is an ancestor of `origin/$TRUNK` (fully merged into trunk).

A branch is **not** a candidate when:

- PR is `OPEN` or `DRAFT`
- No PR exists and the branch is not merged into trunk
- It is trunk itself

Find the worktree path for each candidate (from `git worktree list` or `gt log`).

### 6. Find orphaned worktrees

After mapping branches, check for worktrees whose branch no longer exists or is already deleted:

```bash
git worktree list --porcelain
```

Include orphaned/stale worktree paths in the report (clean up with `git worktree remove` or `git worktree prune` after confirmation).

## Phase 2 — Report and wait for confirmation

Present a clear summary **before** any cleanup. Use this format:

```markdown
## gtclean — cleanup candidates

**Repo:** `<path>`
**Trunk:** `<trunk>`
**Current worktree:** `<path>` (branch: `<branch>`)

### Branches to delete

| Branch | PR | Status | Worktree |
|--------|-----|--------|----------|
| `edang/foo-123` | #456 (merged) | merged | `/path/to/worktree` |
| `edang/bar-789` | #789 (closed) | closed | — |

### Worktrees to remove

| Path | Branch | Notes |
|------|--------|-------|
| `/path/to/worktree` | `edang/foo-123` | branch will be deleted |

### Skipped (not cleaning)

| Branch | Reason |
|--------|--------|
| `edang/active-wip` | PR still open |

### Warnings

- [ ] Current session is in worktree X — removing it will end this session
- [ ] Branch Y has uncommitted changes (check with `git -C <worktree> status --short`)
```

**Stop here.** Ask the user to confirm before proceeding. Accept explicit confirmation such as "yes", "confirm", "go ahead", or "clean them up".

If there are **no candidates**, say so and stop — do not run delete commands.

If the user wants to exclude specific branches or worktrees, honor that and update the plan before executing.

## Phase 3 — Clean up (only after confirmation)

Execute in this order:

### 1. Remove worktrees first

Branches checked out in a worktree cannot be deleted until the worktree is removed.

For each worktree in the confirmed list (excluding any the user asked to keep):

```bash
git worktree remove "<path>"
```

If removal fails due to dirty state, report the error and ask whether to use `--force`:

```bash
git worktree remove --force "<path>"
```

Only use `--force` if the user explicitly confirms after seeing the dirty-state warning.

**Do not** remove the worktree the user is actively working in unless they explicitly confirm, even if it is on the cleanup list.

### 2. Delete Graphite branches

For each confirmed branch:

```bash
gt delete "<branch>"
```

Do **not** pass `--force` unless the user explicitly asked to delete unmerged branches. Merged/closed branches should delete without `--force`.

If a branch has upstack children that are also merged, delete from the top of the stack down, or use `gt delete --upstack` only when the entire upstack chain is on the confirmed list.

### 3. Prune stale worktree metadata

```bash
git worktree prune
```

### 4. Prune stale remote-tracking refs

```bash
git fetch origin --prune
```

## Phase 4 — Verify and summarize

After cleanup:

```bash
gt log short --no-interactive
git worktree list
```

Report what was removed:

```markdown
## gtclean — done

**Deleted branches:** `branch-a`, `branch-b`
**Removed worktrees:** `/path/a`, `/path/b`
**Skipped:** (anything excluded by user or blocked by errors)

**Remaining Graphite stacks:** (paste `gt log short` output or say "none")
```

If any step failed, list failures and what the user should do manually. Do not silently skip errors.

## Safety rules

- **Never** run Phase 3 without explicit user confirmation after Phase 2.
- **Never** use `gt sync --delete-all` or `gt sync -f` — those bypass the review step this skill requires.
- **Never** delete remote branches (`git push origin --delete`).
- **Never** delete branches with open PRs unless the user explicitly overrides after you warn them.
- Prefer `gt delete` over raw `git branch -D` so Graphite metadata stays consistent.
- When multiple repos have merged stacks, ask whether to clean one repo or all before starting.
