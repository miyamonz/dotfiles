DIR=${0:a:h}

ln -snfv "$DIR/gitconfig" "$HOME/.gitconfig"
ln -snfv "$DIR/gitignore_global" "$HOME/.gitignore_global"

# for perl used by diff-highlight
if IS_WSL; then
    sudo apt-get install -y locales-all
fi