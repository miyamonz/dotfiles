Plug 'Shougo/neco-vim', {'for': 'vim'}

Plug 'rhysd/vim-gfm-syntax', { 'for': 'md' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'sophacles/vim-processing', {'for': 'processing'}

Plug 'tikhomirov/vim-glsl', {'for': 'glsl'}

Plug 'ElmCast/elm-vim', {'for': 'elm'}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

Plug 'leafgarland/typescript-vim', {'for': ['typescript']}
Plug 'peitalin/vim-jsx-typescript', {'for': ['typescript']}

Plug 'posva/vim-vue', {'for': 'vue'}

" php
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug '2072/PHP-Indenting-for-VIm', {'for': 'php'}
Plug 'jwalton512/vim-blade', {'for': 'php'}

Plug 'digitaltoad/vim-pug', {'for': 'pug'}
Plug 'wavded/vim-stylus', {'for': 'stylus'}
Plug 'slim-template/vim-slim', {'for': 'slim'}

Plug 'kovisoft/slimv', {'for': 'lisp'}
Plug 'wlangstroth/vim-racket', {'for': 'scheme'}


Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'hashivim/vim-terraform', {'for': ['tf', 'tfvars']}
let g:terraform_fmt_on_save = 1
