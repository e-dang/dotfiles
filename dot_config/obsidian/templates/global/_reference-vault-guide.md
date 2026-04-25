---
type: reference
tldr: 'Entry point for AI agents navigating this global knowledge base.'
status: active
created: {{date}}
updated: {{date}}
tags: []
---

## What This Vault Is

A centralized knowledge base for cross-project discoveries, decisions, bugs, investigations, and operational knowledge. Notes span multiple projects and domains.

## Organization

All notes live in a **flat directory** — no subdirectories by type. Organization is entirely through tags. This keeps the vault simple and avoids forcing notes into a single category when they span concerns.

## File Naming

`YYYY-MM-DD-{slug}.md` — date prefix for temporal ordering, brief descriptive slug.

Examples: `2026-04-24-auth-middleware-race-condition.md`, `2026-04-24-switch-to-jwt-sessions.md`

Note type is captured in tags, not the filename.

## How To Find Notes

- By tldr: `grep "^tldr:" *.md` for one-line overview of every note
- By type: `grep "type/bug" *.md` for all bugs, `grep "type/decision" *.md` for all decisions
- By project: `grep "project/PROJECT_NAME" *.md` for all notes related to a project
- By area: `grep "area/AREA_NAME" *.md` for all notes in a domain
- By status: `grep "^status:" *.md` for note statuses
- Full-text: `grep "KEYWORD" *.md` for mentions in note bodies
- By wikilink: `grep "\[\[note-name\]\]" *.md` for notes referencing another
- Open questions: `grep "status: open" *.md` combined with `grep "type/question"` for unresolved questions

## Note Types

| Type          | Purpose                                      |
| ------------- | -------------------------------------------- |
| bug           | Bug reports — symptoms, root cause, fix      |
| decision      | Architecture Decision Records (ADRs)         |
| knowledge     | Feature overviews, patterns, technical docs  |
| work          | Work tickets and completed tasks             |
| question      | Open questions requiring investigation       |
| investigation | Investigation logs                           |
| runbook       | Operational procedures                       |
| pattern       | Reusable patterns across projects            |
| idea          | Future possibilities not yet actionable      |

## Tag Conventions

Tags use a `prefix/value` pattern. Every note must have a `type/*` tag and at least one `project/*` or `area/*` tag.

- **`type/*`** — Note category: `bug`, `decision`, `knowledge`, `work`, `question`, `investigation`, `runbook`, `pattern`, `idea`
- **`project/*`** — Codebase or repo scope (populate from your projects)
- **`area/*`** — Domain area (populate from your domains)
- **`severity/*`** — Issue severity: `critical`, `high`, `medium`, `low`

See [[_reference-tags]] for the full canonical tag list.

## Frontmatter

All notes have YAML frontmatter with: `type`, `tldr`, `status`, `created`, `updated`, `tags`

Optional fields by type: `ticket`, `pr`, `deciders`

- `tldr` is mandatory — one sentence, greppable
- `status` values: `open`, `resolved`, `completed`

## Changelog Sections

Bug, investigation, issue, decision, pattern, and idea notes include a `## Changelog` section with dated entries tracking how understanding evolved over time. This is more valuable than a single `updated` date — it preserves the narrative of discovery and resolution.

## Linking

Wikilinks connect related notes: `[[note-name]]` or `[[note-name|Display Text]]`. Add a `## Related` section at the bottom of notes to collect links.

## Related References

- Canonical tags: [[_reference-tags]]
- Templates: `_templates/` directory
