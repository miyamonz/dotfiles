" 行数を表示しない :10とかで飛べばいいし、右下に表示されている
set nonumber

" bufferを閉じても直ちに消さずに隠しているだけになる
set hidden

let g:solarized_termcolors=256

noremap <Space>h ^
noremap <Space>l $
nnoremap Y y$
nnoremap gF :vertical wincmd f<CR>

