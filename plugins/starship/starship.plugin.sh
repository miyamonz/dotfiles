#!/bin/zsh

DIR=${0:A:h}
export STARSHIP_CONFIG="$DIR/config.toml"
eval "$(/opt/homebrew/bin/starship init zsh)"
# smartcache eval starship init zsh --print-full-init