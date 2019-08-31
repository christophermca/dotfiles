function! speyside#main#UpdateLuminance() abort

  let g:SpeysideLuminosity = input('set Lumenince [1-3]: ')

  if g:SpeysideLuminosity == 1
      call speyside#overrides#Dark()
  elseif g:SpeysideLuminosity == 2
      "default luminence
      call <SID>_resetSpeyside()
  elseif g:SpeysideLuminosity == 3
      call speyside#overrides#Light()
  endif

endfunction

function! s:_resetSpeyside() abort
  "au! speysideOverrides
  unlet g:SpeysideColorDictionary
  colorscheme speyside
endfunction
