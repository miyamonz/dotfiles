set nonu
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set autoindent
set smartindent

hi CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
noremap <Space>h  ^
noremap <Space>l  $

" bufferを閉じても直ちに消さずに隠しているだけになる
set hidden
let g:solarized_termcolors=256

nnoremap Y y$
nnoremap gF :vertical wincmd f<CR>

