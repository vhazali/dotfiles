#!/bin/bash

# Set the terminal profile
# mv /etc/profile /etc/.originalprofile
cp ~/dotfiles/profile ~/.bash_profile

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Set the vimrc
ln -s ~/dotfiles/vimrc ~/.vimrc
