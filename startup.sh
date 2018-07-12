#!/bin/bash
#
# Startup script

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew update
brew update

# Install vim
brew install vim

# Install git
brew install git

# Install python
brew install python3

# Install powerline
pip3 install powerline-status

# Run dotfiles install script 
bash install.sh

