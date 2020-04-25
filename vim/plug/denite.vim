if has('nvim')
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/denite.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
           \ ['git', 'ls-files', '-co', '--exclude-standard'])
nnoremap [denite] <Nop>
nmap <Space> [denite]
nnoremap <silent> [denite]f  :<C-u>Denite file/rec/git file:new<CR>
nnoremap <silent> [denite]b  :<C-u>Denite buffer<CR>
nnoremap <silent> [denite]g  :<C-u>Denite file/rec/git<CR>
nnoremap <silent> [denite]o  :<C-u>Denite outline<CR>
nnoremap <silent> [denite]mr :<C-u>Denite file_mru<CR>
