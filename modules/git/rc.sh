#!/bin/zsh

alias g='git'
alias gti='git'
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gr='g gr'

git-root() {
    cd "$(git rev-parse --show-toplevel)" || exit
}

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

export PATH=$PATH:"$HOME/dotfiles/modules/git/bin"

#git きれいなdiffひょうじのやつ
export PATH=$PATH:"$BREW_PREFIX/share/git-core/contrib/diff-highlight"
