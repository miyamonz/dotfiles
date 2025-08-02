DIR=${0:A:h}

if [ ! -f "$HOME/.inputrc" ]; then
    ln -snfv "$DIR/inputrc" "$HOME/.inputrc"
fi
