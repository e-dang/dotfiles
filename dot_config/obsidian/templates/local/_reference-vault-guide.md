---
type: reference
tldr: 'Entry point for AI agents navigating this repository-scoped notes vault.'
status: active
created: {{date}}
updated: {{date}}
tags: []
---

## What This Vault Is

A repository-scoped notes vault for feature planning, product decisions, and knowledge capture. Contains PRDs, user stories, backlogs, decision records, code patterns, known issues, ideas, and reference material.

## Organization

Notes are organized by **feature folder**. Each feature folder (e.g., `notes/auth/`, `notes/billing/`) may contain a `prd.md`, `backlog.md`, and any number of typed notes. Cross-feature references use wikilinks with the folder path: `[[feature/note-name]]`.

## File Naming

`YYYY-MM-DD-{type}-{slug}.md` — date prefix for temporal ordering, type prefix for quick identification within a folder.

Examples: `2026-04-24-decision-auth-approach.md`, `2026-04-24-story-user-login.md`

Exceptions: `prd.md`, `backlog.md` (one per feature folder, no date/type prefix needed).

## How To Find Notes

- All notes in a feature: `glob("notes/FEATURE/*.md")`
- By type across features: `glob("notes/*/YYYY-MM-DD-decision-*.md")` or `grep "type/decision" notes/`
- By tldr: `grep "^tldr:" notes/` for one-line overview of every note
- By status: `grep "^status:" notes/` for status of all notes
- By tag: `grep "tags:" notes/` then filter for specific `prefix/value` tags
- By wikilink: `grep "\[\[note-name\]\]" notes/` for notes referencing another
- Outbound links: `grep "\[\[" notes/feature/some-file.md` for all links from a file
- Backlogs: `glob("notes/*/backlog.md")` for all feature backlogs

## Note Types

| Type      | Purpose                                 | File naming                             |
| --------- | --------------------------------------- | --------------------------------------- |
| prd       | Product requirements for a feature area | `prd.md` (one per feature folder)       |
| story     | User story following INVEST pattern     | `YYYY-MM-DD-story-{slug}.md`            |
| backlog   | Ordered story index for a feature       | `backlog.md` (one per feature folder)   |
| decision  | Why we chose X over Y                   | `YYYY-MM-DD-decision-{slug}.md`         |
| pattern   | How something works in the codebase     | `YYYY-MM-DD-pattern-{slug}.md`          |
| task      | Completed work record                   | `YYYY-MM-DD-task-{slug}.md`             |
| issue     | Known problem or gotcha                 | `YYYY-MM-DD-issue-{slug}.md`            |
| idea      | Future possibility, not yet a story     | `YYYY-MM-DD-idea-{slug}.md`             |
| reference | Lookup table or cheatsheet              | `YYYY-MM-DD-reference-{slug}.md`        |

## Tag Conventions

Tags use a `prefix/value` pattern. Every note should have at least one tag.

- **`type/*`** — Note category: `prd`, `story`, `backlog`, `decision`, `pattern`, `task`, `issue`, `idea`, `reference`
- **`area/*`** — Domain or feature area (should match feature folder names)
- **`layer/*`** — Technical layer: `database`, `api`, `ui`, `navigation`, `state`, `testing`
- **`concern/*`** — Cross-cutting: `performance`, `offline`, `migration`, `ux`, `security`

Rules:
- Tags are lowercase, hyphenated
- Do not create tags that duplicate the `type` field
- Before creating a new tag, check `_reference-tags.md`

## Frontmatter

All notes have YAML frontmatter with: `type`, `tldr`, `status`, `created`, `updated`, `tags`

- `tldr` is mandatory — one sentence, greppable
- `status` values: `pending`, `in_progress`, `complete`, `needs_refinement`, `active`, `resolved`, `draft`

## Linking

Wikilinks are the linking mechanism:
- Within a feature: `[[note-name]]`
- Across features: `[[feature/note-name]]`

## Related References

- Planning rules: [[_reference-planning-process]]
- Canonical tags: [[_reference-tags]]
- Templates: `_templates/` directory
