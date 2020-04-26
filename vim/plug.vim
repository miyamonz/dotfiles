if empty(glob('~/dotfiles/vim/autoload/plug.vim'))
    !curl -fLo $HOME/dotfiles/vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" underline the word under the cursor
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


Plug 'kana/vim-textobj-user'

Plug 'Shougo/vimshell.vim', {'on': 'VimShellPop'}
nmap <silent> vs :<C-u>VimShellPop<CR>

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

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

Plug 'AndrewRadev/switch.vim', {'on': 'Switch'}
nnoremap - :<C-u>Switch<CR>

" toggle comment
Plug 'tyru/caw.vim'
nmap ; <Plug>(caw:hatpos:toggle)
vmap ; <Plug>(caw:hatpos:toggle)

" tigris is a NodeJS remote plugin for Neovim that provides async syntax highlighting for javascript (using babylon).
Plug 'billyvg/tigris.nvim', { 'do': './install.sh' }
let g:tigris#enabled = 1
let g:tigris#on_the_fly_enabled = 1

" reverse column color when insert mode
Plug 'cohama/vim-insert-linenr'
Plug 'airblade/vim-gitgutter'
set updatetime=150
" dbgp debugger xdebug
Plug 'vim-vdebug/vdebug'

runtime! plug/*.vim

call plug#end()

