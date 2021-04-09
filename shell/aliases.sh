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
if [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ -d /usr/local/opt/coreutils ]]; then
        alias ls='gls -Nh --color=auto'
        alias l='gls -Nlah --color=auto'
    else
        alias ls='ls -Gh'
        alias l='ls -la'
    fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias ls='ls -Nh --color=auto'
    alias l='ls -la --color=auto'
fi

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# Always enable colored `grep` output
alias grep='grep --color=auto'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'