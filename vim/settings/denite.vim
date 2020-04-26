" vim-plugの仕様上、関数呼び出しはPlug
" endのあとでないといけないのでsettingに入れる
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

" これはPlug直下でもいいがファイルをまとめたい
nnoremap [denite] <Nop>
nmap <Space> [denite]
nnoremap <silent> [denite]f  :<C-u>Denite file/rec/git file:new<CR>
nnoremap <silent> [denite]b  :<C-u>Denite buffer<CR>
nnoremap <silent> [denite]g  :<C-u>Denite file/rec/git<CR>
nnoremap <silent> [denite]o  :<C-u>Denite outline<CR>
nnoremap <silent> [denite]mr :<C-u>Denite file_mru<CR>

autocmd FileType denite call s:denite_my_settings()

function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d       denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p       denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q       denite#do_map('quit')
    nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction


autocmd FileType denite-filter call s:denite_filter_my_settings()

function! s:denite_filter_my_settings() abort
    inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
endfunction
