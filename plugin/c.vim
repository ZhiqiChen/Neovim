" For C compiling
" autocmd FileType c nnoremap <F4> :make!<CR>
" autocmd FileType c nnoremap <F5> :!./a.out<CR>
autocmd FileType c nnoremap <buffer> <F4> :w<CR>:!gcc %<CR>
autocmd FileType c nnoremap <buffer> <F5> :!./a.out<CR>
"autocmd FileType c set makeprg=make\ -C\ ../build\ -j9
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END
