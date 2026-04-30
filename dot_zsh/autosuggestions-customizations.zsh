ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#4c4c4c'

# Right arrow: if an autosuggestion is showing, accept one word; otherwise
# move a single character. POSTDISPLAY holds the suggestion text when active.
_smart_forward() {
  if [[ -n $POSTDISPLAY ]]; then
    zle forward-word
  else
    zle forward-char
  fi
}
zle -N _smart_forward
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(_smart_forward)
bindkey '^[OC' _smart_forward
bindkey '^[[C' _smart_forward

bindkey '\e[1;2C' forward-char
bindkey '\e[1;2D' backward-kill-word

# Can use bindkey to get a list of bound keys in the terminal. Also useful
# to use echo "ctrl+v <keys>" to get actual codes that are being written
# (cat -v does work all the time). Also look for already bound keys with specific
# keybinding that might get overshadowed by your keybinding