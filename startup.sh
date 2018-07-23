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

# Install vim
brew install macvim --with-override-system-vim

# Install cmake for ycm
brew install cmake

# Install git
brew install git

# Install python
brew install python3

# Install powerline
pip3 install powerline-status

# Run dotfiles install script 
bash install.sh

