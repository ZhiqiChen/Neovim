let g:livepreview_cursorhold_recompile = 0      "prevent recompiling on cursor holds only when written to disk
autocmd FileType tex nnoremap <buffer> <F4> :w<CR>:LLPStartPreview<CR>

" Nav
autocmd FileType tex nnoremap <buffer> <C-Space> /<++><Enter>"_c4l
autocmd FileType tex inoremap <buffer> <C-Space> <Esc>/<++><Enter>"_c4l

" Basics

" Text
autocmd FileType tex inoremap <buffer> ;bf \textbf{}<++><Esc>T{i
autocmd FileType tex inoremap <buffer> ;it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap <buffer> ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap <buffer> ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap <buffer> ;li <Enter>\item<Space>
autocmd FileType tex inoremap <buffer> ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <buffer> ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <buffer> ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <buffer> ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <buffer> ;beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap <buffer> ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap <buffer> ;up /usepackage<Enter>o\usepackage{}<Esc>i


" Math
autocmd FileType tex inoremap <buffer> ;eq $$<Space><++><Esc>2T$i
autocmd FileType tex inoremap <buffer> ;eeq $$<CR><CR>$$<CR><CR><++><Esc>3kA
autocmd FileType tex inoremap <buffer> ;ra {\rightarrow}
autocmd FileType tex inoremap <buffer> ;la {\leftarrow}
autocmd FileType tex inoremap <buffer> ;lra {\leftrightarrow}
autocmd FileType tex inoremap <buffer> ;fa {\forall}
autocmd FileType tex inoremap <buffer> ;= &=<Space>

autocmd FileType tex inoremap <buffer> ;fr \frac{}{<++>}<++><Esc>T{;i
autocmd FileType tex inoremap <buffer> ;sup ^{}<++><Esc>T{i
autocmd FileType tex inoremap <buffer> ;sub _{}<++><Esc>T{i
autocmd FileType tex inoremap <buffer> ;al \begin{align*}<Enter><Enter>\end{align*}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap <buffer> ;ma \begin{bmatrix*}<Enter><Enter>\end{bmatrix*}<Enter><Enter><++><Esc>3kA

