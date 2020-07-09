# cd command shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Use "-" to automatically go back to previous directory
alias -- -="cd -"

# Always show hidden files with tree
alias tree='tree -a'

# Always enable colored `ls` output with human readable sizes and add ls shortcut
if [[ -d /usr/local/opt/coreutils || "$OSTYPE" == "linux-gnu"* ]]; then
    alias ls='gls -Gh --color=auto'
    alias l='gls -lah --color=auto'
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
if [[ -d /usr/local/opt/gcc/bin ]]; then
    alias gcc="gcc-9"
    alias cc="gcc-9"
    alias g++="g++-9"
    alias c++="c++-9"
fi