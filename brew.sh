#!/bin/bash

# Make sure we’re using the latest Homebrew.
brew update

# install languages
brew install python2
brew install python

# install tools
brew install tree
brew install parallel
brew install rename
brew install ssh-copy-id
brew install open-babel

# install Cask programs
brew cask install google-chrome
brew cask install visual-studio-code
brew cask install miniconda
brew cask install google-backup-and-sync
brew cask install divvy
brew cask install iterm2

# install fonts
brew tap homebrew/cask-fonts
brew cask install font-inconsolata-for-powerline