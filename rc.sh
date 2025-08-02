#!/bin/zsh

MODULE_DIR=$HOME/dotfiles/modules

for FOLDER in $MODULE_DIR/*/; do
    RC="${FOLDER}/rc.sh"
    if [[ -f $RC ]]; then
        source $RC
    fi
done

