# Better history
HISTFILE="$HOME/.zsh_history"
SAVEHIST=1000000

bindkey "^R" history-incremental-search-backward
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
setopt appendhistory
setopt incappendhistory
setopt extendedhistory
setopt histfindnodups
setopt histignoredups

# Tab to cycle through auto-completions like in oh-my-zsh
CASE_SENSITIVE=false
HYPHEN_INSENSITIVE=true
ZSH_CACHE_DIR="$HOME/.zsh/cache"

bindkey "\e[Z" menu-complete
autoload -Uz compinit && compinit -i
source ~/.zsh/completion.zsh