#!/bin/bash

############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/.dotfiles
# And also installs Homebrew Packages
# And sets vscode preferences
# And sets MacOS preferences
###########################

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

homedir=$1

# dotfiles directory
dotfiledir=${homedir}/.dotfiles

# list of files/folders to symlink in ${homedir}
files="bash_profile bashrc zshrc hushlogin pylintrc "

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# Run the Homebrew Script
./brew.sh

# Run the MacOS Script
./macos.sh $dotfiledir

# Run the VSCode Script
./vscode.sh $dotfiledir

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended