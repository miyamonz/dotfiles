if has('nvim')
  set termguicolors
  " クリップボード使える
  set clipboard+=unnamedplus
end

source init/encoding.vim

let g:python_host_prog = expand('/usr/local/bin/python')
let g:python3_host_prog = expand('/usr/local/bin/python3')

source init/autocmd.vim

" colors, ftplugin,はruntimepathの中にあれば自動で解釈される
set runtimepath+=$HOME/dotfiles/vim/

set runtimepath+=$HOME/dotfiles/vim/dein/
source dein/dein-init.vim

source init/basic.vim
source init/mysetting.vim
runtime! plugin-setting/*.vim
runtime! mymaps/*.vim

set backupskip=/tmp/*,/private/tmp/*
