Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

let g:lsp_async_completion = 1

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_popup_delay = 150
let g:lsp_text_edit_enabled = 1

Plug 'tsuyoshicho/vim-efm-langserver-settings', { 'depends': 'ale' }
