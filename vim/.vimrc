if has('nvim')
  set termguicolors
  " クリップボード使える
  set clipboard+=unnamedplus
end

" 順序が逆だと無理という記述があった
" 前者は端末に表示される出力のエンコーディング
" 後者はscriptのencoding
set encoding=utf-8
scriptencoding utf-8

let g:python_host_prog = expand('/usr/local/bin/python')
let g:python3_host_prog = expand('/usr/local/bin/python3')

" vimにはautocmdといって、特定のイベント発生にフックができる
" いかし、登録は多重にできるので、
" vimrcを何度もsourceした場合に、意図せず多重登録される時がある
augroup MyAutoCmd
    autocmd!
augroup end

set runtimepath+=$HOME/dotfiles/vim/dein/
" colors, ftplugin,はruntimepathの中にあれば自動で解釈される
set runtimepath+=$HOME/dotfiles/vim/

runtime! dein-init.vim

runtime! init/basic.vim
runtime! init/mysetting.vim
runtime! plugin-setting/*.vim
runtime! mymaps/*.vim

set backupskip=/tmp/*,/private/tmp/*
