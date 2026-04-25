---
type: reference
tldr: 'Rules for writing PRDs, user stories, and backlogs.'
status: active
created: {{date}}
updated: {{date}}
tags: []
---

## Planning Process

1. Write or update the feature's `prd.md`
2. Use the PRD as the source of truth for behavior, scope, terminology, and product rules
3. Split the PRD into user stories that follow the INVEST pattern
4. Add those stories to the feature's `backlog.md`
5. Order the backlog so the most useful and dependency-safe implementation sequence is clear

## PRD Guidelines

Each feature's `prd.md` should:

- Define user-facing behavior of the feature area
- Clarify product rules, edge cases, and terminology
- Avoid implementation details (no schemas, APIs, or technical subtasks)
- Be updated when important product behavior changes

## Story Guidelines

Stories follow the INVEST pattern:

- **Independent**: avoid unnecessary coupling
- **Negotiable**: focus on user value, not implementation mandates
- **Valuable**: each story describes a real user-facing outcome
- **Estimable**: scope is understandable enough to plan
- **Small**: narrow enough to implement without becoming a mini-epic
- **Testable**: acceptance criteria make verification possible

Stories describe product value, not engineering task breakdowns.

## Story Template Fields

- `type: story` in frontmatter
- `tldr`: one sentence summary
- `status`: pending | in_progress | complete | needs_refinement
- `priority`: P0 | P1 | P2
- **User Story**: "As a [user], I want [action] so that [value]"
- **Description**: context and detail
- **Acceptance Criteria**: testable outcomes
- **Out Of Scope**: explicit boundaries
- **Subtasks**: checkbox items that break the story into implementable pieces. Describe WHAT to build or verify, never HOW. Each subtask should be completable independently. When a subtask is completed, create a task note recording what was done and link it from the subtask checkbox with a wikilink (e.g., `- [x] Migrate foo — [[task-migrate-foo]]`).
- **Findings**: wikilinks to extracted `decision-*`, `pattern-*`, or `issue-*` notes (never inline content)

## Story Writing Rules

- Keep focused on one meaningful slice of user value
- Put implementation detail in code, not in the story
- Use Out Of Scope to keep boundaries clear
- If still unclear, set status to `needs_refinement`
- Do not write findings inline in stories. Extract implementation decisions into decision notes, code patterns into pattern notes, and gotchas into issue notes. The Findings section should only contain wikilinks to those extracted notes.
- Findings must be the last section in the story

## Backlog Rules

Each feature folder has one `backlog.md` with exactly three sections: Pending, In Progress, Completed.

Each story appears in the backlog exactly once as a wikilink.

### Status Mapping

- Pending: story status is `pending` or `needs_refinement`
- In Progress: story status is `in_progress`
- Completed: story status is `complete`

### Ordering

- Dependencies appear before dependent stories
- If no dependency, order by most useful implementation sequence
- Low-hanging-fruit stories that unblock testing can be moved earlier

### Entry Format

- Use wikilinks: `- [ ] [[story-slug]]`
- Checkboxes: `[ ]` pending, `[~]` in progress, `[x]` complete
- Append `[NEEDS REFINEMENT]` if story needs clarification

## Subtask Task Files

When a story subtask is completed, create a task note in the same feature folder using the task template. The task file records what was done and key changes. Link it from the subtask checkbox in the story:

```
- [x] Migrate settings/index.tsx — [[task-migrate-settings-index]]
```

Task files for subtasks do not need their own backlog entries — they are tracked through the parent story's subtask list.

## Issue Rules

Every issue note must have a corresponding entry in the feature's `backlog.md`. Use the same wikilink and checkbox format as stories.

## Status Values

- `pending`: ready for implementation
- `in_progress`: actively being worked on
- `complete`: done
- `needs_refinement`: needs more clarity before implementation
