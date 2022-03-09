#! /bin/sh
set -e

echo "Installing dotfiles to $HOME..."
for f in .profile .zshrc .zprofile .gitconfig
do
  echo "  checking for file $f in $HOME"
  if test -e ~/"$f"; then
    echo "  - file exists"
    cat ~/dotfiles/"$f" >> ~/"$f"
  else
    echo "  - file does not exist, symlinking"
    ln -sf ~/dotfiles/"$f" ~/"$f"
  fi
done
echo "  done!"