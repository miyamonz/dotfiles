brew install neovim

DIR="$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)"
ln -snfv "$HOME/dotfiles/nvim/vimrc" "$XDG_CONFIG_HOME/nvim/init.vim"
