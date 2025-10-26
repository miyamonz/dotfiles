#!/bin/zsh

DIR=${0:A:h}
# config
if [ ! -f $HOME/.config/atuin/config.toml ]; then
    ln -snf $DIR/config.toml $HOME/.config/atuin/config.toml
fi

source "$HOME/.atuin/bin/env"
# eval "$(atuin init zsh)"
smartcache eval atuin init zsh

# eval "$(atuin gen-completions --shell zsh)"
smartcache eval atuin gen-completions --shell zsh