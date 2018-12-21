if empty(glob('~/dotfiles/vim/autoload/plug.vim'))
    !curl -fLo $HOME/dotfiles/vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
if executable('clangd')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': {server_info->['clangd']},
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                \ })
endif

if executable('golsp')
    augroup LspGp
        au!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'go-lang',
                    \ 'cmd': {server_info->['golsp', '-mode', 'stdio']},
                    \ 'whitelist': ['go'],
                    \ })
        autocmd FileType go setlocal omnifunc=lsp#complete
    augroup END
endif

Plug 'itchyny/vim-cursorword'
Plug 'iCyMind/NeoSolarized'
set background=dark
" colorscheme 設定は source 後に行う必要があるので確実に読まれている VimEnter のタイミングで行う。
" 但し Colorscheme イベントの発生が抑制されないよう nessed を付ける。
au MyAutoCmd VimEnter * nested colorscheme NeoSolarized

Plug 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/  <Plug>(incsearch-stay)

Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

Plug 'osyo-manga/vim-operator-stay-cursor'
Plug 'kana/vim-operator-replace'
map R <Plug>(operator-replace)

Plug 'kana/vim-textobj-user'

" quickrun, vimshell
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'thinca/vim-quickrun'
Plug 'Shougo/vimshell.vim', {'on': 'VimShellPop'}
nmap <silent> vs :<C-u>VimShellPop<CR>


Plug 'kana/vim-submode'
au MyAutoCmd VimEnter * call s:register_submode()
function! s:register_submode() 
    call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
    call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
    call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
    call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
    call submode#map('bufmove', 'n', '', '>', '<C-w>>')
    call submode#map('bufmove', 'n', '', '<', '<C-w><')
    call submode#map('bufmove', 'n', '', '+', '<C-w>+')
    call submode#map('bufmove', 'n', '', '-', '<C-w>-')
endfunction

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
let g:indent_guides_exclude_filetypes=['help', 'man']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray ctermbg=248
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=240
let g:indent_guides_guide_size=3

Plug 'itchyny/lightline.vim'

Plug 'w0rp/ale'
let g:ale_sign_column_always = 1

let g:ale_fixers = {
            \ 'javascript': ['prettier'],
            \ 'typescript': ['prettier'],
            \ 'html': ['prettier'],
            \ 'vue': ['prettier']
            \ }
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 

Plug 'itchyny/vim-parenmatch'
let g:loaded_matchparen = 1

Plug 'hotwatermorning/auto-git-diff'
let g:auto_git_diff_show_window_at_right=1

Plug 'tpope/vim-obsession'
Plug 'itchyny/dictionary.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/neco-vim', {'for': 'vim'}
Plug 'ujihisa/neco-look'
Plug 'jiangmiao/auto-pairs'
au Filetype markdown let b:AutoPairs = {'(':')','{':'}',"'":"'",'"':'"', '`':'`'}

Plug 'mattn/emmet-vim', {'for': ['html', 'vue']}
let g:user_emmet_leader_key = '<C-e>'
let g:user_emmet_settings = {
            \'variables':{
            \       'lang' : 'ja'
            \}
            \}
Plug 'AndrewRadev/switch.vim' | 
nnoremap - :<C-u>Switch<CR>

Plug 'tyru/caw.vim'
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)

Plug 'rhysd/vim-gfm-syntax', { 'for': 'md' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'wavded/vim-stylus', {'for': 'stylus'}
Plug '2072/PHP-Indenting-for-VIm', {'for': 'php'}
Plug 'billyvg/tigris.nvim', { 'do': './install.sh' }
let g:tigris#enabled = 1
let g:tigris#on_the_fly_enabled = 1

Plug 'sophacles/vim-processing', {'for': 'processing'}

Plug 'slim-template/vim-slim', {'for': 'slim'}
Plug 'tikhomirov/vim-glsl', {'for': 'glsl'}
Plug 'ElmCast/elm-vim', {'for': 'elm'}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}

Plug 'cohama/vim-insert-linenr'
Plug 'airblade/vim-gitgutter'
set updatetime=150
call plug#end()

