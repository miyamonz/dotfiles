#!/bin/zsh

DIR=${0:a:h}
# config
if [ ! -f $HOME/.config/atuin/config.toml ]; then
    ln -snf $DIR/config.toml $HOME/.config/atuin/config.toml
fi

source "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"