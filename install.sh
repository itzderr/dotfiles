#!/bin/bash
#
# Perform Machine Setup.

#=====================
# Remove old dot files
#=====================
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bash_profile > /dev/null 2>&1
sudo rm -rf ~/.git-completion.bash > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.gitignore_global > /dev/null 2>&1
sudo rm -rf ~/.g.sh > /dev/null 2>&1

#=====================
# Create symlinks in the home folder
# (excluding .git/)
#=====================
for f in .[^.]*[^t]
do
    ln -s "$f" "~/$f"
    echo "\nSymlinking $f to ~/$f"
done

echo "\n======= All Done!! =======\n"
echo 
echo "-Derrick"
