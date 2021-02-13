#!/bin/bash

alias g='git'
alias gti='git'
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gr='g gr'

git-root() {
    cd "$(git rev-parse --show-toplevel)" || exit
}

# git prompot表示
. "$(brew --prefix)/etc/bash_completion.d/git-prompt.sh"
. "$(brew --prefix)/etc/bash_completion.d/git-completion.bash"

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

#git きれいなdiffひょうじのやつ
export PATH=$PATH:"$(brew --prefix)/share/git-core/contrib/diff-highlight"
