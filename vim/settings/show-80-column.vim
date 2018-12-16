" 80文字で色を付ける
execute "set colorcolumn=" . join(range(81, 999), ',')
hi ColorColumn ctermbg=235 guibg=#2c2d27 


" 上の設定は、syntaxの列が多いと重くなるらしい
" syntaxをつけるcolの最大を200行までにしておくと軽くできる
set synmaxcol=200
