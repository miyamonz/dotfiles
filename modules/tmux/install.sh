git clone https://github.com/tmux-plugins/tpm $XDG_CONFIG_HOME/tmux/plugins/tpm

DIR=$HOME/dotfiles/modules/tmux
ln -snfv "$DIR/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
