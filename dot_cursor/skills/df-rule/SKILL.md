---
name: df-rule
description: >-
  Updates Cursor User/global rules via the chezmoi dotfiles source of truth,
  then applies them with chezmoi. Use when the user asks to add, edit, create,
  update, consolidate, or sync a Cursor user rule, global rule, ~/.cursor/rules
  file, coding-style.mdc, general-output.mdc, or df-rule workflow.
---

# df-rule — sync Cursor user rules through chezmoi

User/global Cursor rules are managed in the **dotfiles repo**, not by editing
`~/.cursor/rules` directly.

## Paths

| Role                                         | Path                                                  |
| -------------------------------------------- | ----------------------------------------------------- |
| Chezmoi source (edit here)                   | `/Users/edang/.local/share/chezmoi/dot_cursor/rules/` |
| Live target (do not edit as source of truth) | `~/.cursor/rules/`                                    |
| Current user rules                           | `coding-style.mdc`, `general-output.mdc`              |

Chezmoi maps `dot_cursor/` → `~/.cursor/`.

## Workflow

Complete these steps in order. Do **not** skip `chezmoi apply`.

1. **Edit the source file** under:

   ```text
   /Users/edang/.local/share/chezmoi/dot_cursor/rules/
   ```

   - Prefer updating an existing rule (`coding-style.mdc` or `general-output.mdc`)
     over adding a new file unless the user explicitly wants a new rule file.
   - Keep `alwaysApply: true` unless the user asks otherwise.
   - Do **not** treat `~/.cursor/rules/*.mdc` as the source of truth. If those
     files were already edited live, copy the intended content into the chezmoi
     source path above, then continue.

2. **Apply only the Cursor directory**:

   ```bash
   chezmoi apply -v ~/.cursor
   ```

3. **Verify**:

   ```bash
   ls -la ~/.cursor/rules/
   diff -q \
     /Users/edang/.local/share/chezmoi/dot_cursor/rules/<file>.mdc \
     ~/.cursor/rules/<file>.mdc
   ```

   Report which source file(s) changed and that apply succeeded.

## Do not

- Edit only `~/.cursor/rules/` and stop
- Run a full bare `chezmoi apply` (no target) unless the user asks
- Commit or push the dotfiles repo unless the user asks
- Create freeform Cursor Settings “User Rules” text entries for content that
  belongs in these `.mdc` files
