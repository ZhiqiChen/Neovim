autocmd FileType python nnoremap <buffer> <F4> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
