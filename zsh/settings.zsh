# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation
setopt extended_glob

# Allow for variable/function substitution in prompt
setopt prompt_subst

# Better history
bindkey "^R" history-incremental-search-backward
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
setopt appendhistory
setopt incappendhistory
setopt extendedhistory
setopt histfindnodups
setopt histignoredups

# Tab to cycle through auto-completions like in oh-my-zsh
bindkey "\e[Z" menu-complete
autoload -Uz compinit && compinit -i
source ~/.zsh/completion.zsh