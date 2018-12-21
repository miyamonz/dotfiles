if has('nvim')
  set termguicolors
  " クリップボード使える
  set clipboard+=unnamedplus
end

set runtimepath+=$HOME/dotfiles/vim/
" 以降
"- init/
"- plugin-setting/
"- settings/
"を相対パスでruntime!で読み込みできる
"colors/, ftplugin/,はruntimepathの中にあればvimが自動で解釈する

runtime! init/encoding.vim

let g:python_host_prog = expand('/usr/local/bin/python')
let g:python3_host_prog = expand('/usr/local/bin/python3')

runtime! init/autocmd.vim


runtime! init/plug.vim
"runtime! init/dein.vim
runtime! init/basic.vim

runtime! plugin-settings/*.vim
runtime! settings/*.vim

set backupskip=/tmp/*,/private/tmp/*
