if !exists("g:loaded_subW")
  let g:loaded_subW = 1
endif

function! SubW(...)

  if a:0 > 1
    let @/ = '\<' . a:1 . '\>'
    echom @/
    let changeTo = a:2
  else
    :norm! *
    let changeTo = a:1
  endif

  let fromOrigin = @/

  %call ExecuteSubw(l:fromOrigin, l:changeTo)
endfunction

function! SubSW(...)
  let fromOrigin = '\<' . a:1 . '\>'
  let changeTo = a:2

  %call ExecuteSubw(l:fromOrigin, l:changeTo)
endfunction

function! ExecuteSubw(fromOrigin, changeTo)
 :%call setline(line('.'), substitute(getline('.'), a:fromOrigin, a:changeTo, "g"))
endfunction

command! -nargs=*  SubW :call SubW(<f-args>)
command! -nargs=+  SubSW :call SubSW(<args>)
