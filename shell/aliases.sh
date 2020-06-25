# cd command shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# always enable colored `ls` output with human readable sizes
alias ls='ls -Gh'

# ls command shortcut
alias l='ls -lah'

# Always enable colored `grep` output
alias grep='grep --color=auto'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'