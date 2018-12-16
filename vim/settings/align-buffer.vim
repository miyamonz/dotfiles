" buffer全体を整形する
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
