set encoding=utf-8
scriptencoding utf-8

augroup MyAutoCmd
    autocmd!
augroup end

let $DOT_DIRECTORY=$HOME.'/dotfiles'
set runtimepath+=$DOT_DIRECTORY/vim/.vim/
set runtimepath+=$DOT_DIRECTORY/vim/dein/
runtime! dein-init.vim

runtime! userautoload/init/basic.vim
runtime! userautoload/init/mysetting.vim

runtime! userautoload/plugin-setting/*.vim

runtime! userautoload/mymaps/*.vim

set backupskip=/tmp/*,/private/tmp/*
