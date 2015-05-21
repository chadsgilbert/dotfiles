# .bash_profile

DOECHO=FALSE

if [ $DOECHO ]; then
    echo "Sourcing bash_profile."
fi

# Get the aliases, functions, exports.
for file in bashrc; do
    if [ -f ~/.$file ]; then
        . ~/.$file
        if [ $DOECHO ]; then
            echo "Sourcing $file."
        fi
    fi
done
