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
source $XDG_CONFIG_HOME/sh/color

# Blesh
source ~/.local/share/blesh/ble.sh

bleopt exec_elapsed_mark=
bleopt exec_exit_mark=
bleopt exec_errexit_mark=
bleopt edit_marker=
bleopt edit_marker_error=

# Display colorscript
#colorscript.sh -r
