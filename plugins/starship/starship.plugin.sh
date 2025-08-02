#!/bin/zsh

DIR=${0:a:h}
export STARSHIP_CONFIG="$DIR/config.toml"
eval "$(starship init zsh)"