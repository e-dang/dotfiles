#!/bin/bash

# check for passed argument
if [ "$#" -ne 2 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

# install powerlevel9k theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# directories
homedir=$1
dotfiledir=$2

# list of files/folders to symlink in ${homedir}
files="zshrc"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# change default shell to zsh
chsh -s $(which zsh)