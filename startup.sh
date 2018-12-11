#!/bin/bash
#
# Startup script

# Install brew
if ! [ `which brew` ]
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Brew update
brew update

# Install bash-git-prompt
brew install bash-git-prompt

# Install python3
brew install python3

# Install vim
brew install macvim --with-override-system-vim

# Install cmake for ycm
brew install cmake

# Run dotfiles install script 
bash install.sh

