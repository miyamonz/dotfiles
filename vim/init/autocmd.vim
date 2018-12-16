" vimにはautocmdといって、特定のイベント発生にフックができる
" いかし、登録は多重にできるので、
" vimrcを何度もsourceした場合に、意図せず多重登録される時がある
augroup MyAutoCmd
    autocmd!
augroup end
