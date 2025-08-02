DIR=${0:A:h}

if [ ! -f "$XDG_CONFIG_HOME/tig/config" ]; then
    mkdir -p "$XDG_CONFIG_HOME/tig"
    ln -snfv "$DIR/config" "$XDG_CONFIG_HOME/tig/config"
fi
