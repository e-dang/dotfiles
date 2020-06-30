# Allows for cd'ing to directory without having to type cd
setopt AUTO_CD

# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation
setopt extended_glob

# Allow for variable/function substitution in prompt
setopt prompt_subst

# Better history
bindkey "^R" history-incremental-search-backward
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_find_no_dups      # dont report back duplicate commands
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# Tab to cycle through auto-completions like in oh-my-zsh
bindkey "\e[Z" menu-complete
autoload -Uz compinit && compinit -i -d "${ZSH_CACHE_DIR}/zcompdump-${ZSH_VERSION}"
source ~/.zsh/completion.zsh