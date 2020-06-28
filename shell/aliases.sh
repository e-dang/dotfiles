# cd command shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Always enable colored `ls` output with human readable sizes and add ls shortcut
if [[ $(brew list | grep "coreutils") ]] 2> /dev/null; then
    alias ls='gls -Gh'
    alias l='gls -lah'
else
    alias ls='ls -Gh'
    alias l='ls -lah'
fi

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# Always enable colored `grep` output
alias grep='grep --color=auto'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# If homebrew installs GCC, use it when executing gcc/g++ commands. Note that library and include paths will need to be specified manually. TAGS:
if [[ $(brew list | grep "gcc") ]] 2> /dev/null; then
    MY_HOMEBREW_GCC_VERSION=$(ls $(brew --prefix gcc)/bin | grep "^gcc-.$" | tr -dc '0-9')
    alias gcc="gcc-${MY_HOMEBREW_GCC_VERSION}"
    alias cc="gcc-${MY_HOMEBREW_GCC_VERSION}"
    alias g++="g++-${MY_HOMEBREW_GCC_VERSION}"
    alias c++="c++-${MY_HOMEBREW_GCC_VERSION}"
    unset MY_HOMEBREW_GCC_VERSION
fi