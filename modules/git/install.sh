DIR="$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)"
ln -snfv "$DIR/gitconfig" "$HOME/.gitconfig"
ln -snfv "$DIR/gitignore_global" "$HOME/.gitignore_global"

# for perl used by diff-highlight
sudo apt-get install -y locales-all
