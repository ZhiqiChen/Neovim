"add blank lines above and below cursors
function! s:BlankUp() abort
  let cmd = 'put!=repeat(nr2char(10), v:count1)|silent '']+'
  return cmd
endfunction

function! s:BlankDown() abort
  let cmd = 'put =repeat(nr2char(10), v:count1)|silent ''[-'
  return cmd
endfunction
nnoremap [<Space> :<C-U>exe <SID>BlankUp()<CR>
nnoremap ]<Space> :<C-U>exe <SID>BlankDown()<CR>


