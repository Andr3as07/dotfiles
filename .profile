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

export XEDITOR="/usr/bin/emacs -no-site-file"
export EDITOR="/usr/bin/emacs -no-site-file"
export VISUAL="/usr/bin/emacs -no-site-file"
export TEXEDIT="/usr/bin/emacs -no-site-file +%d %s"
export MPEDIT="/usr/bin/emacs -no-site-file +%d %s"

# Cleanup
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"/pass
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export HISTFILE="$XDG_DATA_HOME"/sh/history
export LESSKEY="$XDG_DATA_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export WGETRC="$XDG_CONFIG_HOME"/wgetrc
alias wget="wget --hsts-file=\"$XDG_CACHE_HOME/wget-hsts\""

# Start gui on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! ps -e | prep -qw Xorg && exec startx

# Setup askpass
export SUDO_ASKPASS=$HOME/.local/bin/dmenupass
export GPG_TTY=$(tty)
