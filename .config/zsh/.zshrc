#     _              _     _____            ___ ______
#    / \   _ __   __| |_ _|___ /  __ _ ___ / _ \  ___/
#   / _ \ | '_ \ / _` | '__||_ \ / _` / __/ | | \ \   
#  / ___ \| | | | (_| | |  ___) | (_| \__ \ |_| |\ \  
# /_/   \_|_| |_|\__,_|_| |____/ \__,_|___/\___/  \_\ 
# https://github.com/Andr3as07
#
# Zsh configuration file

compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

export CLICOLOR=1
export TERM=xterm-256color
autoload -U colors && colors

# Prompt
source $XDG_CONFIG_HOME/zsh/prompt

# Alias
source $XDG_CONFIG_HOME/sh/alias

# Colors
source $XDG_CONFIG_HOME/sh/color

# Display colorscript
#colorscript.sh -r
