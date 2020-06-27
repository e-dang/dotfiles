# dircolors
if [[ "$(tput colors)" == "256" ]]; then
    COLOR_FILE="~/.shell/plugins/dircolors-solarized/dircolors.256dark"
    export USING_DIR_COLORS=true
    if [ -x "$(command -v dircolors)" ]; then # linux command
        eval $(dircolors "${COLOR_FILE}")
    elif [ -x "$(command -v gdircolors)" ]; then # macos command if coreutils is installed and in path
        eval $(gdircolors "${COLOR_FILE}")
    else
        USING_DIR_COLORS=false
    fi
fi