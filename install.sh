#!/bin/bash

############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/.dotfiles
# And also installs Homebrew Packages
# And sets vscode preferences
# And sets MacOS preferences
# And installs oh-my-zsh with preferences
###########################

# check for passed argument
if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

homedir=$1
dotfiledir=${homedir}/.dotfiles

# link misc. dotfiles
files="pylintrc hushlogin gitignore env aliases path"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# Customize bash prompt
./bash.sh $homedir $dotfiledir

# Install packages with HomeBrew
./brew.sh

# Change MacOS settings
./macos.sh $dotfiledir

# Change VSCode settings
./vscode.sh $dotfiledir

# Install and customize zsh
./zsh.sh $homedir $dotfiledir

# Initialize conda for bash and zsh
conda init zsh bash
conda config --set auto_activate_base false