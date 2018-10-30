#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Set the terminal profile
if [ -f /etc/profile ]
    then
        mv /etc/profile /etc/.orig_profile
fi
cp $DIR/profile /etc/profile

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Set the vimrc
if [ -f ~/.vimrc]
    then
        mv ~/.vimrc ~/.orig_vimrc
fi
cp $DIR/vimrc ~/.vimrc
