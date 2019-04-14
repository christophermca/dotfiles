  let s:ColorDictionary = g:SpeysideColorDictionary
  function! speyside#overrides#Dark() abort
  augroup speysideOverrides
    autocmd!
    call speyside#dictionaries#dark#init()
    colorscheme speyside

    "call <SID>_exectuteOverride(l:speysideOverridesDict)

  augroup END
endfunction

function! speyside#overrides#Light() abort
  augroup speysideOverrides
    autocmd!
    call speyside#dictionaries#light#init()
    colorscheme speyside
    "call <SID>_exectuteOverride(l:speysideOverridesDict)

  augroup END
endfunction

function! s:_exectuteOverride(overrides) abort
  let new_highlight_color = ''

  for k in a:overrides)
    let l:name = k
    let override = a:overrides[k]
    if has("gui_running")
      let s:mode = 'gui'
    else
      let s:mode = 'cterm'
    endif
    if has_key(override, 'fg')
      let fg = <SID>_extractColor(override.fg)
      let new_highlight_color = new_highlight_color . s:mode . "fg=" . l:fg . ' '
    endif
    if has_key(override, 'bg')
      let bg = <SID>_extractColor(override.bg)
      let new_highlight_color = new_highlight_color . s:mode . "bg=" . l:bg . ' '
    endif
    if has_key(override, 'styl')
      let styl = override.styl
      let new_highlight_color = new_highlight_color . s:mode . '=' .  styl . ' '
    endif

    exe 'hi ' . l:name . ' ' . l:new_highlight_color

  endfor

endfunction

function! s:_extractColor(color)
  if type(a:color) == v:t_list
    let colorName = a:color[0]

    if len(a:color) > 1
      let idx = a:color[1]
      return get(s:ColorDictionary, colorName)[idx]
    else
      return get(s:ColorDictionary, colorName)
    endif
  endif

  return a:color

endfunction
