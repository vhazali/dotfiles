:'
    Dotfiles and scripts to set up new Mac machines.
    Copyright (C) 2018  Victor Hazali

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
'

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
