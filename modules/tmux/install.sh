brew install tmux

DIR="$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)"
ln -snfv "$DIR/tmux" "$HOME/.tmux"
ln -snfv "$DIR/tmux.conf" "$HOME/.tmux.conf"
