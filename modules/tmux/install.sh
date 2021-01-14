brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

DIR="$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)"
ln -snfv "$DIR/tmux" "$HOME/.tmux"
ln -snfv "$DIR/tmux.conf" "$HOME/.tmux.conf"
