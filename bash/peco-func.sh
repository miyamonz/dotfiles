#!bin/bash

peco-select-history() {
declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = ();  } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in;  }' | peco --query "$READLINE_LINE")
READLINE_LINE="$l"
READLINE_POINT=${#l}
} 
bind -x '"\C-r": peco-select-history'

function attach-tmux-session() {
    local REPO_PATH=$@
    local SNAME=$(basename $REPO_PATH)
    if [ -n "$TMUX" ]; then
        tmux new-session -d -s $SNAME -c $REPO_PATH
        tmux switch-client -t $SNAME
    else
        tmux new-session -s $SNAME -c $REPO_PATH
        tmux attach -t $SESSION
    fi
}
function t() {
    local lines=$(cat << EOS
new-window:
new-session:
detach:
session-from-repo:
new-repo:
$(tmux list-sessions -F '#{session_name}' | sed 's/^/attach: /g')
EOS
)
    local SELECTED="$( echo "$lines" | peco )"
    local COMMAND=$(echo "$SELECTED" | cut -d : -f 1)

    # local CURRENT_SESSION=$(tmux display-message -p '#S')

    if [ $COMMAND == "attach" ]; then
        local SESSION=$(echo "$SELECTED" | cut -d : -f 2)
        if [ -n "$TMUX" ]; then
            tmux switch-client -t $SESSION
        else
            tmux attach -t $SESSION
        fi
    elif [ $COMMAND == "new-window" ]; then
        tmux new-window
    elif [ $COMMAND == "new-session" ]; then
        local SNAME
        read -p "session name: " SNAME
        tmux new-session -d -s $SNAME
        tmux switch-client -t $SNAME
    elif [ $COMMAND == "detach" ]; then
        tmux detach-client
    elif [ $COMMAND == "session-from-repo" ]; then
        local REPO_PATH=
        attach-tmux-session "~/$(ghq-list | peco)"
    elif [ $COMMAND == "new-repo" ]; then
        local MIYAMONZ_PATH=$(ghq root)/github.com/miyamonz
        local NAME
        read -p "new git repo miyamonz/ " NAME
        local REPO_PATH=$MIYAMONZ_PATH/$NAME
        echo $REPO_PATH
        mkdir $REPO_PATH || return
        attach-tmux-session $REPO_PATH
    fi
}


# ghq peco 
# using sonaterd/ghs
function ghp () {
  [ "$#" -eq 0 ] && echo "Usage : ghp QUERY" && return 1
  ghs "$@" | peco | awk '{print $1}' | ghq import
}
