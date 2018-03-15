# command aliases
alias ls='ls -a -G -F'
alias lsl='ls -a -G -F -l'
alias chrome='open -a "Google Chrome"'
alias mkdri='mkdir'

# git
alias g='git'
alias gti='git'
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gr='g gr'

alias arduino='/Applications/Arduino.app/Contents/MacOS/Arduino'

# git の補完とgit prompot表示
source $HOME/dotfiles/git/git-prompt.sh
source $HOME/dotfiles/git/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

#git きれいなdiffひょうじのやつ
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

# プロンプト
WHITE="\[\e[00m\]"
GREEN="\[\e[32m\]"
BLUE="\[\e[34m\]"
RED="\[\e[31m\]"
PS_USER="$GREEN\u@\h"
export PS1="${PS_USER}${WHITE}:${BLUE}\w${RED}\$(__git_ps1)${WHITE}\$ "

# read man file with vim
export MANPAGER="col -b -x|vim -R -c 'set ft=man nolist nomod noma' -"

# editor setting
export EDITOR="/usr/local/bin/vim"

export PATH="$HOME/dotfiles/bin:$PATH" 
IGNOREEOF=3

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# . $HOME/dotfiles/bash/enhancd/init.sh

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

err() { echo "$*" >&2; exit 1; }
