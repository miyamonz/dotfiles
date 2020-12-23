#!/bin/bash


MODULE_DIR=$HOME/dotfiles/modules
FOLDERS=$(ls $MODULE_DIR)

for FOLDER in $FOLDERS
do
	RC="$MODULE_DIR/$FOLDER/rc.sh"
	if [[ -f $RC ]]; then
		. $RC
	fi
done

