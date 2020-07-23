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

# Options
# Changing Directories
set -o autocd

# Completion
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files

# Expansion and Globbing
set -o markdirs
set -o nomatch

# History
SAVEHIST=$HISTSIZE

set -o histverify
set -o hist_reduce_blanks
## sharing history between terminals (disabled)
set +o inc_append_history
set +o share_history

set -o histnostore
set +o nomatch
set -o notify
set +o recexact

# Prompt
source $XDG_CONFIG_HOME/zsh/prompt

# Alias
source $XDG_CONFIG_HOME/sh/alias

# Colors
source $XDG_CONFIG_HOME/sh/color

# Keybindings
source $XDG_CONFIG_HOME/zsh/keybindings

# Display colorscript
#colorscript.sh -r

# Syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
