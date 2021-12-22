export HISTFILE="$HOME/.cache/bash/.bash_history"
shopt -s histappend # append to history file
shopt -s nocaseglob # case-insensitive globbing (used in pathname expansion)
shopt -s cdspell # autocorrect typos in path names when using `cd`
bind -f ~/.bash/inputrc # key bindings

source ~/.bash/prompt.sh
source ~/.shell/settings.sh