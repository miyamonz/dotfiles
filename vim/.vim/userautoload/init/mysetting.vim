" kihon {{{2
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set cursorline
hi CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
set showmatch
set foldmethod=marker
set foldcolumn=3
set foldlevel=0
noremap <Space>h  ^
noremap <Space>l  $
nnoremap <Space>/  *
" md as markdown, instead of modula2
" set syntax=markdown
" au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
"color"{{{2
set background=dark
colorscheme solarized
"help C-h でヘルプ開ける"{{{2
nnoremap <C-h> :<C-u>help<space>
nnoremap <C-h><C-h> :<C-u>help<space><C-r><C-w><CR>
""ポップアップの色"{{{2
hi Pmenu ctermbg=0
hi PmenuSel ctermbg=4
hi PmenuSber ctermbg=2
hi Pmenuthumb ctermbg=4
"}}}
"jjで挿入からノーマルモードに戻る "{{{2
 inoremap <silent> jj <ESC>
 inoremap <silent> <C-j> j
 inoremap <silent> っｊ <ESC>  
inoremap <silent> <C-j> <ESC>
"<F5>で即vimrcを編集"{{{2
" nnoremap <F5> :<C-u>tabedit $HOME/dotfiles/.vimrc<CR>
" nnoremap <F6> :<C-u>source $HOME/dotfiles/.vimrc<CR>
"}}}2
"ウインドウ周り sキーでいろいろやる{{{2
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
" nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w><Bar>
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

"}}}2
" 自動でセッション{{{2
au VimLeave * mks!  ~/vimsession

"引数なし起動の時、前回のsessionを復元
autocmd VimEnter * nested if @% == '' && s:GetBufByte() == 0 | source ~/vimsession | endif
function! s:GetBufByte()
    let byte = line2byte(line('$') + 1)
    if byte == -1
        return 0
    else
        return byte - 1
    endif
endfunction
" }}}2
set pumheight=10
set showmatch
set matchtime=1
nnoremap Y y$
nnoremap gF :vertical wincmd f<CR>

autocmd BufRead,BufNewFile *.abo setfiletype abo

set nf=""

hi ColorColumn ctermbg=256 
exe "set colorcolumn=" . join(range(81,999), ',')
" vim: foldcolumn=2
" vim: foldlevel=1
"
