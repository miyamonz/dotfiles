augroup vimrc
    autocmd!
augroup END
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
let g:indent_guides_exclude_filetypes=['help', 'man']
autocmd vimrc VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=248
autocmd vimrc VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=240
let g:indent_guides_guide_size=3
