if &compatible
    set nocompatible
endif

set runtimepath+=$HOME/dotfiles/vim/dein/repos/github.com/Shougo/dein.vim/
let s:dein_dir=$HOME.'/dotfiles/vim/dein'

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir) 
    call dein#load_toml(s:dein_dir . '/dein.toml', {'lazy': 0})
    call dein#load_toml(s:dein_dir . '/deinlazy.toml',        {'lazy': 1})
    call dein#load_toml(s:dein_dir . '/lazy-syntax.toml',     {'lazy': 1})
    call dein#load_toml(s:dein_dir . '/lazy-completion.toml', {'lazy': 1})
    call dein#load_toml(s:dein_dir . '/lazy-view.toml',       {'lazy': 1})
    call dein#load_toml(s:dein_dir . '/lazy-input.toml',      {'lazy': 1})
    call dein#load_toml(s:dein_dir . '/lazy-unite.toml', {'lazy': 1})
    if has('nvim')
        call dein#load_toml(s:dein_dir . '/nvim.toml', {'lazy': 0})
    else
        call dein#load_toml(s:dein_dir . '/vim8.toml', {'lazy': 0})
    endif
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif
