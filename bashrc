# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

[ -z "$TMUX" ] && { tmux attach || exec tmux new-session && exit; }

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

# Customize the prompt color.
if [ "$color_prompt" = yes ]; then
	declare -a TRUELINE_SEGMENTS=(
        'user,black,white,bold'
        'venv,black,purple,bold'
        'git,grey,special_grey,normal'
        'working_dir,mono,cursor_grey,normal'
        'read_only,black,orange,bold'
        'bg_jobs,black,orange,bold'
        'exit_status,black,red,bold'
        'newline,black,orange,bold'
    	)

	declare -A TRUELINE_SYMBOLS=(
    [bg_jobs]=''
    [git_ahead]=''
    [git_behind]=''
    [git_bitbucket]=''
    [git_branch]=''
    [git_github]=''
    [git_gitlab]=''
    [git_modified]='✚'
    [newline]='  '
    [newline_root]='  '
    [ps2]='...'
    [read_only]=''
    [segment_separator]=''
    [ssh]=''
    [venv]=''
    [vimode_cmd]='N'
    [vimode_ins]='I'
    [working_dir_folder]=''
    [working_dir_home]=''
    [working_dir_separator]=''
	)
	source "$(dirname $(realpath "$BASH_SOURCE"))/trueline/trueline.sh"
else
	__git_ps1 ()
	{
		local b="$(git symbolic-ref HEAD 2>/dev/null)";
		if [ -n "$b" ]; then
			printf "(%s)" "${b##refs/heads/}";
		fi
	}
	PS1="\n\u@\h:\w\$(__git_ps1)\n$ "
fi

unset color_prompt

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
        . $HOME/.$file
    fi
done

# enable programmable completion features.
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Use a MATLAB-like history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'


# tmuxinator wants this. 
export EDITOR=vim

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/root/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/root/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/root/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/root/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export GPGKEY=3FAF28AD8D32CD749D02435C3FC6E7CE623D9B6F

