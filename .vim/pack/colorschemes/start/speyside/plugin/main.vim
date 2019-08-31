if g:SpeysideLuminosity == 1
    call speyside#overrides#Dark()
elseif g:SpeysideLuminosity == 2
    "default luminence
elseif g:SpeysideLuminosity == 3
    call speyside#overrides#Light()
  else
    call <SID>_resetSpeyside()
endif


function! s:_resetSpeyside() abort
  "au! speysideOverrides
  unlet g:SpeysideColorDictionary
  "colorscheme speyside
endfunction
