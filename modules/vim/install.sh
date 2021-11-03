DIR="$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)"
mkdir -p "$XDG_CONFIG_HOME/nvim"
ln -snfv "$HOME/dotfiles/nvim/vimrc" "$XDG_CONFIG_HOME/nvim/init.vim"
