# System-wide .profile for sh(1)

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi

# Function to show current git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# With git branch
# export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h \[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]\[\033[32m\]\$(parse_git_branch)\[$(tput sgr0)\]:\[\033[38;5;15m\] \[$(tput sgr0)\]"

# Without git branch
export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h \[$(tput sgr0)\]\[\033[38;5;6m\][\w]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# Directory aliases
alias dev="cd ~/Documents/Development"

# Command aliases
alias ll="ls -al"
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias grep="grep -i --color=auto"

mcd(){
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

# Go paths
# export GOPATH=/Users/Vic/Documents/Development/go
# export PATH="/usr/local/sbin:$PATH:/usr/local/go/bin:$GOPATH/bin"

# Android home path
# export ANDROID_HOME=/usr/local/opt/android-sdk
