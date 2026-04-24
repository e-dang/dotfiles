# Dotfiles Modification

Make changes to the user's shell configuration. The user's request: $ARGUMENTS

## Important

Dotfiles are managed by chezmoi at `~/.local/share/chezmoi`. **Always edit files in the chezmoi source directory — never edit deployed files directly** (e.g., never edit `~/.zshrc`, `~/.shell/aliases.sh`, etc.).

After making changes, do NOT run `chezmoi apply` unless the user explicitly asks.

## Shell config structure

- `dot_shell/aliases.sh.tmpl` — shell aliases
- `dot_shell/functions.sh.tmpl` — shell functions
- `dot_shell/path.sh.tmpl` — PATH modifications
- `dot_shell/env.sh` — environment variables
- `dot_shell/plugins.sh.tmpl` — shell plugins
- `dot_zsh/` — zsh-specific config (keybindings, oh-my-zsh, p10k, autosuggestions, etc.)
- `modify_dot_zshrc` — managed lines that must exist in ~/.zshrc (this is a modify_ script, not a literal file — do not replace with dot_zshrc)
- `run_once_install-packages.sh.tmpl` — Homebrew packages and casks installed on first run

## Steps

1. Read the user's request and determine which file(s) to modify
2. Read the target file(s) in the chezmoi source directory to understand existing content and conventions
3. Make the changes, following the style and patterns already present in the file
4. Tell the user what was changed and remind them to run `chezmoi apply` when ready
