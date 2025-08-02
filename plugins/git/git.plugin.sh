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

#きれいなdiffひょうじのやつ
export PATH=$PATH:"$HOMEBREW_PREFIX/share/git-core/contrib/diff-highlight"

# DIR=${0:a:h}
# ln -snfv "$DIR/gitconfig" "$HOME/.gitconfig"
# ln -snfv "$DIR/gitignore_global" "$HOME/.gitignore_global"
