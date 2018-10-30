#!/bin/bash

# Set the terminal profile
# mv /etc/profile /etc/.originalprofile
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp $DIR/profile ~/.bash_profile

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Set the vimrc
cp $DIR/vimrc ~/.vimrc
