if has('nvim')
  set termguicolors
  " クリップボード使える
  set clipboard+=unnamedplus
end
set encoding=utf-8
scriptencoding utf-8

let g:python_host_prog = expand('/usr/local/bin/python')
let g:python3_host_prog = expand('/usr/local/bin/python3')

augroup MyAutoCmd
    autocmd!
augroup end

set runtimepath+=$HOME/dotfiles/vim/dein/
set runtimepath+=$HOME/dotfiles/vim/
runtime! dein-init.vim

runtime! init/basic.vim
runtime! init/mysetting.vim
runtime! plugin-setting/*.vim
runtime! mymaps/*.vim

set backupskip=/tmp/*,/private/tmp/*
