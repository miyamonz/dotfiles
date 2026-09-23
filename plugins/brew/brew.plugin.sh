#!/bin/zsh

# macOS では公式の推奨どおり ~/.zprofile で brew shellenv を実行する
# Linux は公式の推奨が ~/.zshrc なので、ここで実行する
if [[ $OSTYPE == linux* ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"
fi
