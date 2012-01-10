#!/bin/bash

# Confirm with user that this is acceptable.
for file in aliases bash_profile bashrc exports exports_secret gitconfig; do
	if [ -L ~/.$file ]; then
		rm ~/.$file
	elif [ -f ~/.$file ]; then
		mv ~/.$file ~/.$file.old
	elif [ -d ~/.$file ]; then
		mv -rf ~/.$file ~/.$file.old
	fi
	cp -v ./$file ~/.$file
done
echo "Your dotfiles are now up-to-date."
