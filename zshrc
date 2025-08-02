#!/bin/zsh

export TERM='xterm-256color'
export DOTFILES_DIR="$HOME/dotfiles"
export PATH="$DOTFILES_DIR/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# editor setting
export EDITOR="$HOMEBREW_PREFIX/bin/nvim"
export SEARCHER="rg"

# read man file with vim
export MANPAGER="/bin/sh -c -c \"col -b -x | $EDITOR -R -c 'set ft=man nolist nomod noma' -\""

# prevent exit by sending C-d
IGNOREEOF=200

# emacs keybind
bindkey -e

# sheldon
# project://sheldon/plugins.toml
export SHELDON_CONFIG_DIR="$DOTFILES_DIR/sheldon"
eval "$(sheldon source)"

export PROMPT_COMMAND=""

# ./modules
source $DOTFILES_DIR/rc.sh

# pnpm
export PNPM_HOME="/Users/miyamonz/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

alias claude="/Users/miyamonz/.claude/local/claude"
