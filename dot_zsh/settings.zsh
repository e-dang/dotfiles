export DISABLE_AUTO_UPDATE=true
export ZSH_CACHE_DIR="${HOME}/.cache/zsh"
export HISTFILE="${ZSH_CACHE_DIR}/.zsh_history"
autoload -Uz compinit && compinit -i -d "${ZSH_CACHE_DIR}/zcompdump-${ZSH_VERSION}"
setopt hist_ignore_all_dups       # ignore duplicated commands history list

source ~/.zsh/oh-my-zsh.zsh
source ~/.zsh/p10k.zsh
source ~/.zsh/syntax-highlighting-customizations.zsh
source ~/.zsh/history-substring-search-customizations.zsh
source ~/.zsh/autosuggestions-customizations.zsh
source ~/.zsh/docker-customizations.zsh
source ~/.shell/settings.sh