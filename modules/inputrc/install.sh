DIR="$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)"
ln -snfv "$DIR/inputrc" "$HOME/.inputrc"
