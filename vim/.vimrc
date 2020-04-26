if has('nvim')
  set termguicolors
  " クリップボード使える
  set clipboard+=unnamedplus
end

set noswapfile
set runtimepath+=$HOME/dotfiles/vim/
"colors/, ftplugin/,はruntimepathの中にあればvimが自動で解釈する

runtime! init/encoding.vim

" let g:python_host_prog = expand('/usr/local/bin/python')
" let g:python3_host_prog = expand('/usr/local/bin/python3')

runtime! init/autocmd.vim
runtime! init/basic.vim
runtime! plug.vim
runtime! settings/*.vim

set backupskip=/tmp/*,/private/tmp/*
