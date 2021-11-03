#!/bin/zsh

export LANG=ja_JP.UTF-8
export TERM='xterm-256color'

export XDG_CONFIG_HOME="$HOME/.config"
export BREW_PREFIX="$(brew --prefix)"


# editor setting
export EDITOR="$BREW_PREFIX/bin/nvim"
export SEARCHER="rg"

# read man file with vim
export MANPAGER="col -b -x|$EDITOR -R -c 'set ft=man nolist nomod noma' -"

# prevent exit by sending C-d
IGNOREEOF=200

alias IS_MAC='[[ "$(uname)" == "Darwin" ]]'
alias IS_WSL='[[ -f /proc/version ]] && grep -q microsoft /proc/version'

autoload -Uz compinit && compinit

export PROMPT_COMMAND=""
source $HOME/dotfiles/alias.sh
source $HOME/dotfiles/rc.sh
source $HOME/dotfiles/addpath.sh
