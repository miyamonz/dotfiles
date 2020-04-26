Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
let g:indent_guides_exclude_filetypes=['help', 'man']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray ctermbg=248
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=240
let g:indent_guides_guide_size=3
