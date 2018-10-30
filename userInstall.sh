#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Set the bash profile
if [ -f ~/.bash_profile ]
    then
        mv ~/.bash_profile ~/.orig_bash_profile
fi
cp $DIR/profile ~/.bash_profile

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Set the vimrc
if [ -f ~/.vimrc]
    then
        mv ~/.vimrc ~/.orig_vimrc
fi
cp $DIR/vimrc ~/.vimrc
