#!/bin/zsh

MODULE_DIR=$HOME/dotfiles/modules
FOLDERS=$(ls "$MODULE_DIR")

for FOLDER in $FOLDERS
do
    BINPATH="$MODULE_DIR/$FOLDER/bin"
    if [[ -d $BINPATH ]]; then
        export PATH="$BINPATH:$PATH"
    fi
done
