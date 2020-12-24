#!/bin/bash

type brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew upgrade

APPS=(
    ripgrep
    gsed
    ghq
    gron
    bat
    peco
    tree
    shellcheck
    ffmpeg
    hub
)


for APP in "${APPS[@]}"
do
    brew install "$APP" || true
done

MODULE_DIR=$HOME/dotfiles/modules
FOLDERS=$(ls "$MODULE_DIR")

for FOLDER in $FOLDERS
do
    SH="$MODULE_DIR/$FOLDER/install.sh"
    if [[ -f $SH ]]; then
        echo "install $SH"
        . $SH
    fi
done

ln -sfnv "$HOME/dotfiles/bashrc" "$HOME/.bashrc"
