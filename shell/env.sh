# Set default editor to vim
export EDITOR="/usr/bin/vim"
export VISUAL="/usr/bin/vim"

export SAVEHIST=1000000

# Color ls output better than default but worse than if using dircolors
if [ "${USING_DIR_COLORS}" = false ]; then
    export CLICOLOR=1
    export LSCOLORS='exbxgxdxcxGxDxcxcxexex'
fi
unset USING_DIR_COLORS