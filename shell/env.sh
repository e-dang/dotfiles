export SAVEHIST=1000000

# Color ls output better than default but worse than if using dircolors
if [ ${USING_DIR_COLORS} = false ]; then
    export CLICOLOR=1
    export LSCOLORS='exbxgxdxcxGxDxcxcxexex'
fi