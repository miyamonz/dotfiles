alias v='vim'
alias vi='vim'
alias vim='nvim'

# nvim
export NVIM_TUI_ENABLE_TRUE_COLOR=1

if [ ! -f "$XDG_CONFIG_HOME/nvim/init.vim" ]; then
    mkdir -p "$XDG_CONFIG_HOME/nvim"
    ln -snfv "$DOTFILES_DIR/nvim/vimrc" "$XDG_CONFIG_HOME/nvim/init.vim"
fi
