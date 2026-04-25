---
type: reference
tldr: 'Canonical tag vocabulary for this global knowledge base.'
status: active
created: {{date}}
updated: {{date}}
tags: []
---

## Type Tags

| Tag                  | Description                              |
| -------------------- | ---------------------------------------- |
| type/bug             | Bug report                               |
| type/decision        | Architecture or product decision (ADR)   |
| type/knowledge       | Feature overview, technical documentation|
| type/work            | Work ticket or completed task            |
| type/question        | Open question requiring investigation    |
| type/investigation   | Investigation log                        |
| type/runbook         | Operational procedure                    |
| type/pattern         | Reusable pattern across projects         |
| type/idea            | Future possibility                       |

## Project Tags

Populate from your projects. Examples:

| Tag                  | Description                              |
| -------------------- | ---------------------------------------- |
<!-- Add project/* tags for your repos and services -->

## Area Tags

Populate from your domains. Examples:

| Tag                  | Description                              |
| -------------------- | ---------------------------------------- |
<!-- Add area/* tags for your domain areas -->

## Severity Tags

| Tag                  | Description                              |
| -------------------- | ---------------------------------------- |
| severity/critical    | Production-breaking                      |
| severity/high        | Major impact, needs prompt attention     |
| severity/medium      | Moderate impact                          |
| severity/low         | Minor impact                             |

## Rules

- Tags are lowercase, hyphenated
- Every note must have a `type/*` tag
- Every note should have at least one `project/*` or `area/*` tag
- Do not create tags that duplicate the `type` frontmatter field value
- Before creating a new tag, check this list
