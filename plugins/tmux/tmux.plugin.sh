#!/bin/zsh

DIR=${0:a:h}
if [ ! -f "$XDG_CONFIG_HOME/tmux/tmux.conf" ]; then
    ln -snfv "$DIR/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
fi
ln -snfv "$DIR/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"

# . $DIR/tmux.completion.bash

# TODO: tmux completion for zsh