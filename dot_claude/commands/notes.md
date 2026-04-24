# Write Up Work in Obsidian Notes

You just finished a piece of work — a story, a bug fix, ad-hoc refactoring, whatever it was. Your job is to record what was done, what was learned, and update any relevant tracking in the Obsidian notes vault.

**IMPORTANT:** Before doing anything, read `notes/_reference-planning-process.md` and `notes/_reference-vault-guide.md` to understand the vault conventions. Follow them exactly. Read templates from `notes/_templates/` before creating any new notes. Replace `{{date}}` with today's date (YYYY-MM-DD).

## Step 1: Understand what was done

- Use `git log` and `git diff` to review recent commits and changes (on the current branch vs main, or recent commits on main)
- Read the changed files to understand what was built, fixed, or refactored
- Identify: decisions made, patterns established, issues encountered, gotchas discovered

## Step 2: Determine which feature folder(s) this work belongs to

- Look at the files changed — which domain area do they fall under?
- Find the matching feature folder in `notes/` (e.g., `notes/programs/`, `notes/architecture/`, `notes/workouts/`)
- If no feature folder exists and the work is substantial enough to warrant one, create it with a `backlog.md`
- Read that folder's `backlog.md`

## Step 3: Determine if this work is tied to an existing story

- Check if any story in the backlog matches the work that was done
- If yes, read the story file to understand its scope and acceptance criteria
- If no, that's fine — not all work is story-driven

## Step 4: Create notes for findings (if applicable)

For each significant discovery, create the appropriate note type in the relevant feature folder:

- **`decision-{slug}.md`** — Chose approach A over B and the reasoning matters for future work
- **`pattern-{slug}.md`** — Established a reusable code pattern others should follow
- **`issue-{slug}.md`** — Hit a gotcha, bug, or known problem worth documenting

Only create these if genuinely useful — don't manufacture findings for the sake of it. Each issue note must also be added to the feature's `backlog.md` as a `- [ ] [[issue-slug]]` entry in Pending.

## Step 5: Create task files for completed subtasks (if story-driven)

If the work completed subtasks within a story:

1. For each completed subtask, create a `task-{slug}.md` in the feature folder using the task template
2. Each task file should record what was done (Summary) and key files changed (Changes)
3. Update the subtask checkbox in the story to include a wikilink: `- [x] Migrate foo — [[task-migrate-foo]]`
4. Task files for subtasks do not need their own backlog entries — they are tracked through the parent story

## Step 6: Update story (if this work completes one)

If the work completes a user story:

1. Add wikilinks to any new findings notes in the story's `## Findings` section (must be the last section)
2. Set `status: complete` in the story's frontmatter
3. Update `updated:` date to today
4. In the feature's `backlog.md`:
   - Move the story entry from **Pending** or **In Progress** to **Completed**
   - Change checkbox from `[ ]` or `[~]` to `[x]`
   - Remove any priority suffix (e.g., `— P1`)

## Step 7: Summarize

Tell the user:

- What notes were created and why
- Whether a story was closed out (and if so, which one)
- Any acceptance criteria that looked unfinished or unmet
- Any loose ends worth tracking
