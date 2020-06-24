# Created by Andr3as07 <andr3as06@gmail.com>

compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

export CLICOLOR=1
export TERM=xterm-256color
autoload -U colors && colors

# Prompt
source $XDG_CONFIG_HOME/zsh/prompt

# Alias
source $XDG_CONFIG_HOME/alias
