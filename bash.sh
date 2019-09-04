#!/bin/bash


# check for passed argument
if [ "$#" -ne 2 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

# directories
homedir=$1
dotfiledir=$2

# list of files/folders to symlink in ${homedir}
files="bash_profile bashrc bash_prompt inputrc env functions aliases"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done