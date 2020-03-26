# User specific profile for interactive zsh(1) login shells.
# See zshbuiltins(1) and zshoptions(1) for more details.

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

# Directory aliases
alias dev="cd ~/Documents/Development"

# Command aliases
alias ll="ls -al"
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias grep="grep -i --color=auto"

mcd(){
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

# Go setup
# export GOPATH=$HOME/go  # enable and modify this if go isn't installed in home dir
# export PATH=$PATH:$(go env GOPATH)/bin  # enable and modify this to run go anywhere
export GO111MODULE=auto  # enable this to use the Go Modules. on will force usage of Go Modules

# For GPG to work
export GPG_TTY=$(tty)
