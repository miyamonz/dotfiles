#!bin/bash

peco-select-history() {
declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = ();  } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in;  }' | peco --query "$READLINE_LINE")
READLINE_LINE="$l"
READLINE_POINT=${#l}
} 
bind -x '"\C-r": peco-select-history'

function t() {
    local lines=$(cat << EOS
$(tmux list-sessions | sed 's/^/attach: /g')
new-window
new-session
detach
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
        local sname
        read -p "session name: " sname
        tmux new-session -d -s $sname
        tmux switch-client -t $sname
    elif [ $COMMAND == "detach" ]; then
        tmux detach-client
    fi
}


# ghq peco 
# using sonaterd/ghs
function ghp () {
  [ "$#" -eq 0 ] && echo "Usage : ghp QUERY" && return 1
  ghs "$@" | peco | awk '{print $1}' | ghq import
}
