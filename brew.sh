#!/bin/bash

# Make sure we’re using the latest Homebrew.
brew update

# install languages
brew install python
brew install python2

# install tools
brew install tree
brew install parallel
brew install rename
brew install ssh-copy-id
brew install open-babel

# install Cask programs
brew cask install google-chrome
brew cask install firefox
brew cask install visual-studio-code
brew cask install miniconda
brew cask install google-backup-and-sync
brew cask install shiftit
brew cask install iterm2
brew cask install mongodb-compass

# install fonts
brew tap homebrew/cask-fonts
brew cask install font-inconsolata-for-powerline

# install drivers
brew tap homebrew/cask-drivers
brew cask install logitech-options

# install mongodb
brew tap mongodb/brew
brew install mongodb-community
sudo mkdir -p /data/db
sudo chown -R `id -un` /data/db