if has('nvim')
  set termguicolors
  " クリップボード使える
  set clipboard+=unnamedplus
end

" colors, ftplugin,はruntimepathの中にあれば自動で解釈される
" 以降のinit/やplugin-setting/を相対パスでruntime!で読み込みできる
set runtimepath+=$HOME/dotfiles/vim/

runtime! init/encoding.vim

let g:python_host_prog = expand('/usr/local/bin/python')
let g:python3_host_prog = expand('/usr/local/bin/python3')

runtime! init/autocmd.vim
runtime! init/dein.vim
runtime! init/basic.vim

runtime! plugin-settings/*.vim
runtime! settings/*.vim

set backupskip=/tmp/*,/private/tmp/*
