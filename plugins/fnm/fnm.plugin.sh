#!/bin/zsh

export FNM_DIR="$HOME/Library/Application Support/fnm"
export PATH="$FNM_DIR:$PATH"
eval "$(fnm env --use-on-cd)"
