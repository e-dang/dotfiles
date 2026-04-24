# Explore Notes

Search the local Obsidian notes vault for information related to the user's query: $ARGUMENTS

## Step 1: Understand the vault

Read `notes/_reference-vault-guide.md` to understand the vault structure, note types, and conventions.

## Step 2: Search for relevant notes

Use the search techniques from the vault guide to find notes related to the query. Cast a wide net:

- Search file names: `glob("notes/**/*KEYWORD*.md")` for notes with the keyword in the name
- Search content: `grep "KEYWORD" notes/` for mentions in note bodies
- Search by tldr: `grep -r "^tldr:.*KEYWORD" notes/` for one-line summaries mentioning the keyword
- Search by tag: `grep -r "tags:.*KEYWORD" notes/` for tagged notes
- Search backlog files: `glob("notes/*/backlog.md")` and scan for relevant entries if the query is about a feature area

Use multiple keywords and synonyms derived from the query. Broaden or narrow your search based on initial results.

## Step 3: Read and follow links

Read the most relevant notes found in Step 2. For each note:

- Check its wikilinks (`[[linked-note]]`) and follow any that seem relevant to the query
- Check its frontmatter for status, priority, and related tags
- Note which feature folder it belongs to

## Step 4: Synthesize

Present your findings as a concise answer to the query. Include:

- A direct answer or summary addressing what the user asked
- References to the specific notes you found (use file paths so the user can navigate to them)
- Any related notes that provide additional context
- If the query touches on decisions, include the reasoning from `decision-*` notes
- If the query touches on known problems, surface any `issue-*` notes

Do not reproduce entire notes — summarize and point the user to the source files.
