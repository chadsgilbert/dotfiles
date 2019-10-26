#!/bin/bash

mkdir -p "$HOME/bin"
cp scripts/* "$HOME/bin"

mkdir -p "$HOME/.local/share/fonts"
unzip fonts/Regular.zip -d "$HOME/.local/share/fonts"
fc-cache "$HOME/.local/share/fonts"

dfdir=$(dirname "$(realpath "$0")")

# Confirm with user that this is acceptable.
for file in aliases bashrc exports exports_private gitconfig clang-format tmux.conf; do
    if [ -L "$HOME/.$file" ]; then
        rm "$HOME/.$file"
    elif [ -f "$HOME/.$file" ]; then
        rm -i "$HOME/.$file"
    elif [ -d "$HOME/.$file" ]; then
        rm -rfi "$HOME/.$file"
    fi
    ln -s "$dfdir/$file" "$HOME/.$file"
done

if [ -d "$HOME/.vim" ]; then
    rm -rfi "$HOME/.vim"
fi
ln -s "$dfdir/vim" "$HOME/.vim"

if [ -d "$HOME/.gittemplate" ]; then
    rm -rfi "$HOME/.gittemplate"
else
	ln -s "$dfdir/gittemplate" "$HOME/.gittemplate"
fi

echo "Your dotfiles are now up-to-date."
