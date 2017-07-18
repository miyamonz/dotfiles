function! ExecuteCurrentFile()

    if &filetype == 'php' || &filetype == 'python'
        exe '!' . &filetype . ' %'
    elseif &filetype == 'js'
        exe '!node' . ' %' 
    endif
endfunction

" nnoremap <Space>r :call ExecuteCurrentFile()<CR>
" nnoremap <Space>r :w<CR>:call ExecuteCurrentFile()<CR>
nnoremap <Space>r :w<CR>:QuickRun <CR>


function! Align()
    let pos = getpos(".")
    if &filetype == 'php'
        exe ':set filetype=html'
        normal ggVG=
        exe ':set filetype=php'
        normal ggVG=
    else
        normal ggVG=
    endif
    call setpos(".", pos)
endfunction

map <Space>= :call Align()<CR>

" いきすぎないスクロール
noremap <expr> <C-b> max([winheight(0) - 2, 1]) . "\<C-u>" . (line('.') < 1         + winheight(0) ? 'H' : 'L')
noremap <expr> <C-f> max([winheight(0) - 2, 1]) . "\<C-d>" . (line('.') > line('$') - winheight(0) ? 'L' : 'H')
noremap <expr> <C-y> (line('w0') <= 1         ? 'k' : "\<C-y>")
noremap <expr> <C-e> (line('w$') >= line('$') ? 'j' : "\<C-e>")

" smile
noremap  <Left>  :<C-u>smile<CR>
noremap  <Right> :<C-u>smile<CR>
noremap  <Up>    :<C-u>smile<CR>
noremap  <Down>  :<C-u>smile<CR>
inoremap <Left>  <Esc>:smile<CR>
inoremap <Right> <Esc>:smile<CR>
inoremap <Up>    <Esc>:smile<CR>
inoremap <Down>  <Esc>:smile<CR>
