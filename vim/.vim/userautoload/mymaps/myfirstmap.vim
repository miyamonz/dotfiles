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
