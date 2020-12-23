function! Current_cursor()
    let s = @"
    normal! yi"
    let c = @"
    let @" = s
    let l = getline('.')
    if match(l, '"') == -1
        return
    endif

    echo c
    call system("open ".c)
endfunction

nnoremap go :<C-u>call Current_cursor()<CR>
