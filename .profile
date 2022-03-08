export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
if [[ $(command -v brew) != "" ]]; then
    export PATH=/opt/homebrew/bin:$PATH
fi
if [ -e /Users/alex.toombs/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/alex.toombs/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
. "$HOME/.cargo/env"
