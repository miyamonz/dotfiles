DIR=${0:a:h}

if [ ! -f "$HOME/.inputrc" ]; then
    ln -snfv "$DIR/inputrc" "$HOME/.inputrc"
fi
