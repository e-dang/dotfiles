---
name: pr-feedback
description: >-
  Walk through pull request review comments one at a time — fetch feedback from
  a PR link, assess validity with code evidence, suggest fixes, and wait for the
  user before acting. Use when the user invokes pr-feedback or asks to address
  PR feedback, review comments, or go through a PR comment-by-comment with a
  Graphite or GitHub PR URL.
disable-model-invocation: true
---

# pr-feedback — address PR review comments one at a time

Use when the user provides a **PR link** (Graphite or GitHub) and wants to
triage review feedback interactively.

## Input

The user supplies a PR URL, e.g.:

- `https://app.graphite.com/github/pr/envoy/react-rich-components/1607`
- `https://github.com/envoy/react-rich-components/pull/1607`

Extract `owner`, `repo`, and PR number from the URL.

## Setup (once per session)

Run in parallel where possible:

```bash
gh pr view <N> --repo <owner>/<repo> --json title,body,headRefName,baseRefName,url,comments,reviews
gh api repos/<owner>/<repo>/pulls/<N>/comments --paginate
```

Optional — confirm local branch matches the PR:

```bash
git branch --show-current
```

Read relevant files before judging any comment. **Investigate first; do not guess.**

## Which comments to walk

**Include:** inline review comments on the diff from human reviewers (e.g.
`COMMENTED` / `CHANGES_REQUESTED` reviews).

**Skip unless the user asks:** bot/issue comments (Graphite stack info, Datadog CI,
github-actions preview, stale CI copy-paste prompts).

Build an ordered list (file path + line, oldest first or thread order). Tell the
user **total count** up front, e.g. "6 inline review comments to walk through."

## One comment at a time — mandatory pacing

Handle **exactly one comment per turn**, then **stop and wait**.

Do **not** implement fixes, batch replies, or advance to the next comment until
the user says what to do (fix it, skip, reply on PR, next, etc.).

### Per-comment output template

```markdown
## Comment N of M

**File:** `path` (lines X–Y)
**Author:** login

> [Full comment text]

### Is it valid?

**Yes / No / Partially** — [one paragraph with code evidence]

### Suggested fix

[Concrete before/after or code shape — not abstract advice]

---

Tell me what to do with this one.
```

### Assessing validity

- Read the cited code and related callers before answering.
- If the comment is wrong, say so with evidence — do not agree to be agreeable.
- If unsure after reading/grepping, say what you checked and what is still unknown.

### Suggesting fixes

- Follow user `coding-style.mdc`: form cross-field updates in the triggering
  handler, not `useEffect`; prefer `null` over `undefined` in domain types;
  wrap multi-field handlers in `useCallback` when appropriate.
- Minimal diff — only what this comment needs.

## Acting on the user's decision

| User says       | Do                                                                   |
| --------------- | -------------------------------------------------------------------- |
| fix / implement | Make the change, run targeted checks if code changed, report briefly |
| skip / disagree | Note it; offer to draft a PR reply if they want                      |
| next            | Present comment N+1 using the template                               |
| reply           | Draft a GitHub review reply (do not post unless they ask to post)    |

After a fix, ask whether to continue to the next comment or stop.

## Do not

- Walk multiple comments in one response
- Implement all feedback without per-comment approval
- Treat bot CI comments as review feedback unless asked
- Validate a comment without reading the code it references
- Push, commit, or open/update a PR unless explicitly requested
