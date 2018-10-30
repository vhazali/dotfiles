"""Installer script

Script to automatically install all required software on a new Mac.

Steps taken by this script:
    - Set up terminal profile
    - Set up vimrc
    - Install Homebrew
    - Install jq, tldr, tree, vim via homebrew
    - Install virtualenv

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
"""

from os import errno, mkdir, path, rename
from subprocess import call, check_call, CalledProcessError
from shutil import copy
import sys

HOME_PATH = path.expanduser('~')
SCRIPT_PATH = path.dirname(sys.argv[0])
ORIGINAL_PREFIX = '.orig.'


def _prepend_original_to_filename(target_path):
    """Add a prefix to filename.
    
    This is used when the file to be replaced exists.
    A prefix is added to the filename in the filepath.
    The prefix to be used is specified in ORIGINAL_PREFIX
    """
    head_path, tail_path = path.split(target_path)
    original_path = path.join(head_path, ORIGINAL_PREFIX + tail_path)

    return original_path


def setup_profile():
    """Set up terminal profile.

    User can choose to setup at either /etc/profile or ~/.bash_profile
    If an existing profile already exist, back it up by prepending .orig.
    """
    print("[*] Profile setup")
    
    response = input("""
        Choose to install at:
        1. /etc/profile (default, requires sudo)
        2. ~/.bash_profile
        """)
    
    target_path = '/etc/profile'
    source_path = SCRIPT_PATH + '/profile'
    
    if response == '2':
        target_path = HOME_PATH + '/.bash_profile'

    if path.exists(target_path):
        original_path = _prepend_original_to_filename(target_path)
        check_call(['sudo', 'mv', target_path, original_path])

    check_call(['sudo', 'cp', source_path, target_path])

    print("[+] Completed profile setup")


def setup_vimrc():
    """Set up vimrc."""
    print("[*] vimrc setup")
    
    target_path = HOME_PATH + '/.vimrc'

    if path.exists(target_path):
        original_path = _prepend_original_to_filename(target_path)
        rename(target_path, original_path)

    copy(SCRIPT_PATH + '/vimrc', target_path)

    print("[+] Completed vimrc setup")

def setup_homebrew():
    """Set up homebrew.

    This checks for homebrew on the system.
    If homebrew is not installed, install it.
    If homebrew is installed, tell user and exit.
    """
    print("[*] Homebrew setup")
    try:
        print("[+] Checking if homebrew already installed...")
        check_call(['brew', 'config'])
    except CalledProcessError as e:
        print("[+] Homebrew not installed, installing now...")
        check_call('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"', shell=True)
    else:
        print("[+] Homebrew already installed. Upgrading installed formulas...")
        call(['brew', 'upgrade'])

    print("[+] Completed homebrew setup")


def setup_tools():
    """Set up tools via homebrew.

    This installs commonly used cli tools via homebrew.
    If tools are already installed, homebrew will simply ignore them
    """
    print("[*] Tools setup")
    
    tool_list = ["tree", "tldr", "jq", "vim"]
    print("[+] Installing the following tools from homebrew: {0}".format(', '.join(tool_list)))
    
    command = ['brew', 'install']
    command.extend(tool_list)
    call(command)

    print("[+] Completed tools setup")


def setup_virtualenv():
    """Set up virtualenv.

    This installs virtualenv, creates a virtualenv directory
    in the user's home directory under ~/.virtualenvs
    """
    print("[*] Virtalenv setup")

    print ("[+] Upgrading pip...")
    check_call(['pip', 'install', '--upgrade', 'pip'])

    print("[+] Installing virtualenv with pip...")
    check_call(['pip', 'install', 'virtualenv'])

    print("[+] Creating ~/.virtualenvs directory")
    virtualenv_path = HOME_PATH + '/.virtualenvs'
    try:
        mkdir(virtualenv_path)
    except OSError as e:
        if e.errno != errno.EEXIST:
            print("[-] Error creating virtualenv directory.\n{0}".format(e))
            raise
    else:
        print("[+] Successfully created ~/.virtualenvs")
        print("[+] Completed virtualenv setup")


if __name__ == '__main__':
    setup_profile()
    setup_homebrew()
    setup_tools()
    setup_virtualenv()
