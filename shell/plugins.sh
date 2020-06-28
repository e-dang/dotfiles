# dircolors
export USING_DIR_COLORS=false
if [[ "$(tput colors)" == "256" ]]; then
    COLOR_FILE="${HOME}/.shell/plugins/dircolors-solarized/dircolors.256dark"
    if [ -x "$(command -v dircolors)" ]; then # linux command
        eval $(dircolors "${COLOR_FILE}")
        USING_DIR_COLORS=true
    elif [ -x "$(command -v gdircolors)" ]; then # macos command if coreutils is installed and in path
        eval $(gdircolors "${COLOR_FILE}")
        USING_DIR_COLORS=true
    fi
fi