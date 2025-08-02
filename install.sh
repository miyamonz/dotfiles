#!/bin/zsh

if type brew > /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew update
brew upgrade

MODULE_DIR=$DOTFILES_DIR/modules

for FOLDER in $MODULE_DIR/*/; do
    SH="$FOLDER/install.sh"
    if [[ -f $SH ]]; then
        echo "install $SH"
        source $SH
    fi
done

ln -sfnv "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
