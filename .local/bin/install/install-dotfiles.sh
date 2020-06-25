#!/bin/bash

git clone --bare https://github.com/andr3as07/dotfiles.git $HOME/.dotfiles

config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

echo "Creating backup direktory"
mkdir -p $HOME/.dotfiles-backup

conflicts=$($config checkout 2>&1)
if [ $? = 0 ]; then
    echo "Checked out config."
else
    echo "Backing up pre-existing dotfiles."

    echo "$conflicts" | egrep "\s+\." | awk {'print $1'} | xargs -I{} dirname $HOME/.dotfiles-backup/{} | xargs -I{} mkdir -p {}
    echo "$conflicts"| egrep "\s+\." | awk {'print $1'} | xargs -I{} mv $HOME/{} $HOME/.dotfiles-backup/{}
    
    $config checkout
fi

$config config status.showUntrackedFiles no

echo "Done"
