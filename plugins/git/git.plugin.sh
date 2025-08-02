#!/bin/zsh

# https://github.com/olets/zsh-abbr
abbr g='git'
abbr gti='git'
abbr gs='git status'
abbr ga='git add'
abbr gd='git diff'
abbr gr='g gr'

git-root() {
    cd "$(git rev-parse --show-toplevel)" || exit
}

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

#きれいなdiffひょうじのやつ
export PATH=$PATH:"$HOMEBREW_PREFIX/share/git-core/contrib/diff-highlight"

# DIR=${0:A:h}
# ln -snfv "$DIR/gitconfig" "$HOME/.gitconfig"
# ln -snfv "$DIR/gitignore_global" "$HOME/.gitignore_global"
