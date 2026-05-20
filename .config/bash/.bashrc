#     _              _     _____            ___ ______
#    / \   _ __   __| |_ _|___ /  __ _ ___ / _ \  ___/
#   / _ \ | '_ \ / _` | '__||_ \ / _` / __/ | | \ \   
#  / ___ \| | | | (_| | |  ___) | (_| \__ \ |_| |\ \  
# /_/   \_|_| |_|\__,_|_| |____/ \__,_|___/\___/  \_\ 
# https://github.com/Andr3as07
#
# Bash configuration file

export CLICOLOR=1
export TERM=xterm-256color

# Prompt
#source $XDG_CONFIG_HOME/bash/prompt
eval "$(starship init bash)"

# Alias
source $XDG_CONFIG_HOME/sh/alias

# Colors
# source $XDG_CONFIG_HOME/sh/color

# Options
HISTCONTROL=ignoredups
HISTSIZE=20000
HISTFILESIZE=20000
shopt -s histappend

shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s direxpand
shopt -s histreedit
shopt -s histverify

shopt -u cdable_vars

# Display colorscript
#colorscript.sh -r

if command -v "atuin" > /dev/null 2>&1; then
    eval "$(atuin init bash)"
fi

eval "$(thefuck --alias)"
# FIXME: This has some problems if we connect with ssh
# bind "\"\C-f\": \"fuck\""
