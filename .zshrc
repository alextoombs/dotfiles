# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME=lukerandall

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="false"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew go sublime rails ruby git)

# Set default editor as emacs (without environment sourced, though)
export EDITOR=emacsclient
export VISUAL=$EDITOR

# Golang configuration
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Aliases
source $ZSH/oh-my-zsh.sh
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

# Git
alias gc="git commit -S -v"
alias gca='git commit -a -S -v'
alias ga='git add'
alias gap='git add -p'
alias gs='git status'
alias gl='git log'
alias gco='git checkout'
alias gcm='git checkout master'
alias gf='git fetch -p'
alias gcp='git cherry-pick'

# GPG agent
eval $(gpg-agent --daemon --allow-preset-passphrase)
