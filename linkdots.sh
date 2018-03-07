#!/bin/bash

mkdir -p $HOME/bin;
cp scripts/* $HOME/bin

# Confirm with user that this is acceptable.
for file in aliases bash_profile bashrc exports exports_private gitconfig clang-format; do
    if [ -L ~/.$file ]; then
        rm ~/.$file
    elif [ -f ~/.$file ]; then
        mv ~/.$file ~/.$file.old
    elif [ -d ~/.$file ]; then
        mv -rf ~/.$file ~/.$file.old
    fi
    cp -v ./$file ~/.$file
done

if [ -d $HOME/.vim ]; then
    cp -r vim/* $HOME/.vim/
else
    cp -r vim $HOME/.vim
fi

if [ -d $HOME/.gittemplate ]; then
    cp -r gittemplate/* $HOME/.gittemplate/
else
    cp -r gittemplate $HOME/.gittemplate
fi

echo "Your dotfiles are now up-to-date."
