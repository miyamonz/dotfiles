#!/bin/zsh

export LANG=ja_JP.UTF-8

# WSL向けにはen_US.UTF-8にするほうがいいかも
if [[ "$(uname)" = "Linux" ]]; then
  export LANG=en_US.UTF-8
fi
