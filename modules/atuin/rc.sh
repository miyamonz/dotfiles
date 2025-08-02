#!/bin/zsh

# atuin
source "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

# config
if [ ! -f $HOME/.config/atuin/config.toml ]; then
    ln -snf $HOME/dotfiles/modules/atuin/config.toml $HOME/.config/atuin/config.toml
fi