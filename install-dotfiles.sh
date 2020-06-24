#!/bin/bash

git clone --bare https://github.com/andr3as07/dotfiles.git $HOME/.dotfiles

function config {
    git --git-dir=$HOME/.dotfiles --work-tree=$Home $@
}

mkdir -p $HOME/.dotfiles-backup

config checkout
if [ $? = 0 ]; then
    echo "Checked out config."
else
    echo "Backing up pre-existing dotfiles."
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dorfiles-backup/{}    
fi

config checkout
coufig config status.showUntrackedFiles no
