# System-wide .profile for sh(1)

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi

eval "$(rbenv init -)"

# Android home path
# export ANDROID_HOME=/usr/local/opt/android-sdk

# For custom vim
alias vim='/usr/local/Cellar/vim/8.0.0636/bin/vim'

# Prompt customisation

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
alias ratex="cd ~/Documents/Development/go/src/github.com/davis12529/ratex-server/"
alias rxmigrations="cd ~/Documents/Development/go/src/github.com/davis12529/ratex-server/db/migrations"

# Ratex
export GOPATH=/Users/Vic/Documents/Development/go
export PATH="/usr/local/sbin:$PATH:/usr/local/go/bin:$GOPATH/bin"
alias rxtest='ratex; clear; go test -v $(glide nv)'
alias rxmigrateup="rxmigrations; migrate -url postgres://ratex@localhost:5432/ratex-development?sslmode=disable up"
alias rxmigratedown="rxmigrations; migrate -url postgres://ratex@localhost:5432/ratex-development?sslmode=disable down"

