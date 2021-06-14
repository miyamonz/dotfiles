autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

Plug 'leafgarland/typescript-vim', {'for': ['typescript']}
Plug 'peitalin/vim-jsx-typescript', {'for': ['typescript']}

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
