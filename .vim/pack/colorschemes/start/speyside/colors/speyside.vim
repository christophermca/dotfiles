" Author: 'Christopher MCA'
" Site: https:/githubcom/christophermca/speyside
" Version: 000.3

"{{{ Colorscheme Setup

highlight clear
if exists("syntax_on")
  syntax reset
endif

"set background = dark
let colors_name = "speyside"

if !exists('g:SpeysideColorDictionary')
  exe 'runtime' 'START' '/colors/colorDictionary.vim'
  let s:CoDi = g:SpeysideColorDictionary
endif

if !exists('g:SpeysideLuminosity')
  if exists('g:SpeysideDefaultLuminence')
    let g:SpeysideLuminosity = g:SpeysideDefaultLuminence
  else
    let g:SpeysideLuminosity = 2 "sets to NORMAL
  endif
endif

" Mode {{{
if has("gui_running")
"TODO add gui values
else
  let s:mode = 'cterm'
endif
"}}}
"}}}
 "Font Styles {{{
  let s:b = 'bold'
  let s:i = 'italic'
  let s:in = 'inverse'
  let s:none = 'NONE'
  let s:r = 'reverse'
  let s:s = 'standout'
  let s:u = 'underline'
  "
  "Build Style Strings {{{
    exe "let s:sty_b = ' " s:mode."=".s:b"'"
    exe "let s:sty_i = ' " s:mode."=".s:i"'"
    exe "let s:sty_in = ' " s:mode."=".s:in"'"
    exe "let s:sty_n = ' " s:mode."=".s:none"'"
    exe "let s:sty_r = ' " s:mode."=".s:r"'"
    exe "let s:sty_s = ' " s:mode."=".s:s"'"
    exe "let s:sty_su = ' " s:mode."=".s:s .s:u"'"
    exe "let s:sty_u = ' " s:mode."=".s:u"'"
  "}}}
"}}}
"Color Palette {{{
" GUI {{{
"}}}
"Terminal {{{

  "}}}
"}}}
"{{{ Build Color Strings
"special {{{
exe "let s:fg_NONE = ' "s:mode."fg=".s:none ."'"
exe "let s:bg_NONE = ' "s:mode."bg=".s:none ."'"

exe "let s:fg_diff_add = ' "s:mode."fg=". get(s:CoDi['diffColors'], 0) ."'"
exe "let s:bg_diff_add = ' "s:mode."bg=". get(s:CoDi['diffColors'], 1) ."'"

exe "let s:fg_diff_del = ' "s:mode."fg=". get(s:CoDi['diffColors'], 2) ."'"
exe "let s:bg_diff_del = ' "s:mode."bg=". get(s:CoDi['diffColors'], 3) ."'"

exe "let s:fg_difftxt = ' "s:mode."fg=". get(s:CoDi['diffColors'], 4) ."'"
exe "let s:bg_difftxt = ' "s:mode."bg=". get(s:CoDi['colors'], 4) ."'"

exe "let s:fg_spell_bad = ' "s:mode."fg=". get(s:CoDi['diffColors'], 2) ."'"
exe "let s:bg_spell_bad = ' "s:mode."bg=". get(s:CoDi['diffColors'], 3) ."'"

exe "let s:fg_spell_cap = ' "s:mode."fg=". get(s:CoDi['diffColors'], 0) ."'"
exe "let s:bg_spell_cap = ' "s:mode."bg=". get(s:CoDi['diffColors'], 1) ."'"

exe "let s:bg_spell_local = ' "s:mode."bg=". get(s:CoDi['colors'], 11) ."'"

exe "let s:bg_spell_rare = ' "s:mode."bg=". get(s:CoDi['colors'], 24) . "'"
"}}}
"
"base {{{
exe "let s:bg_norm = ' "s:mode."bg=" . get(s:CoDi['colors'], 0) ."'"
exe "let s:fg_norm = ' "s:mode."fg=" . get(s:CoDi['colors'], 3) ."'"

exe "let s:fg_white = ' "s:mode . "fg=white" . "'"
exe "let s:bg_white = ' "s:mode . "bg=white" . "'"

exe "let s:fg_lineNR = ' "s:mode."fg=" . get(s:CoDi['colors'], 9) ."'"
exe "let s:bg_lineNR = ' "s:mode."bg=" . get(s:CoDi['colors'], 8) ."'"

exe "let s:fg_black = ' "s:mode."fg=black" . "'"
exe "let s:bg_black = ' "s:mode."bg=black" . "'"

exe "let s:fg_dkGray = ' "s:mode."fg=" . get(s:CoDi['colors'], 0) ."'"
exe "let s:bg_dkGray = ' "s:mode."bg=" . get(s:CoDi['colors'], 0) ."'"

exe "let s:fg_dkGray1 = ' "s:mode."fg=" . get(s:CoDi['colors'], 4) ."'"
exe "let s:bg_dkGray1 = ' "s:mode."bg=" . get(s:CoDi['colors'], 4) ."'"

exe "let s:fg_gray = ' "s:mode."fg=" . get(s:CoDi['colors'], 5) ."'"
exe "let s:bg_gray = ' "s:mode."bg=" . get(s:CoDi['colors'], 5) ."'"

exe "let s:fg_gray2 = ' "s:mode."fg=" . get(s:CoDi['colors'], 0) ."'"
exe "let s:bg_gray2 = ' "s:mode."bg=" . get(s:CoDi['colors'], 0) ."'"
" }}}

"Blue {{{
exe "let s:fg_ltBlue0 = ' "s:mode."fg=" . get(s:CoDi['colors'], 16) ."'"
exe "let s:bg_ltBlue0 = ' "s:mode."bg=" . get(s:CoDi['colors'], 16) ."'"

exe "let s:fg_ltBlue1 = ' "s:mode."fg=" . get(s:CoDi['colors'], 17) ."'"
exe "let s:bg_ltBlue1 = ' "s:mode."bg=" . get(s:CoDi['colors'], 17) ."'"

exe "let s:fg_ltBlue3 = ' "s:mode."fg=" . get(s:CoDi['colors'], 18) ."'"
exe "let s:bg_ltBlue3 = ' "s:mode."bg=" . get(s:CoDi['colors'], 18) ."'"

exe "let s:fg_ltBlue4 = ' "s:mode."fg=" . get(s:CoDi['colors'], 19) ."'"
exe "let s:bg_ltBlue4 = ' "s:mode."bg=" . get(s:CoDi['colors'], 19) ."'"

exe "let s:fg_blue1 = ' "s:mode."fg=" . get(s:CoDi['colors'], 21) ."'"
exe "let s:bg_blue1 = ' "s:mode."bg=" . get(s:CoDi['colors'], 21) ."'"

exe "let s:fg_blue2 = ' "s:mode."fg=" . get(s:CoDi['colors'], 22) ."'"
exe "let s:bg_blue2 = ' "s:mode."bg=" . get(s:CoDi['colors'], 22) ."'"

exe "let s:fg_dkBlue = ' "s:mode."fg=" . get(s:CoDi['colors'], 20)  ."'"
exe "let s:bg_dkBlue = ' "s:mode."bg=" . get(s:CoDi['colors'], 20) ."'"
"}}}

"Green {{{
exe "let s:fg_green1 = ' "s:mode."fg=" . get(s:CoDi['colors'], 12) ."'"
exe "let s:bg_green1 = ' "s:mode."bg=" . get(s:CoDi['colors'], 12) ."'"

exe "let s:fg_green2 = ' "s:mode."fg=" . get(s:CoDi['colors'], 13) ."'"
exe "let s:bg_green2 = ' "s:mode."bg=" . get(s:CoDi['colors'], 13) ."'"

exe "let s:fg_green3 = ' "s:mode."fg=" . get(s:CoDi['colors'], 15) ."'"
exe "let s:bg_green3 = ' "s:mode."bg=" . get(s:CoDi['colors'], 15) ."'"

exe "let s:fg_green5 = ' "s:mode."fg=" . get(s:CoDi['colors'], 14) ."'"
exe "let s:bg_green5 = ' "s:mode."bg=" . get(s:CoDi['colors'], 14) ."'"

exe "let s:fg_statusLine_green = ' "s:mode."fg=". get(s:CoDi['colors'], 10) ."'"
exe "let s:bg_statusLine_green = ' "s:mode."bg=". get(s:CoDi['colors'], 10) ."'"

"}}}

"Purple {{{
exe "let s:fg_purple_todo = ' "s:mode."fg=" . get(s:CoDi['colors'], 7) ."'"
exe "let s:bg_purple_todo = ' "s:mode."bg=" . get(s:CoDi['colors'], 7) ."'"

exe "let s:fg_purple_comment = ' "s:mode."fg=" . get(s:CoDi['colors'], 6) ."'"
exe "let s:bg_purple_comment = ' "s:mode."bg=" . get(s:CoDi['colors'], 6) ."'"
"}}}

"Warm {{{
exe "let s:fg_warm0 = ' "s:mode."fg=" . get(s:CoDi['colors'], 23) ."'"
exe "let s:bg_warm0 = ' "s:mode."bg=" . get(s:CoDi['colors'], 23)."'"

exe "let s:fg_warm1 = ' "s:mode."fg=" . get(s:CoDi['colors'], 24) ."'"
exe "let s:bg_warm1 = ' "s:mode."bg=" . get(s:CoDi['colors'], 24)."'"

exe "let s:fg_warm2 = ' "s:mode."fg=" . get(s:CoDi['colors'], 25) ."'"
exe "let s:bg_warm2 = ' "s:mode."bg=" . get(s:CoDi['colors'], 25)."'"

exe "let s:fg_warm4 = ' "s:mode."fg=" . get(s:CoDi['colors'], 26) ."'"
exe "let s:bg_warm4 = ' "s:mode."bg=" . get(s:CoDi['colors'], 26) ."'"

exe "let s:fg_warm5 = ' "s:mode."fg=" . get(s:CoDi['colors'], 27) ."'"
exe "let s:bg_warm5 = ' "s:mode."bg=" . get(s:CoDi['colors'], 27) ."'"
exe "let s:fg_warm6 = ' "s:mode."fg=" . get(s:CoDi['colors'], 28) ."'"
exe "let s:bg_warm6 = ' "s:mode."bg=" . get(s:CoDi['colors'], 28) ."'"
"}}}

"}}}
"SET Highlights {{{
exe "hi Normal"  s:fg_norm . s:bg_norm
exe "hi Nontext"  s:fg_warm5
exe "hi Visual"  s:fg_black . s:bg_ltBlue1
exe "hi Type"  s:fg_ltBlue3
exe "hi Number"  s:fg_warm1
exe "hi Boolean"  s:fg_warm2
exe "hi Directory"  s:fg_green3 s:sty_b
exe "hi Conditional"  s:fg_green2 . s:sty_b
exe "hi MatchParen"  s:fg_warm6 . s:bg_NONE . s:sty_b
exe "hi Special"  s:fg_ltBlue0
exe "hi TabLineFill"  s:bg_norm
"
"{{{ Folds
exe "hi Folded" s:bg_dkGray
"}}}
"{{{ Search
exe "hi Search" s:bg_warm1 .s:fg_dkBlue .s:sty_b
exe "hi IncSearch" s:bg_warm1 .s:fg_dkBlue .s:sty_b
"}}}
"{{{ StatusLine
exe "hi StatusLineNC" s:fg_gray2 .s:bg_statusLine_green .s:sty_su
"}}}
"{{{ Line Number & Cursor
exe "hi LineNr" s:fg_lineNR .s:bg_lineNR .s:sty_s
exe "hi CursorLine" s:bg_dkGray1
exe "hi CursorLineNr" s:fg_ltBlue1 .s:bg_dkGray
"}}}
"{{{ Pmenu
exe "hi Pmenu" s:fg_white .s:bg_gray2 . s:sty_n
exe "hi PmenuThumb" s:bg_norm
exe "hi PmenuSel" s:fg_ltBlue1 .s:bg_dkGray
"}}}
"{{{ Diff
exe "hi DiffAdd" s:fg_diff_add .s:bg_diff_add .s:sty_n
exe "hi DiffDelete" s:fg_diff_del .s:bg_diff_del .s:sty_n
exe "hi DiffChange" s:fg_NONE .s:bg_NONE .s:sty_n
exe "hi difftext" s:fg_difftxt .s:bg_difftxt .s:sty_u
"}}}
"{{{Spell
if has("spell")
  exe "hi spellBad" s:fg_spell_bad .s:bg_spell_bad .s:sty_n
  exe "hi spellCap" s:fg_spell_cap .s:bg_spell_cap .s:sty_n
  exe "hi spelllocal" s:fg_NONE .s:bg_spell_local .s:sty_n
  exe "hi spellRare" s:fg_black .s:bg_spell_rare .s:sty_b
endif
"}}}
"{{{ Statement
exe "hi Statement" s:fg_ltBlue1 .s:sty_b
exe "hi Operator" s:fg_warm4 s:sty_b

"}}}
"{{{ Identifier
exe "hi Identifier" s:fg_green5 s:sty_n
exe "hi Function" s:fg_green1 s:sty_b

"}}}
"{{{ Constant
exe "hi Constant" s:fg_green1
exe "hi String" s:fg_ltBlue4 .s:b
"}}}
"{{{ Messaging
exe "hi Todo" s:fg_warm2 .s:bg_purple_todo .s:sty_b
exe "hi Comment" s:fg_purple_comment
"}}}
"{{{ Javascript
 hi link JavascriptNumber Number
 hi link JavascriptDebugger Identifier
"}}}
"{{{ Ruby
exe "hi rubyDefine" s:fg_green1 s:sty_b
"}}}
"}}}
"Colorscheme Functions {{{
if !exists('*ToggleLuminance')
  function! ToggleLuminance() abort
    call speyside#main#UpdateLuminance()
  endfunction
endif


if !hasmapto('<Plug>Speyside')
  nnoremap <Plug>Speyside :<C-U>call ToggleLuminance()<CR>
endif
"}}}
" vim: fdm=marker foldlevelstart=0 foldlevel=0
