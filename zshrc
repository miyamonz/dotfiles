# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
#!/bin/zsh

export LANG=ja_JP.UTF-8

if [[ "$(uname)" = "Darwin" ]]; then
elif [[ "$(uname)" = "Linux" ]]; then
    export LANG=en_US.UTF-8
fi

export TERM='xterm-256color'

if [[ "$(uname)" = "Darwin" ]]; then
  if [[ "$(uname -m)" = "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH="/opt/homebrew/bin:$PATH"
  else
    eval "$(/usr/local/bin/brew shellenv)"
    export PATH="/usr/local/bin:$PATH"
  fi
elif [[ "$(uname)" = "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

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

autoload -Uz compinit && compinit

export PROMPT_COMMAND=""
source $HOME/dotfiles/alias.sh
source $HOME/dotfiles/znaprc.sh
source $HOME/dotfiles/rc.sh
source $HOME/dotfiles/addpath.sh

# bun completions
[ -s "/Users/miyamonz/.bun/_bun" ] && source "/Users/miyamonz/.bun/_bun"

# bun
export BUN_INSTALL="/Users/miyamonz/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

