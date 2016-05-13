# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth	# Don't duplicate history.
shopt -s histappend	# Append to history file; don't overrwrite.
HISTSIZE=2000		# See bash(1) for details.
HISTFILESIZE=4000	# Same.

shopt -s checkwinsize	# Update window size after each command.

shopt -s globstar	# Make "**" match stuff.

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    GRN="\[\033[0;32m\]"
    YLW="\[\033[0;33m\]"
    RED="\[\033[0;31m\]"
    DEF="\[\033[0;37m\]"
    export PS1="\n$RED\u@\h:$YLW\w$GRN\$(__git_ps1)\n$DEF$ "
else
    PS1="\n\u@\h:\w\$(__git_ps1)\n$ "
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Include the bash aliases, exports, etc.
for file in aliases exports exports_secret; do
    if [ -f ~/.$file ]; then
        . ~/.$file
    fi
done

# enable programmable completion features.
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Use a MATLAB-like history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

force_color_prompt=yes

# Customize the prompt color.
__git_ps1 ()
{
	local b="$(git symbolic-ref HEAD 2>/dev/null)";
	if [ -n "$b" ]; then
		printf "(%s)" "${b##refs/heads/}";
	fi
}

