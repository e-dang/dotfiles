ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#4c4c4c'
bindkey '^[OC' forward-word
bindkey '\e[1;2C' forward-char
bindkey '\e[1;2D' backward-kill-word

# Can use bindkey to get a list of bound keys in the terminal. Also useful
# to use echo "ctrl+v <keys>" to get actual codes that are being written
# (cat -v does work all the time). Also look for already bound keys with specific
# keybinding that might get overshadowed by your keybinding