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
if [[ $(command -v brew) != "" ]]; then
  plugins=(git macos brew golang sublime rails ruby git)
else
  plugins=(git golang sublime rails ruby git)
fi

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

if [[ $(command -v brew) != "" && $(command -v nvm) != "" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$(brew --prefix nvm)/nvm.sh" ] && source $(brew --prefix nvm)/nvm.sh
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

export EDITOR=code
export VISUAL=$EDITOR

# Golang configuration
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# rbenv configuration and initialization
if [[ $(command -v rbenv) != "" ]]; then
  eval "$(rbenv init -)"
  export PATH="$HOME/.rbenv/shims:$PATH"
  export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GPG_TTY=$(tty)
if [ -e /Users/alex.toombs/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/alex.toombs/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
#compdef clyde
_clyde() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _CLYDE_COMPLETE=complete-zsh  clyde)
}
if [[ "$(basename -- ${(%):-%x})" != "_clyde" ]]; then
  compdef _clyde clyde
fi
