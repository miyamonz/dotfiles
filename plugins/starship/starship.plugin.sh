#!/bin/zsh

DIR=${0:A:h}
export STARSHIP_CONFIG="$DIR/config.toml"
eval "$(starship init zsh --print-full-init)"
