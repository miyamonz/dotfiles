nnoremap [unite] <Nop>
nmap <Space> [unite]

call unite#custom#source('file', 'matchers', "matcher_default")
let g:unite_sorce_history_yank_enable =1
call unite#custom#profile('default', 'context', {
\   'start_insert': 1,
\   'prompt_direction': 'top',
\   'split' : 0,
\})


nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files buffer bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir  -buffer-name=files buffer bookmark file<CR>
nnoremap <silent> [unite]B  :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]a  :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]mr :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]y  :<C-u>Unite history/yank<CR>
nnoremap <silent> [unite]f  :<C-u>Unite file file/new<CR>
nnoremap <silent> [unite]ma :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]me :<C-u>Unite output:message<CR>
nnoremap <silent> [unite]p  :<C-u>UniteWithProjectDir file_rec:!<CR>

" unite prefix key
nmap [unite]gg    <SID>(giti-sources)
nmap [unite]gr    :<C-u>Unite giti/grep<CR>
nmap [unite]gs    <SID>(git-status)
nmap [unite]gb    <SID>(git-branch)
nmap [unite]gB    <SID>(git-branch_all)
nmap [unite]gl    <SID>(git-log)
nmap [unite]gL    <SID>(git-log-this-file)

    " giti {{{
    if globpath(&rtp, 'plugin/giti.vim') != ''
      let g:giti_log_default_line_count = 100
      nnoremap <expr><silent> <SID>(git-diff)        ':<C-u>GitiDiff ' . expand('%:p') . '<CR>'
      nnoremap <expr><silent> <SID>(git-diff-cached) ':<C-u>GitiDiffCached ' . expand('%:p') .  '<CR>'
      nnoremap       <silent> <SID>(git-fetch-now)    :<C-u>GitiFetch<CR>
      nnoremap       <silent> <SID>(git-fetch)        :<C-u>GitiFetch 
      nnoremap <expr><silent> <SID>(git-push-now)    ':<C-u>GitiPushWithSettingUpstream origin ' . giti#branch#current_name() . '<CR>'
      nnoremap       <silent> <SID>(git-push)         :<C-u>GitiPush 
      nnoremap       <silent> <SID>(git-pull-now)     :<C-u>GitiPull<CR>
      nnoremap       <silent> <SID>(git-pull)         :<C-u>GitiPull 
      nnoremap       <silent> <SID>(git-log-line)     :<C-u>GitiLogLine ' . expand('%:p') . '<CR>'
      nnoremap       <silent> <SID>(git-log)          :<C-u>GitiLog ' . expand('%:p') . '<CR>'

      nnoremap <silent> <SID>(giti-sources)   :<C-u>Unite giti<CR>
      nnoremap <silent> <SID>(git-status)     :<C-u>Unite giti/status<CR>
      nnoremap <silent> <SID>(git-branch)     :<C-u>Unite giti/branch<CR>
      nnoremap <silent> <SID>(git-branch_all) :<C-u>Unite giti/branch_all<CR>
      nnoremap <silent> <SID>(git-config)     :<C-u>Unite giti/config<CR>
      nnoremap <silent> <SID>(git-log)        :<C-u>Unite giti/log<CR>

      nnoremap <silent><expr> <SID>(git-log-this-file) ':<C-u>Unite giti/log:' . expand('%:p') . '<CR>'
    endif
    " }}}

" nnoremap <silent> [unite]s
"         \ :<C-u>Unite -buffer-name=files -no-split
"         \ jump_point file_point buffer_tab
"         \ file_rec:! file file/new<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  imap <buffer> jj      <Plug>(unite_insert_leave)
  "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

  imap <buffer><expr> j unite#smart_map('j', '')
  imap <buffer> <TAB>   <Plug>(unite_select_next_line)
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  imap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  imap <buffer><expr> x
          \ unite#smart_map('x', "\<Plug>(unite_quick_match_jump)")
  nmap <buffer> x     <Plug>(unite_quick_match_jump)
  nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
  nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  nnoremap <silent><buffer><expr> l
          \ unite#smart_map('l', unite#do_action('default'))

  let unite = unite#get_current_unite()
  if unite.profile_name ==# 'search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
  nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
          \ empty(unite#mappings#get_current_filters()) ?
          \ ['sorter_reverse'] : [])

  " Runs "split" action by <C-s>.
  imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction"}}}


" unite grep に agj
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
