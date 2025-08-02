DIR=$HOME/dotfiles/znap
if ! [[ -f $DIR/zsh-snap/znap.zsh ]]; then
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git $DIR/zsh-snap
fi
# source $DIR/zsh-snap/znap.zsh

# znap source zsh-users/zsh-autosuggestions
# znap source marlonrichert/zsh-autocomplete

# https://qiita.com/mollifier/items/81b18c012d7841ab33c3
# znap source mollifier/anyframe
alias a=anyframe-widget-select-widget

# znap source t413/zsh-background-notify
# znap source popstas/zsh-command-time