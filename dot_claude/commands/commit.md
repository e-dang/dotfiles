Commit all staged and unstaged changes to git. Follow these steps:

1. Run `git status` (never use -uall), `git diff` (staged and unstaged), and `git log --oneline -5` in parallel.
2. Analyze all changes and draft a concise commit message (1-2 sentences) that focuses on the "why" rather than the "what". Summarize the nature of the changes (new feature, enhancement, bug fix, refactoring, test, docs, etc.).
3. Stage relevant files by name (never use `git add -A` or `git add .`). Do not stage files that likely contain secrets (.env, credentials.json, etc.).
4. Create the commit using a HEREDOC for the message.

CRITICAL RULES:

- The commit message must NOT include any Co-Authored-By lines, Claude Code references, AI attribution, or any mention of AI assistance. Just a clean, human-style commit message.
- Do not push to the remote repository unless explicitly asked.
- Do not amend existing commits — always create new ones.
- If there are no changes to commit, say so and stop.
- Pass the commit message via HEREDOC:

```
git commit -m "$(cat <<'EOF'
Your commit message here
EOF
)"
```
