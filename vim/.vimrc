set encoding=utf-8
scriptencoding utf-8

augroup MyAutoCmd
    autocmd!
augroup end

set runtimepath+=$HOME/dotfiles/vim/dein/
set runtimepath+=$HOME/dotfiles/vim/.vim/
runtime! dein-init.vim

runtime! userautoload/init/basic.vim
runtime! userautoload/init/mysetting.vim
runtime! userautoload/plugin-setting/*.vim
runtime! userautoload/mymaps/*.vim

set backupskip=/tmp/*,/private/tmp/*
