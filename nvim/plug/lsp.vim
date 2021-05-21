Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
autocmd FileType python,go,cpp,typescript nmap gd <plug>(lsp-definition)

Plug 'ryanolsonx/vim-lsp-typescript'
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': [
            \'javascript',
            \'javascript.jsx',
            \'javascriptreact',
            \'typescript',
            \'typescript.tsx',
            \'typescriptreact'
            \],
        \ })
endif

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

if executable('docker-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'docker-langserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
        \ 'whitelist': ['dockerfile'],
        \ })
endif

" npm i -g vue-language-server
if executable('vls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'vue-language-server',
        \ 'cmd': {server_info->['vls']},
        \ 'whitelist': ['vue'],
        \ })
endif

Plug 'antew/vim-elm-language-server'
if executable('elm-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'elm-language-server',
        \ 'cmd': {server_info->['elm-language-server']},
        \ 'whitelist': ['elm'],
        \ })
endif

" haskell
if executable('hie')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'hie',
        \ 'cmd': {server_info->['hie']},
        \ 'whitelist': ['haskell'],
        \ })
endif

let g:lsp_async_completion = 1
