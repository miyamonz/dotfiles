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
set runtimepath+=$HOME/dotfiles/vim/.vim/
runtime! dein-init.vim

runtime! userautoload/init/basic.vim
runtime! userautoload/init/mysetting.vim
runtime! userautoload/plugin-setting/*.vim
runtime! userautoload/mymaps/*.vim

set backupskip=/tmp/*,/private/tmp/*
