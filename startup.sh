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

# Install python3
brew install python3

# Install bash-git-prompt
brew install bash-git-prompt

# Install vim
brew install macvim

# Install cmake for ycm
brew install cmake

# Install exa
brew install exa

# Install tmux
brew install tmux

# Install hub
brew install hub

# Run dotfiles install script 
bash install.sh

