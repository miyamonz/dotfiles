#!/bin/zsh

export LANG=ja_JP.UTF-8

if [[ "$(uname)" = "Darwin" ]]; then
elif [[ "$(uname)" = "Linux" ]]; then
  export LANG=en_US.UTF-8
fi

export TERM='xterm-256color'
export PATH="$HOME/dotfiles/bin:$PATH"

# brew path
source $HOME/dotfiles/init-brew.sh

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export BREW_PREFIX="$(brew --prefix)"

# editor setting
export EDITOR="$BREW_PREFIX/bin/nvim"
export SEARCHER="rg"

# read man file with vim
export MANPAGER="/bin/sh -c -c \"col -b -x | $EDITOR -R -c 'set ft=man nolist nomod noma' -\""

# prevent exit by sending C-d
IGNOREEOF=200

alias IS_MAC='[[ "$(uname)" == "Darwin" ]]'
alias IS_WSL='[[ -f /proc/version ]] && grep -q microsoft /proc/version'

# emacs keybind
bindkey -e

#autoload -Uz compinit && compinit

# sheldon
# project://sheldon/plugins.toml
[ -f $HOME/.config/sheldon/plugins.toml ] || ln -snf $HOME/dotfiles/sheldon/plugins.toml $HOME/.config/sheldon/plugins.toml
eval "$(sheldon source)"

export PROMPT_COMMAND=""
source $HOME/dotfiles/alias.sh
source $HOME/dotfiles/znaprc.sh
source $HOME/dotfiles/rc.sh
source $HOME/dotfiles/addpath.sh

# pnpm
export PNPM_HOME="/Users/miyamonz/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


. "$HOME/.local/share/../bin/env"
