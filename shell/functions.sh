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

if [[ $(echo ${OSTYPE} | grep "darwin") ]]; then
    LLVM_PATH=$(brew --prefix)/opt/llvm/bin
    GCC_PATH=$(brew --prefix)/opt/gcc/bin

    use_xcode() {
        export LDFLAGS=""
        path_remove $LLVM_PATH
        path_remove $GCC_PATH
        unalias_gcc
    }

    use_llvm() {
        export LDFLAGS="-L$(brew --prefix)/opt/llvm/lib -Wl,-rpath,$(brew --prefix)/opt/llvm/lib"
        path_remove $GCC_PATH
        path_prepend $LLVM_PATH
        unalias_gcc
    }

    use_gcc() {
        export LDFLAGS=""
        path_remove $LLVM_PATH
        path_prepend $GCC_PATH
        gcc=$(ls $GCC_PATH | grep "^gcc-\d\d$")
        gpp=$(ls $GCC_PATH | grep "^g++-\d\d$")
        alias gcc=$gcc
        alias cc=$gcc
        alias g++=$gpp
        alias c++=$gpp
    }

    unalias_gcc() {
        for name in gcc cc g++ c++; do
            if [[ $(alias | grep $name) ]]; then
                unalias $name
            fi
        done
    }
fi