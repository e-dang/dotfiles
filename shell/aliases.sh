# cd command shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

if [[ $(brew list | grep "coreutils") ]] 2> /dev/null; then
    # always enable colored `ls` output with human readable sizes
    alias ls='gls -Gh'

    # ls command shortcut
    alias l='gls -lah'
else
    # always enable colored `ls` output with human readable sizes
    alias ls='ls -Gh'

    # ls command shortcut
    alias l='ls -lah'
fi

# Always enable colored `grep` output
alias grep='grep --color=auto'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'
