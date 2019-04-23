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

Plug 'digitaltoad/vim-pug', {'for': 'pug'}
Plug 'kovisoft/slimv', {'for': 'lisp'}

Plug 'wlangstroth/vim-racket', {'for': 'scheme'}

Plug 'jwalton512/vim-blade', {'for': 'php'}
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'kristijanhusak/deoplete-phpactor', {'for': 'php'}
" 画面を分割して定義元へのジャンプ
function! DefinitionJumpWithPhpactor()
    split
    call phpactor#GotoDefinition()
endfunction


" useの補完
nmap <silent><Leader>u      :<C-u>call phpactor#UseAdd()<CR>
" コンテキストメニューの起動(カーソル下のクラスやメンバに対して実行可能な選択肢を表示してくれます)
nmap <silent><Leader>mm     :<C-u>call phpactor#ContextMenu()<CR>
" ナビゲーションメニューの起動(クラスの参照元を列挙したり、他ファイルへのジャンプなど)
nmap <silent><Leader>nn     :<C-u>call phpactor#Navigate()<CR>
" カーソル下のクラスやメンバの定義元にジャンプ
nmap <silent><Leader>o      :<C-u>call phpactor#GotoDefinition()<CR>
" 編集中のクラスに対し各種の変更を加える(コンストラクタ補完、インタフェース実装など)
nmap <silent><Leader>tt     :<C-u>call phpactor#Transform()<CR>
" 新しいクラスを生成する(編集中のファイルに)
nmap <silent><Leader>cc     :<C-u>call phpactor#ClassNew()<CR>
" 選択した範囲を変数に抽出する
nmap <silent><Leader>ee     :<C-u>call phpactor#ExtractExpression(v:false)<CR>
" 選択した範囲を変数に抽出する
vmap <silent><Leader>ee     :<C-u>call phpactor#ExtractExpression(v:true)<CR>
" 選択した範囲を新たなメソッドとして抽出する
vmap <silent><Leader>em     :<C-u>call phpactor#ExtractMethod()<CR>
" split → jump
nmap <silent>gd :<C-u>call DefinitionJumpWithPhpactor()<CR>
" カーソル下のクラスや変数の情報を表示する
" 他のエディタで、マウスカーソルをおいたときに表示されるポップアップなどに相当
vmap <silent><Leader>hh     :<C-u>call phpactor#Hover()<CR>
