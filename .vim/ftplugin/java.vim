autocmd BufWritePre * :call <SID>Test()

function! <SID>Test()
  ":echom expand('%:p:h')

endfunction
