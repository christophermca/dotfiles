function! speyside#main#UpdateLuminance() abort
  if g:SpeysideLuminosity >= 2
    let g:SpeysideLuminosity = 0
    call <SID>_resetSpeyside()
  else
    let g:SpeysideLuminosity += 1
  endif


  if g:SpeysideLuminosity == 1
    call speyside#overrides#Dark()
  elseif g:SpeysideLuminosity == 2
    call speyside#overrides#Light()
  endif
endfunction

function! s:_resetSpeyside() abort
  au! speysideOverrides
  colorscheme speyside
endfunction
