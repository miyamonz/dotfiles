# command aliases
source $HOME/dotfiles/bash/alias.sh
source $HOME/dotfiles/bash/git.sh

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
# press ctrl-d 3times to exit
IGNOREEOF=3

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

err() { echo "$*" >&2; exit 1; }

# brew install z
. /usr/local/etc/profile.d/z.sh

#go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
