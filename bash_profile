# .bash_profile

DOECHO=TRUE

if [ $DOECHO ]; then
	echo "Sourcing bash_profile."
fi

# Get the aliases, functions, exports.
for file in bashrc aliases exports exports_secret; do
	if [ -f ~/.$file ]; then
		. ~/.$file
		if [ $DOECHO ]; then
			echo "Sourcing $file."
		fi
	fi
done
