---
type: reference
tldr: 'Canonical tag vocabulary for this repository-scoped notes vault.'
status: active
created: {{date}}
updated: {{date}}
tags: []
---

## Type Tags

| Tag              | Description                            |
| ---------------- | -------------------------------------- |
| type/prd         | Product requirements document          |
| type/story       | User story                             |
| type/backlog     | Ordered story index                    |
| type/decision    | Architecture or product decision       |
| type/pattern     | Reusable code pattern                  |
| type/task        | Completed work record                  |
| type/issue       | Known problem or gotcha                |
| type/idea        | Future possibility                     |
| type/reference   | Lookup table or cheatsheet             |

## Area Tags

Populate from the project's feature areas. Examples:

| Tag              | Description                            |
| ---------------- | -------------------------------------- |
<!-- Add area/* tags matching feature folders -->

## Layer Tags

| Tag              | Description                            |
| ---------------- | -------------------------------------- |
| layer/database   | Schema, ORM, migrations                |
| layer/api        | Backend endpoints, webhooks            |
| layer/ui         | Components, screens, styling           |
| layer/navigation | Routing, tabs, modals                  |
| layer/state      | Stores, caching, form state            |
| layer/testing    | Test utilities, mocks, patterns        |

## Cross-Cutting Tags

| Tag                | Description                         |
| ------------------ | ----------------------------------- |
| concern/performance | Speed, memory, rendering           |
| concern/offline     | Local-first, sync, connectivity    |
| concern/migration   | Data or schema migrations          |
| concern/ux          | User experience, interaction design|
| concern/security    | Auth security, data protection     |

## Rules

- Tags are lowercase, hyphenated
- Every note should have at least one tag (type, area, or layer)
- Do not create tags that duplicate the `type` frontmatter field
- Tags on notes within a feature folder should not duplicate the folder name unless the note is a cross-feature reference
- Before creating a new tag, check this list
