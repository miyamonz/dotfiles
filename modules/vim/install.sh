DIR=${0:a:h}
mkdir -p "$XDG_CONFIG_HOME/nvim"
ln -snfv "$HOME/dotfiles/nvim/vimrc" "$XDG_CONFIG_HOME/nvim/init.vim"
