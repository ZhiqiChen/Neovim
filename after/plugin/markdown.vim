" augroup markdownVimBinding
" au! markdownVimBinding
"Markdown stuff

" pressing ctrl-L to fix spelling mistakes
" autocmd FileType markdown inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

autocmd FileType markdown set wrap linebreak " adds wrapping
autocmd FileType markdown nnoremap <buffer> <c-;> /<++><Enter>"_c4l
autocmd FileType markdown inoremap <buffer> <c-;> <Esc>/<++><Enter>"_c4l
" autocmd FileType markdown inoremap <buffer> ;bf ****<Space><++><Esc>2F*i
" autocmd FileType markdown inoremap <buffer> ;it __<Space><++><Esc>F_i
" autocmd FileType markdown inoremap <buffer> ;hr [](<++>)<Space><++><Esc>F]i
" autocmd FileType markdown inoremap <buffer> ;im ![](<++>)<Space><++><Esc>F]i
" autocmd FileType markdown nnoremap j gj
" autocmd FileType markdown nnoremap k gk
" autocmd FileType markdown inoremap <Tab> <c-t>
" autocmd FileType markdown inoremap <s-tab> <c-d>

" lists
" function! s:MarkdownOrderedList(rowNum) abort
"     if a:rowNum > 0
"         let outputTextList = []
"         for i in range(1,a:rowNum,+1)
"             call add(outputTextList, i .. ")")
"         endfor
"         call append(line("."), outputTextList)
"     else
"         echom "Please give numbers bigger than 0."
"     endif
"     return 1
" endfunction
" command! -buffer -nargs=1 CreateMarkdownList call <SID>MarkdownOrderedList(<args>)
" autocmd FileType markdown nnoremap <buffer>;ol <Cmd>execute "CreateMarkdownList " . expand("<cword>")<CR>

"tables

function! s:MarkdownTable(columnNum, rowNum) abort
    if a:columnNum > 0 && a:rowNum > 0
        let tableItem=" <++> \|"
        let row = "|" .. repeat(tableItem, a:columnNum)
        " #row number is increased by 1 for header row and add
        " row for separating header and content cells
        let outputTextList = repeat([row], a:rowNum + 1)
        let headerSeperatingRow = '|' .. repeat(' ---- |', a:columnNum)
        call insert(outputTextList, headerSeperatingRow, 1)
        call append(line("."), outputTextList)
    else
        echom "Please give numbers bigger than 0."
    endif
    return 1
endfunction
command! -buffer -nargs=+ CreateMarkdownTable call <SID>MarkdownTable(<f-args>)
" autocmd FileType markdown nnoremap <buffer>;ta <Cmd>:>execute CommandCreateMarkdownTable<Space><CR>

" Math
" autocmd FileType markdown inoremap <buffer> ;eq $$<Space><++><Esc>2T$i
" autocmd FileType markdown inoremap <buffer> ;eeq $$<CR><CR>$$<CR><CR><++><Esc>3kA
" autocmd FileType markdown inoremap <buffer> ;ra {\rightarrow}
" autocmd FileType markdown inoremap <buffer> ;la {\leftarrow}
" autocmd FileType markdown inoremap <buffer> ;lra {\leftrightarrow}
" autocmd FileType markdown inoremap <buffer> ;fa {\forall}
" autocmd FileType markdown inoremap <buffer> ;= &=<Space>

" autocmd FileType markdown inoremap <buffer> ;fr \frac{}{<++>}<++><Esc>T{;i
" autocmd FileType markdown inoremap <buffer> ;sup ^{}<++><Esc>T{i
" autocmd FileType markdown inoremap <buffer> ;sub _{}<++><Esc>T{i
" autocmd FileType markdown inoremap <buffer> ;al \begin{align*}<Enter><Enter>\end{align*}<Enter><Enter><++><Esc>3kA
" autocmd FileType markdown inoremap <buffer> ;ma \begin{bmatrix*}<Enter><Enter>\end{bmatrix*}<Enter><Enter><++><Esc>3kA


" Auto bullet points Lua, https://gist.github.com/gaoDean/288d01dfe64da66569fb6615c767e081

lua <<EOF
autolist = function()
 	local preceding_line = vim.fn.getline(vim.fn.line(".") - 1)
     if preceding_line:match("^%s*%d+%.%s.") then
 		local list_index = preceding_line:match("%d+")
 	    print(list_index .. "t")
 		vim.fn.setline(".", preceding_line:match("^%s*") .. list_index + 1 .. ". ")
 		vim.cmd([[execute "normal \<esc>A\<space>"]])
 	elseif preceding_line:match("^%s*%d+%.%s$") then
 		vim.fn.setline(vim.fn.line(".") - 1, "")
 	elseif preceding_line:match("^%s*[-+*]") and #preceding_line:match("[-+*].*") == 1 then
 		vim.fn.setline(vim.fn.line(".") - 1, "")
 		vim.fn.setline(".", "")
	end
end
function map(mode, keys, output)
	vim.api.nvim_set_keymap(mode, keys, output, { noremap = true, silent = true})
end

function imap(keys, output)
	map("i", keys, output)
end

function au(evt, pat, cmd) -- (string|table), (string|table), (string)
	vim.api.nvim_create_autocmd(evt, { pattern = pat, command = cmd, })
end
imap("<cr>", [[<cr><cmd>lua autolist()<cr>]])

au("FileType", "markdown", "setl comments=b:*,b:-,b:+,n:>")
au("FileType", "markdown", "setl formatoptions+=r")
EOF

" augroup end
