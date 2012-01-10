# .bash_profile

# Get the aliases, functions, exports.
for file in bashrc aliases exports exports_secret; do
	if [ -f ~/.bashrc ]; then
		. ~/.bashrc
	fi
done
