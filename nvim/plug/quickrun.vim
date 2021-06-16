"vimproc is required to quickrun, vimshell
Plug 'Shougo/vimproc.vim', {'do': 'make'}

Plug 'thinca/vim-quickrun', {'on': 'QuickRun'} 

let g:quickrun_config = get(g:, 'quickrun_config', {})

" quickrunのランナーにvimprocを使用する
" 成功時はバッファへ
" エラー時はquickfixへ出力
let g:quickrun_config._ = {
            \   'runner': 'vimproc',
            \   'runner/vimproc/updatetime' : 60,
            \}
" shopt -s extglob
let g:quickrun_config['go'] =  {
            \     'args': '*.go',
            \     'exec': 'go run %a'
            \ }
let g:quickrun_config['processing'] =  {
            \     'command': 'processing-java',
            \     'exec': '%c --sketch=%s:p:h/ --output=~/Documents/Processing/output --force --run',
            \ }

let g:quickrun_config['plantuml'] = {
            \  'command': 'plantuml'
            \, 'exec': ['%c %s', 'open %s:p:r.png']
            \, 'outputter': 'null'
            \}

"quickrunでgo testを走らせる
autocmd BufRead,BufNewFile *_test.go set filetype=go.test
let g:quickrun_config['go.test'] = {
            \'command' : 'go', 
            \'exec' : ['%c test']
            \}

" rust
autocmd BufNewFile,BufRead *.crs setf rust
autocmd BufNewFile,BufRead *.rs  let g:quickrun_config.rust = {'exec' : 'cargo run'}
autocmd BufNewFile,BufRead *.crs let g:quickrun_config.rust = {'exec' : 'cargo script %s -- %a'}


nnoremap <Leader>r :w<CR>:QuickRun <CR>
