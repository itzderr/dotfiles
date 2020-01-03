#!/bin/bash
#
# Perform Machine Setup.

#=====================
# Remove old dot files
#=====================
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.bash_profile > /dev/null 2>&1
sudo rm -rf ~/.git-completion.bash > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.gitignore_global > /dev/null 2>&1
sudo rm -rf ~/.g.sh > /dev/null 2>&1
sudo rm -rf ~/.gvimrc > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1

#=====================
# Create symlinks in the home folder
# (excluding .git/)
#=====================
for f in ~/dotfiles/.[^.]*[^t]
do
    ln -s "$f" "$HOME/${f##*/}"
    echo -e "\nSymlinking $f to $HOME/${f##*/}"
done

cp ~/dotfiles/coc-settings.json ~/.vim/coc-settings.json

echo -e "\n======= All Done!! =======\n"
echo "-Derrick"

source ~/.bashrc
source ~/.bash_profile
