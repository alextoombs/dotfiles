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
plugins=(git osx macports go)

# Gopath
export GOPATH=$HOME/src/go

# Customize to your needs...
export PATH=$HOME/.rbenv/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/Applications/Postgres.app/Contents/MacOS/bin:/usr/bin:/bin:/sbin:/usr/sbin:/usr/local/sbin:/Users/alex/src/go/bin:/usr/local/go/bin:$GOPATH/src/github.com/apcera/ops/bin

# Apcera-specific settings
export APCERA=$GOPATH/src/github.com/apcera
export CNTHOME=$APCERA/continuum
alias vssh="cd $APCERA/continuum-vagrant && vagrant ssh"
alias bapc="cd $CNTHOME && ./build/build_apc && cd -"
alias apc='nocorrect apc'

# Python
export PYTHONPATH=/usr/local/bin/bzr

# Vagrant
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion

# Aliases
source $ZSH/oh-my-zsh.sh
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

# Git
alias go test -v ./...='nocorrect go test -v ./...'
alias gca='git commit -a -v'
alias ga='git add'
alias gap='git add -p'
alias gs='git status'
alias gl='git log'
alias gco='git checkout'
alias gcm='git checkout master'
alias gf='git fetch -p'
alias gcp='git cherry-pick'

: ${MARKPATH:=$HOME/.marks}
export MARKPATH

function jump {
  cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
  mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
  rm -i "$MARKPATH/$1"
}

zmodload -F zsh/stat b:zstat

function marks {
  local -a marks
  zstat -LnA marks +link "$MARKPATH"/*(@)
  for name target in "${marks[@]}"; do
    print -- "${name:t} -> $target"
  done
}

function _marks { compadd "$MARKPATH"/*(:t) }
compdef _marks jump unmark

eval "$(rbenv init -)" 2>1

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
