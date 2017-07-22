# command aliases
alias ls='ls -a -G -F'
alias lsl='ls -a -G -F -l'
alias chrome='open -a "Google Chrome"'
alias mkdri='mkdir'

# git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias ggr='g gr'

alias arduino='/Applications/Arduino.app/Contents/MacOS/Arduino'

# git の補完とgit prompot表示
source $HOME/dotfiles/git/git-prompt.sh
source $HOME/dotfiles/git/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

# プロンプト
WHITE="\[\e[00m\]"
GREEN="\[\e[32m\]"
BLUE="\[\e[34m\]"
RED="\[\e[31m\]"
PS_USER="$GREEN\u@\h"
export PS1="$PS_USER$WHITE:$BLUE\w$RED$(__git_ps1)$WHITE\$ "
PS1="$(ls)\n $PS1"

export PATH=$HOME/.nodebrew/current/bin:$PATH
# read man file with vim
export MANPAGER="col -b -x|vim -R -c 'set ft=man nolist nomod noma' -"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/Users/koichi/Documents/Adobe/flex_sdk_4.6/bin:$PATH"
eval "$(pyenv init -)"

# editor setting
export EDITOR="/usr/local/bin/vim"

export PATH="~/bin:$PATH" 

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
