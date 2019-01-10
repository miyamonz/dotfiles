Plug 'Shougo/neco-vim', {'for': 'vim'}

Plug 'mattn/emmet-vim', {'for': ['html', 'vue']}
let g:user_emmet_leader_key = '<C-e>'
let g:user_emmet_settings = {
            \'variables':{
            \       'lang' : 'ja'
            \}
            \}
Plug 'rhysd/vim-gfm-syntax', { 'for': 'md' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'wavded/vim-stylus', {'for': 'stylus'}
Plug 'sophacles/vim-processing', {'for': 'processing'}

Plug 'slim-template/vim-slim', {'for': 'slim'}
Plug 'tikhomirov/vim-glsl', {'for': 'glsl'}
Plug 'ElmCast/elm-vim', {'for': 'elm'}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}

Plug 'posva/vim-vue', {'for': 'vue'}

Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug '2072/PHP-Indenting-for-VIm', {'for': 'php'}
