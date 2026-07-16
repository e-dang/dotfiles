---
name: gtss
description: Submits only the Graphite stack for the current branch using gt ss. Use when the user invokes /gtss at the end of a Graphite stack task.
disable-model-invocation: true
---

# gtss — Graphite submit stack

Run at **task finish** to submit the stack. Only submit the stack you are currently working in.

## Before submitting

1. Confirm current branch and stack:

```bash
git branch --show-current
gt log short
```

2. Verify the log shows **only the intended stack** — not other parallel stacks in the repo. If multiple stacks exist off `main`, make sure you are checked out on a branch in the correct one.

3. Ensure all changes are committed on the current branch (and downstack branches if applicable).

## Submit

Run from the **top branch of the stack you are working in** (or any branch within that stack):

```bash
gt ss
```

`gt ss` is the alias for `gt submit --stack`. It submits from trunk through the current branch and its descendants — **only the stack containing the current branch**, not other parallel stacks.

Do NOT:

- Run submit from a branch in a different parallel stack
- Use `gt submit` without `--stack` when you mean to submit the whole stack
- Submit stacks you are not currently working in

## After submitting

```bash
gt log short
```

Confirm PRs were created/updated for the expected branches only.
