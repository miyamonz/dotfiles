DIR=${0:a:h}
mkdir -p "$XDG_CONFIG_HOME/tig"
ln -snfv "$DIR/config" "$XDG_CONFIG_HOME/tig/config"
