#!/bin/bash

# Ask stupid user if user actually want to go through with this.
read -p  "This will alter several files in ~. Are you sure? (Y/n)" -n 1
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then

	# Symlink all the files to home.
	find ~/dotfiles-linux -type f -name '.*' > /tmp/dots
	for fullfile in `cat /tmp/dots`; do
		file=${fullfile##*/}
		echo "linking file: $file"
		if [ -L ~/$file ]; then
			rm ~/$file
		elif [ -e ~/$file ]; then
			mv -nv ~/$file ~/$file.old
		fi 
		ln -s $fullfile ~/$file
	done

	# Now do the directories.
	find ~/dotfiles-linux -name '.*' -type d > /tmp/dots
	for fulldir in `cat /tmp/dots`; do
		dir=${fullfile##*/}
		echo "linking dir: $dir"
		if [ -L ~/$dir ]; then
			rm ~/$dir
		elif [ -d ~/$dir ]; then
			mv -nv ~/$dir ~/$dir.old
		fi
		ln -s $fulldir ~/$dir
	done
	
	echo "Your settings are up to date!"
else
	echo "Operation cancelled."
fi
