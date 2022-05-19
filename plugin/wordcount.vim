if exists("g:loaded_wordcount_vim")
  finish
endif
let g:loaded_wordcount_vim = 1

" Word count operator
function! s:wordCountOperator(type)
  if a:type ==# 'v' || a:type ==# 'V' || a:type ==# ''
    exe "'<,'>Tap wc -w"
  elseif a:type ==# 'line'
    exe "'[,']Tap wc -w"
  elseif type(a:type) ==# v:t_number
    exe a:type."Tap wc -w"
  else
    exe "`[,`]Tap wc -w"
  endif
endfunction

nnoremap <silent> gwc :set operatorfunc=<sid>wordCountOperator<cr>g@
vnoremap <silent> gwc :<c-u>call  <sid>wordCountOperator(visualmode())<cr>

