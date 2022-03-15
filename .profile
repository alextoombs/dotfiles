export PATH="/usr/local/opt/gpg-agent/bin:/opt/homebrew/bin:$PATH"
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
if [ -e cargo ]; then . "$HOME/.cargo/env"; fi