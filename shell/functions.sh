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

# Open dotfiles repository
dfopen() {
    code $(readlink ~/.dotfiles)
}

# Update dotfiles from remote
dfpull() {
    prev_dir=$(pwd)
    cd $(readlink ~/.dotfiles) && git pull --ff-only
    cd ${prev_dir}
}

# Update dotfiles at remote
dfpush() {
    prev_dir=$(pwd)
    cd $(readlink ~/.dotfiles) && git add . && git commit -m "$@" && git push
    cd ${prev_dir}
}

# Output vim cheat sheet
vcheat() {
    cat ~/.vim/vim_cheat_sheet.txt
}

remove_pycache() {
    find . | grep -E "(__pycache__|\.pytest_cache|\.pyc|\.pyo$)" | xargs rm -rf
}

# Removes all migrations files in django project
remove_migrations() {
    find . -path "*/migrations/*.py" -not -name "__init__.py" -delete
}

use_xcode() {
    export CPPFLAGS=""
    export LDFLAGS=""
    path_remove /usr/local/opt/llvm/bin
}

use_llvm() {
    export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
    export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/llvm/include/c++/v1/"
    path_prepend /usr/local/opt/llvm/bin
}

use_gcc() {
    export LDFLAGS="-L/usr/local/opt/gcc/lib/gcc/9 -Wl,-rpath,/usr/local/opt/gcc/lib/gcc/9"
    export CPPFLAGS="-I/usr/local/opt/gcc/include -I/usr/local/opt/gcc/include/c++/9.2.0/"
}