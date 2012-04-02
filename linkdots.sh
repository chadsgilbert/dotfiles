#!/bin/bash

# Confirm with user that this is acceptable.
for file in vimrc aliases bash_profile bashrc exports exports_private gitconfig; do
	if [ -L ~/.$file ]; then
		rm ~/.$file
	elif [ -f ~/.$file ]; then
		mv ~/.$file ~/.$file.old
	elif [ -d ~/.$file ]; then
		mv -rf ~/.$file ~/.$file.old
	fi
	cp -v ./$file ~/.$file
done

cp -r vim/* ~/.vim/

echo "Your dotfiles are now up-to-date."
