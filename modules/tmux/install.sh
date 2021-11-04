git clone https://github.com/tmux-plugins/tpm $XDG_CONFIG_HOME/tmux/plugins/tpm

DIR=${0:a:h}
ln -snfv "$DIR/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
