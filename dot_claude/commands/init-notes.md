# Initialize Obsidian Notes Vault

Set up a local Obsidian-compatible notes vault in the current repository for feature planning, product decisions, and knowledge capture.

## Step 1: Understand the project

- Read the project's README, CLAUDE.md, or any other top-level documentation to understand what the project is about
- Identify the major feature areas or domains of the project (e.g., auth, billing, dashboard, API)

## Step 2: Create the notes directory structure

Create `notes/` at the project root with the following:

### Reference files

**`notes/_reference-vault-guide.md`**

```markdown
---
type: reference
tldr: 'Entry point for AI agents navigating the notes vault.'
status: active
created: {{date}}
updated: {{date}}
tags: []
---

## What This Vault Is

Feature planning, product decisions, and knowledge notes for [PROJECT NAME]. This vault contains PRDs, user stories, backlogs, decision records, code patterns, known issues, ideas, and reference material.

## How To Find Notes

- All notes in a feature: `glob("notes/FEATURE/*.md")`
- By type prefix: `glob("notes/*/story-*.md")` for all stories across features
- By frontmatter: `grep -r "^type: decision" notes/` for all decisions
- By summary: `grep -r "^tldr:" notes/` for a one-line overview of every note
- By status: `grep -r "^status: pending" notes/` for pending items
- By tag: `grep -r "tags:.*TAG" notes/` for tagged notes
- By wikilink: `grep -r "\[\[feature/note\]\]" notes/` for notes that reference another
- Outbound links: `grep "\[\[" notes/feature/some-file.md` for all links from a file

## Note Types

| Type      | Purpose                                 | File naming                           |
| --------- | --------------------------------------- | ------------------------------------- |
| prd       | Product requirements for a feature area | `prd.md` (one per feature folder)     |
| story     | User story following INVEST pattern     | `story-{slug}.md`                     |
| backlog   | Ordered story index for a feature       | `backlog.md` (one per feature folder) |
| decision  | Why we chose X over Y                   | `decision-{slug}.md`                  |
| pattern   | How something works in the codebase     | `pattern-{slug}.md`                   |
| task      | Ad-hoc work not tied to a story         | `task-{slug}.md`                      |
| issue     | Known problem or gotcha                 | `issue-{slug}.md`                     |
| idea      | Future possibility, not yet a story     | `idea-{slug}.md`                      |
| reference | Lookup table or cheatsheet              | `reference-{slug}.md`                 |

## Structure

Notes are organized by feature folder. Each feature folder may contain a `prd.md`, `backlog.md`, and any number of other note types. Cross-feature references use wikilinks with the folder path: `[[programs/prd]]`.

## Conventions

- All notes have YAML frontmatter with `type`, `tldr`, `status`, `created`, `updated`, `tags`
- `tldr` is mandatory and must be one sentence
- Wikilinks are the linking mechanism: `[[story-slug]]` within a feature, `[[feature/note-name]]` across features
- Templates are in `_templates/`
- Planning rules are in [[_reference-planning-process]]
- Canonical tags are in [[_reference-tags]]
```

**`notes/_reference-planning-process.md`**

```markdown
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
- **Subtasks**: checkbox items that break the story into implementable pieces. Describe WHAT to build or verify, never HOW. Each subtask should be completable independently. When a subtask is completed, create a `task-{slug}.md` file recording what was done and link it from the subtask checkbox with a wikilink (e.g., `- [x] Migrate foo — [[task-migrate-foo]]`).
- **Findings**: wikilinks to extracted `decision-*`, `pattern-*`, or `issue-*` notes (never inline content)

Stories describe product value, not implementation plans. Subtasks say what to build, not how to build it.

## Story Writing Rules

- Keep focused on one meaningful slice of user value
- Put implementation detail in code, not in the story
- Use Out Of Scope to keep boundaries clear
- If still unclear, set status to `needs_refinement`
- Do not write findings inline in stories. Extract implementation decisions into `decision-*` notes, code patterns into `pattern-*` notes, and gotchas into `issue-*` notes. The Findings section should only contain wikilinks to those extracted notes.
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

When a story subtask is completed, create a `task-{slug}.md` in the same feature folder using the task template. The task file records what was done and key changes. Link it from the subtask checkbox in the story:

```
- [x] Migrate settings/index.tsx — [[task-migrate-settings-index]]
```

Task files for subtasks do not need their own backlog entries — they are tracked through the parent story's subtask list.

## Issue Rules

Every `issue-*` note must have a corresponding entry in the feature's `backlog.md`. Use the same wikilink and checkbox format as stories (e.g., `- [ ] [[issue-slug]]`).

## Status Values

- `pending`: ready for implementation
- `in_progress`: actively being worked on
- `complete`: done
- `needs_refinement`: needs more clarity before implementation
```

**`notes/_reference-tags.md`** — Create this with domain tags derived from the project's feature areas, plus standard layer and cross-cutting tags:

```markdown
---
type: reference
tldr: 'Canonical tag vocabulary for the notes vault.'
status: active
created: {{date}}
updated: {{date}}
tags: []
---

## Domain Tags

| Tag | Description |
| --- | ----------- |
<!-- Populate from Step 1 feature areas -->

## Layer Tags

| Tag        | Description                            |
| ---------- | -------------------------------------- |
| database   | Schema, ORM, migrations                |
| api        | Backend endpoints, webhooks            |
| ui         | Components, screens, styling           |
| navigation | Routing, tabs, modals                  |
| state      | Stores, caching, form state            |
| testing    | Test utilities, mocks, patterns        |

## Cross-Cutting Tags

| Tag         | Description                         |
| ----------- | ----------------------------------- |
| performance | Speed, memory, rendering            |
| offline     | Local-first, sync, connectivity     |
| migration   | Data or schema migrations           |
| ux          | User experience, interaction design |
| security    | Auth security, data protection      |

## Rules

- Tags are lowercase, hyphenated
- Every note should have at least one tag (domain or layer)
- Do not create tags that duplicate the `type` field
- Tags on notes within a feature folder should not duplicate the folder name unless the note is a cross-feature reference
- Before creating a new tag, check this list
```

### Templates

Create `notes/_templates/` with these files:

**`backlog.md`**
```markdown
---
type: backlog
tldr: ""
created: {{date}}
updated: {{date}}
tags: []
---

## Pending

## In Progress

## Completed
```

**`story.md`**
```markdown
---
type: story
tldr: ""
status: pending
priority: P1
created: {{date}}
updated: {{date}}
tags: []
---

## User Story

As a [user], I want [action] so that [value].

## Description

Context and additional detail about why this story matters.

## Acceptance Criteria

- Criterion one
- Criterion two

## Out Of Scope

- What this story explicitly does not cover

## Findings

Do not write findings inline here. Instead, extract them into separate `decision-*`, `pattern-*`, or `issue-*` notes and link to them with wikilinks. Example: `See [[decision-some-choice]] and [[pattern-some-pattern]].`
```

**`decision.md`**
```markdown
---
type: decision
tldr: ""
status: active
created: {{date}}
updated: {{date}}
tags: []
---

## Context

Why this decision came up.

## Options Considered

- **Option A**: Description. Pros. Cons.
- **Option B**: Description. Pros. Cons.

## Decision

What was chosen and why.

## Consequences

What this means going forward.
```

**`pattern.md`**
```markdown
---
type: pattern
tldr: ""
status: active
created: {{date}}
updated: {{date}}
tags: []
---

## Pattern

What the pattern is and where it applies.

## Example

Concrete code reference or file path (do not paste large code blocks).

## When To Use

When this pattern is the right choice.

## Gotchas

Non-obvious things to watch for.
```

**`task.md`**
```markdown
---
type: task
tldr: ''
status: complete
created: {{date}}
updated: {{date}}
tags: []
---

## Summary

What was done and why.

## Changes

Key files and areas affected.

## Findings

Do not write findings inline here. Instead, extract them into separate `decision-*`, `pattern-*`, or `issue-*` notes and link to them with wikilinks.
```

**`issue.md`**
```markdown
---
type: issue
tldr: ""
status: active
created: {{date}}
updated: {{date}}
tags: []
---

## Problem

What is broken or problematic.

## Impact

What this affects.

## Workaround

Current mitigation, if any.

## Resolution

How it was fixed (fill in when status becomes resolved).
```

**`idea.md`**
```markdown
---
type: idea
tldr: ""
status: active
created: {{date}}
updated: {{date}}
tags: []
---

## Idea

What the idea is.

## Motivation

Why this might be valuable.

## Open Questions

What would need to be answered before this becomes a story.
```

**`reference.md`**
```markdown
---
type: reference
tldr: ""
status: active
created: {{date}}
updated: {{date}}
tags: []
---

## Content

The reference material. Keep terse -- prefer tables, lists, and key-value pairs over prose.
```

**`prd.md`**
```markdown
---
type: prd
tldr: ""
status: draft
created: {{date}}
updated: {{date}}
tags: []
---

## Overview

What this feature area does from the user's perspective.

## Product Goals

- Goal one
- Goal two

## Non-Goals

- What is explicitly out of scope

## Core Concepts

Define key terms and mental models used throughout this PRD.

## Product Rules

Non-negotiable constraints and behavior requirements.

## Screen Requirements

What the user sees and interacts with.

## Summary Of Agreed Rules

Concise list of the key decisions and constraints above.
```

## Step 3: Create feature folders

For each major feature area identified in Step 1, create a folder under `notes/` with an empty `backlog.md` (using the template, filling in the `tldr` with a short description like "Ordered story index for authentication.").

## Step 4: Replace `{{date}}` placeholders

Replace all `{{date}}` placeholders in the created files with today's date in `YYYY-MM-DD` format.

## Step 5: Summarize

Tell the user:
- What feature folders were created and why
- That templates, reference files, and backlogs are ready
- Remind them that `/notes` can be used after completing work to record what was done
- Suggest they add `notes/` to their `.obsidian` vault or open the `notes/` folder directly in Obsidian
