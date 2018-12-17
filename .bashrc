export LANG=ja_JP.UTF-8

# read man file with vim
export MANPAGER="col -b -x|nvim -R -c 'set ft=man nolist nomod noma' -"

# editor setting
export EDITOR="/usr/local/bin/nvim"
export SEARCHER="ag"

export PATH="$HOME/dotfiles/bin:$PATH" 
# command aliases
source $HOME/dotfiles/bash/alias.sh
source $HOME/dotfiles/bash/git.sh
source $HOME/dotfiles/bash/npm-run-peco.sh
source $HOME/dotfiles/bash/prompt.sh
source $HOME/dotfiles/bash/grev.sh

#completion
source $HOME/dotfiles/tmux/tmux.completion.bash


# press ctrl-d 3times to exit
IGNOREEOF=3

# anyenv
eval "$(~/.anyenv/bin/anyenv init -)"

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


# ghq peco 
# using sonaterd/ghs
function ghp () {
  [ "$#" -eq 0 ] && echo "Usage : ghp QUERY" && return 1
  ghs "$@" | peco | awk '{print $1}' | ghq import
}
#Neovim true color support
export NVIM_TUI_ENABLE_TRUE_COLOR=1
#Neovim cursor shape support
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1


# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/miyamonz/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;
