if empty(glob('~/dotfiles/vim/autoload/plug.vim'))
    !curl -fLo $HOME/dotfiles/vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'


runtime! init/plug_asyncomplete.vim
runtime! init/plug_lsp.vim

Plug 'itchyny/vim-cursorword'
Plug 'iCyMind/NeoSolarized'
set background=dark
" colorscheme 設定は source 後に行う必要があるので確実に読まれている VimEnter のタイミングで行う。
" 但し Colorscheme イベントの発生が抑制されないよう nessed を付ける。
au MyAutoCmd VimEnter * nested colorscheme NeoSolarized

Plug 'haya14busa/incsearch.vim', { 'on': '<Plug>(incsearch-forward)' }
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/  <Plug>(incsearch-stay)

runtime! init/plug_op.vim

Plug 'kana/vim-textobj-user'

"vimproc is required to quickrun, vimshell
Plug 'Shougo/vimproc.vim', {'do': 'make'}
" plugin-settings/quickrun.vim
Plug 'thinca/vim-quickrun', {'on': 'QuickRun'} 
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
            \ 'php': ['php_cs_fixer'],
            \ 'javascript': ['prettier'],
            \ 'typescript': ['prettier'],
            \ 'html': ['prettier'],
            \ 'scss': ['prettier'],
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

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-obsession'
Plug 'editorconfig/editorconfig-vim'

Plug 'ujihisa/neco-look'
Plug 'jiangmiao/auto-pairs'
au Filetype markdown let b:AutoPairs = {'(':')','{':'}',"'":"'",'"':'"', '`':'`'}

runtime! init/plug_ft.vim

Plug 'AndrewRadev/switch.vim', {'on': 'Switch'}
nnoremap - :<C-u>Switch<CR>

Plug 'tyru/caw.vim'
nmap ; <Plug>(caw:hatpos:toggle)
vmap ; <Plug>(caw:hatpos:toggle)

Plug 'billyvg/tigris.nvim', { 'do': './install.sh' }
let g:tigris#enabled = 1
let g:tigris#on_the_fly_enabled = 1


Plug 'cohama/vim-insert-linenr'
Plug 'airblade/vim-gitgutter'
set updatetime=150
call plug#end()

