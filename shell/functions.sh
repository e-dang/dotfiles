# Create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@"
}

# Get colors in manual pages
function man()
{
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# Taken from https://github.com/anishathalye/dotfiles/blob/master/shell/functions.sh
path_remove() {
    PATH=$(echo -n "$PATH" | awk -v RS=: -v ORS=: "\$0 != \"$1\"" | sed 's/:$//')
}

# Taken from https://github.com/anishathalye/dotfiles/blob/master/shell/functions.sh
path_append() {
    path_remove "$1"
    PATH="${PATH:+"$PATH:"}$1"
}

# Taken from https://github.com/anishathalye/dotfiles/blob/master/shell/functions.sh
path_prepend() {
    path_remove "$1"
    PATH="$1${PATH:+":$PATH"}"
}