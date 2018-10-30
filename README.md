# dotfiles

Setup for new machine.

## Usage

### Python script

This is the recommended installation method

```bash
python \path\to\your\repo\installer.py
```

The python script will
* Set up terminal profile
* Set up vimrc
* Install Homebrew
* Install jq, tldr, tree, vim via homebrew
* Install virtualenv

### Bash scripts

Run the install.sh with `sudo` command. `sudo` is required for the terminal profile.

This script places the terminal profile in `/etc/profile`, the original file will be moved to `/etc/.originalprofile` for backup.

To set the profile for a user only, run `userInstall.sh` instead

`install.sh` will:
1. Set the system's terminal profile
2. Install homebrew
3. Set vimrc

`userInstall.sh` will:
1. Set the user's terminal profile in `.bashrc`
2. Install homebrew
3. Set vimrc
