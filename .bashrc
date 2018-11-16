# command aliases
source $HOME/dotfiles/bash/alias.sh
source $HOME/dotfiles/bash/git.sh

#completion
source $HOME/dotfiles/tmux/tmux.completion.bash

# https://blog.leko.jp/post/more-easy-to-use-npm-scripts/
_npm_run_peco() {
    local cur prev cword
    _get_comp_words_by_ref -n : cur prev cword
    if [ "$prev" = "run" ] || [ "$prev" = "yarn" ]; then
        # COMPREPLY=$(cat package.json | jq -r '.scripts | keys[]' | peco --initial-filter=Fuzzy --query=$cur)
        COMPREPLY=$(cat package.json | gron | grep -oE "scripts\.[^ ]*" | awk -F'.' '{print $2}' | peco --initial-filter=Fuzzy --query=$cur)
    fi
}
complete -F _npm_run_peco npm yarn

# プロンプト
WHITE="\[\e[00m\]"
GREEN="\[\e[32m\]"
BLUE="\[\e[34m\]"
RED="\[\e[31m\]"
PS_USER="$GREEN\u@\h"
export PS1="${PS_USER}${WHITE}:${BLUE}\w${RED}\$(__git_ps1)${WHITE}\$ "

# read man file with vim
export MANPAGER="col -b -x|nvim -R -c 'set ft=man nolist nomod noma' -"

# editor setting
export EDITOR="/usr/local/bin/nvim"
export SEARCHER="ag"

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

peco-select-history() {
declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = ();  } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in;  }' | peco --query "$READLINE_LINE")
READLINE_LINE="$l"
READLINE_POINT=${#l}
} 
bind -x '"\C-r": peco-select-history'

# agで検索した結果から選択し、ファイルを開く https://qiita.com/umanoda/items/d55cf51a4bbf2bda7e03
# 名前はgrep + vim でgrevにした
function grev(){
  path=$($SEARCHER $* | peco | awk -F: '{printf  $1 " +" $2}'| sed -e 's/\+$//')
  if [ -n "$path" ]; then
    echo "$EDITOR $path"
    $EDITOR $path
  fi  
}

# ghq peco 
# using sonaterd/ghs
function ghp () {
  [ "$#" -eq 0 ] && echo "Usage : ghp QUERY" && return 1
  ghs "$@" | peco | awk '{print $1}' | ghq import
}

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/miyamonz/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;