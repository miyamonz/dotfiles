
" forked from http://qiita.com/naoty_k/items/56eddc9b76fe630f9be7

" todoリストを簡単に入力する
let b:AutoPairs = {'(':')','{':'}',"'":"'",'"':'"', '`':'`'}
abbreviate tl - [ ]

" 入れ子のリストを折りたたむ
" setlocal foldmethod=expr foldexpr=MkdCheckboxFold(v:lnum) foldtext=MkdCheckboxFoldText()
setlocal foldmethod=indent foldtext=MkdCheckboxFoldText()

function! MkdCheckboxFold(lnum)
    let line = getline(a:lnum)
    let next = getline(a:lnum + 1)
    let prev = getline(a:lnum - 1)
    if a:lnum==1
        return 0
    endif
    if CountIndent(line) < CountIndent(next)
        return CountIndent(next)
    endif
    if CountIndent(line) > CountIndent(next)
        return '<' . CountIndent(line)
    endif
    return '='

    if MkdIsNoIndentCheckboxLine(line) && MkdHasIndentLine(next)
        return 1
    elseif (MkdIsNoIndentCheckboxLine(next) || next =~ '^$') && !MkdHasIndentLine(next)
        return '<1'
    endif
    return '='
endfunction

function! CountIndent(line)
    let l:sub = matchlist(a:line, '^\(\s*\)-','\1','')[1]
    " echo strlen(l:sub) / &tabstop
    return strlen(l:sub) / &tabstop
endfunction

function! MkdIsNoIndentCheckboxLine(line)
    return a:line =~ '^- \[[ x]\] '
endfunction
function! MkdHasIndentLine(line)
    return a:line =~ '^[[:blank:]]\+'
endfunction
function! MkdCheckboxFoldText()
    let l:indent = CountIndent(getline(v:foldstart))

    let l:checked = 0
    let l:unchecked = 0
    for l in range( v:foldstart , v:foldend )
        if getline(l) =~ '- \[x\]' && CountIndent(getline(l)) == CountIndent(getline(v:foldstart))
            let l:checked += 1 
        endif
        if getline(l) =~ '- \[ \]' && CountIndent(getline(l)) == CountIndent(getline(v:foldstart))
            let l:unchecked += 1 
        endif
    endfor

    let l:tasks = l:checked + l:unchecked

    let l:str = ''
    let l:str .= repeat(' ', l:indent*&tabstop+2)
    let l:str .=  l:tasks. ' tasks '
    let l:str .= '[ '.l:checked.'/'.l:tasks.' ]'
    let l:str .= repeat(' ',&columns)

    return l:str
endfunction

" todoリストのon/offを切り替える
let mapleader=" "
nnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>
vnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>

" 選択行のチェックボックスを切り替える
function! ToggleCheckbox()
    let l:line = getline('.')
    if l:line =~ '\-\s\[\s\]'
        " 完了時刻を挿入する
        let l:result = substitute(l:line, '-\s\[\s\]', '- [x]', '') . ' [' . strftime("%Y/%m/%d (%a) %H:%M") . ']'
        call setline('.', l:result)
    elseif l:line =~ '\-\s\[x\]'
        let l:result = substitute(substitute(l:line, '-\s\[x\]', '- [ ]', ''), '\s\[\d\{4}.\+]$', '', '')
        call setline('.', l:result)
    end
endfunction

syn match MkdCheckboxMark /-\s\[x\]\s.\+/ display containedin=ALL
hi MkdCheckboxMark ctermfg=green
syn match MkdCheckboxUnmark /-\s\[\s\]\s.\+/ display containedin=ALL
hi MkdCheckboxUnmark ctermfg=red

