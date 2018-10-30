#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Set the terminal profile
mv /etc/profile /etc/.originalprofile
cp $DIR/profile /etc/profile

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Set the vimrc
cp $DIR/vimrc ~/.vimrc
