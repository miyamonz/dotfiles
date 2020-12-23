#!bin/bash

alias g='git'
alias gti='git'
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gr='g gr'

git-root() {
    cd $(git rev-parse --show-toplevel)
}

# git prompot表示
. $(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

#git きれいなdiffひょうじのやつ
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
