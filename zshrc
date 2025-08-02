#!/bin/zsh

export TERM='xterm-256color'

DIR=${0:A:h}
export DOTFILES_DIR="$DIR"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# editor setting
export EDITOR="$HOMEBREW_PREFIX/bin/nvim"
export SEARCHER="rg"

# prevent exit by sending C-d
# IGNOREEOF=200

# emacs keybind
bindkey -e

# sheldon
# project://sheldon/plugins.toml
export SHELDON_CONFIG_DIR="$DOTFILES_DIR/sheldon"
eval "$(sheldon source)"


alias claude="/Users/miyamonz/.claude/local/claude"
