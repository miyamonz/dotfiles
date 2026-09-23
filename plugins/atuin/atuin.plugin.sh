#!/bin/zsh

DIR=${0:A:h}
# config
if [ ! -f $HOME/.config/atuin/config.toml ]; then
    ln -snf $DIR/config.toml $HOME/.config/atuin/config.toml
fi

# eval "$(atuin init zsh)"
cache-eval atuin init zsh && source $REPLY

# eval "$(atuin gen-completions --shell zsh)"
cache-eval atuin gen-completions --shell zsh && source $REPLY
