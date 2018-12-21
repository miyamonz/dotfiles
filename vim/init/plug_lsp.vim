Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

" let g:lsp_log_verbose = 1
" let g:lsp_log_file = 'vim-lsp.log'

if executable('clangd')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': {server_info->['clangd']},
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                \ })
endif

if executable('golsp')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'go-lang',
                \ 'cmd': {server_info->['golsp', '-mode', 'stdio']},
                \ 'whitelist': ['go'],
                \ })
endif

let g:lsp_async_completion = 1
