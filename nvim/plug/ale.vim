Plug 'dense-analysis/ale'
let g:ale_sign_column_always = 1
let g:ale_linters = {
            \'javascript': ['eslint'],
            \'javascriptreact': ['eslint'],
            \'typescript': ['eslint'],
            \'typescriptreact': ['eslint'],
            \ 'python': ['flake8', 'mypy', 'pylint', 'pyright'],
            \}
let g:ale_fixers = {
            \ 'php': ['php_cs_fixer'],
            \ 'javascript': ['prettier'],
            \ 'javascriptreact': ['prettier'],
            \ 'typescript': ['prettier'],
            \ 'typescriptreact': ['prettier'],
            \ 'html': ['prettier'],
            \ 'scss': ['prettier'],
            \ 'vue': ['prettier'],
            \ 'python': ['autopep8', 'black'],
            \ }
let g:ale_fix_on_save = 1
