#! /bin/sh
set -e

DOTFILES=".profile
.zshrc
.zprofile
.gitconfig"

for f in $DOTFILES; do
  if test -f ~/"$f"; then
    cat ~/dotfiles/"$f" >> ~/"$f"
  else
    ln -sf ~/dotfiles/"$f" ~/"$f"
  fi
done
