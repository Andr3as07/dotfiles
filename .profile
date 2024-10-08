# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#export XEDITOR="/usr/bin/emacs -no-site-file"
#export EDITOR="/usr/bin/emacs -no-site-file"
#export VISUAL="/usr/bin/emacs -no-site-file"
#export TEXEDIT="/usr/bin/emacs -no-site-file +%d %s"
#export MPEDIT="/usr/bin/emacs -no-site-file +%d %s"

# Cleanup

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Taskwarrior
export TASKDATA="${XDG_DATA_HOME:-$HOME/.local/share}"/task
export TASKRC="${XDG_CONFIG_HOME:-$HOME/.config}"/task/taskrc
# Pass
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"/pass
# WakaTime
export WAKATIME_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"/wakatime
# Wine
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}"/wineprefixes/default
# XAuthority
#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
# Java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME:-$HOME/.config}"/java
# GPG
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}"/gnupg
# SH
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}"/sh/history
# Less
export LESSKEY="${XDG_DATA_HOME:-$HOME/.local/share}"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
# ZSH
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}"/zsh
# Wget
#export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}"/wgetrc
alias wget="wget --hsts-file=\"$XDG_CACHE_HOME/wget-hsts\""

# Start gui on tty1 if not already running.
# [ "$(tty)" = "/dev/tty1" ] && ! ps -e | prep -qw Xorg && exec startx

# Setup askpass
#export SUDO_ASKPASS=$HOME/.local/bin/dmenupass
#export GPG_TTY=$(tty)
