" Author: 'Christopher MCA'
" Site: https:/github.com/christophermca/speyside
" Version: 0.00.1


"{{{ Colorscheme Setup
highlight clear
if exists("syntax_on")
  syntax reset
endif
set background=dark
let colors_name = "speyside"
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
    exe "let s:sty_b = ' " .s:mode."=".s:b"'"
    exe "let s:sty_i = ' " .s:mode."=".s:i"'"
    exe "let s:sty_in = ' " .s:mode."=".s:in"'"
    exe "let s:sty_n = ' " .s:mode."=".s:none"'"
    exe "let s:sty_r = ' " .s:mode."=".s:r"'"
    exe "let s:sty_s = ' " .s:mode."=".s:s"'"
    exe "let s:sty_su = ' " .s:mode."=".s:s .s:u"'"
    exe "let s:sty_u = ' " .s:mode."=".s:u"'"
  "}}}
"}}}
"Color Palette {{{
" GUI {{{
"}}}
"Terminal {{{
  "Screen Background Colors {{{
    let s:norm_bg_dark ='234'
    let s:norm_bg_base ='237'
    let s:norm_bg_light ='251'
    let s:norm_fg_base = '255'
  "}}}
  "Colors {{{
    " Dark & Base {{{
      " mono {{{
        let s:white = '15'
        let s:black = '16'
        let s:dkGray = '235'
        let s:dkGray2 = '239'
        let s:dkGray1 = '233'
        let s:gray = '244'
        let s:gray1= '253'
        let s:gray2 = '242'
      "}}}
      "special {{{
        let s:purple_comment = '68'
        let s:purple_todo = '57'
        let s:lineNR = '144'
        let s:statusLine_green= '158'
        let s:diff1 = '46'
        let s:diff2 = '22'
        let s:diff3 = '9'
        let s:diff4 = '52'
        let s:diff5 = '10'
        let s:diff6 = '239'

        let s:spell1 = '20'
      "}}}
      "{{{ green
        let s:ltGreen2 = '119'
        let s:green1= '84'
        let s:green2= '40'
        let s:green3= '71'
        let s:green4= '48'
      "}}}
      "blue {{{
      let s:ltBlue0 = '39'
      let s:ltBlue1 = '87'
      let s:ltBlue2 = '195'
      let s:dkBlue = '19'
      let s:blue1 = '27'
      let s:blue2 = '33'
      "}}}
      "purple {{{
      let s:purple0 = '105'
      let s:purple1 = '99'
      let s:purple3 = '12'
      let s:purple4 = '153'
      let s:purple5 = '146'
      let s:purple6 = '135'
      let s:purple7 = '111'
      "}}}
      "warm {{{
      let s:warm0 = '214'
      let s:warm1 = '190'
      let s:warm2 = '222'
      let s:warm3 = '202'
      let s:warm4 = '222'
      "}}}
    " }}}
    " }}}
  "}}}
"}}}
"{{{ Build Color Strings
exe "let s:fg_NONE = ' ".s:mode."fg=".s:none ."'"
exe "let s:bg_NONE = ' ".s:mode."bg=".s:none ."'"

exe "let s:fg_diff_add = ' ".s:mode."fg=".s:diff1 ."'"
exe "let s:bg_diff_add = ' ".s:mode."bg=".s:diff2 ."'"

exe "let s:fg_diff_del = ' ".s:mode."fg=".s:diff3 ."'"
exe "let s:bg_diff_del = ' ".s:mode."bg=".s:diff4 ."'"

exe "let s:fg_difftxt = ' ".s:mode."fg=".s:diff5 ."'"
exe "let s:bg_difftxt = ' ".s:mode."bg=".s:diff6 ."'"

exe "let s:fg_spell_bad = ' ".s:mode."fg=".s:diff3 ."'"
exe "let s:bg_spell_bad = ' ".s:mode."bg=".s:diff4 ."'"

exe "let s:fg_spell_cap = ' ".s:mode."fg=".s:diff1 ."'"
exe "let s:bg_spell_cap = ' ".s:mode."bg=".s:diff2 ."'"

exe "let s:bg_spell_local = ' ".s:mode."bg=".s:spell1 ."'"

exe "let s:bg_spell_rare = ' ".s:mode."bg=".s:warm2 ."'"

"base
exe "let s:fg_norm = ' ".s:mode."fg=".s:norm_fg_base ."'"
exe "let s:bg_norm = ' ".s:mode."bg=".s:norm_bg_base ."'"

exe "let s:fg_white = ' ".s:mode."fg=".s:white ."'"
exe "let s:bg_white = ' ".s:mode."bg=".s:white ."'"

exe "let s:fg_lineNR = ' ".s:mode."fg=".s:lineNR ."'"
exe "let s:bg_lineNR = ' ".s:mode."bg=".s:lineNR ."'"

exe "let s:fg_black = ' ".s:mode."fg=".s:black ."'"
exe "let s:bg_black = ' ".s:mode."bg=".s:black ."'"

exe "let s:fg_dkGray = ' ".s:mode."fg=".s:dkGray ."'"
exe "let s:bg_dkGray = ' ".s:mode."bg=".s:dkGray ."'"

exe "let s:fg_dkGray1 = ' ".s:mode."fg=".s:dkGray1 ."'"
exe "let s:bg_dkGray1 = ' ".s:mode."bg=".s:dkGray1 ."'"

exe "let s:fg_dkGray2 = ' ".s:mode."fg=".s:dkGray2 ."'"
exe "let s:bg_dkGray2 = ' ".s:mode."bg=".s:dkGray2 ."'"

exe "let s:fg_gray = ' ".s:mode."fg=".s:gray ."'"
exe "let s:bg_gray = ' ".s:mode."bg=".s:gray ."'"

exe "let s:fg_gray1 = ' ".s:mode."fg=".s:gray1 ."'"
exe "let s:bg_gray1 = ' ".s:mode."bg=".s:gray1 ."'"

exe "let s:fg_gray2 = ' ".s:mode."fg=".s:gray2 ."'"
exe "let s:bg_gray2 = ' ".s:mode."bg=".s:gray2 ."'"


"Blue
exe "let s:fg_ltBlue0 = ' ".s:mode."fg=".s:ltBlue0 ."'"
exe "let s:bg_ltBlue0= ' ".s:mode."bg=".s:ltBlue0 ."'"

exe "let s:fg_ltBlue1 = ' ".s:mode."fg=".s:ltBlue1 ."'"
exe "let s:bg_ltBlue1= ' ".s:mode."bg=".s:ltBlue1 ."'"

exe "let s:fg_ltBlue2 = ' ".s:mode."fg=".s:ltBlue2 ."'"
exe "let s:bg_ltBlue2= ' ".s:mode."bg=".s:ltBlue2 ."'"

exe "let s:fg_blue1 = ' ".s:mode."fg=".s:blue1 ."'"
exe "let s:bg_blue1= ' ".s:mode."bg=".s:blue1 ."'"

exe "let s:fg_blue2 = ' ".s:mode."fg=".s:blue2 ."'"
exe "let s:bg_blue2= ' ".s:mode."bg=".s:blue2 ."'"

exe "let s:fg_dkBlue = ' ".s:mode."fg=".s:dkBlue ."'"
exe "let s:bg_dkBlue = ' ".s:mode."bg=".s:dkBlue ."'"


  "Green {{{
  exe "let s:fg_green1 = ' ".s:mode."fg=".s:green1 ."'"
  exe "let s:bg_green1 = ' ".s:mode."bg=".s:green1 ."'"

  exe "let s:fg_green2 = ' ".s:mode."fg=".s:green2 ."'"
  exe "let s:bg_green2 = ' ".s:mode."bg=".s:green2 ."'"

  exe "let s:fg_green3 = ' ".s:mode."fg=".s:green3 ."'"
  exe "let s:bg_green3= ' ".s:mode."bg=".s:green3 ."'"

  exe "let s:fg_green4 = ' ".s:mode."fg=".s:green4 ."'"
  exe "let s:bg_green4= ' ".s:mode."bg=".s:green4 ."'"

  exe "let s:fg_green4 = ' ".s:mode."fg=".s:green4 ."'"
  exe "let s:bg_green4= ' ".s:mode."bg=".s:green4 ."'"

  exe "let s:fg_statusLine_green = ' ".s:mode."fg=".s:statusLine_green ."'"
  exe "let s:bg_statusLine_green= ' ".s:mode."bg=".s:statusLine_green ."'"
  "}}}

  "Purple {{{
  exe "let s:fg_purple_todo = ' ".s:mode."fg=".s:purple_todo ."'"
  exe "let s:bg_purple_todo = ' ".s:mode."bg=".s:purple_todo ."'"

  exe "let s:fg_purple_comment = ' ".s:mode."fg=".s:purple_comment ."'"
  exe "let s:bg_purple_comment = ' ".s:mode."bg=".s:purple_comment ."'"

  exe "let s:fg_purple0 = ' ".s:mode."fg=".s:purple0 ."'"
  exe "let s:bg_purple0 = ' ".s:mode."bg=".s:purple0 ."'"

  exe "let s:fg_purple1 = ' ".s:mode."fg=".s:purple1 ."'"
  exe "let s:bg_purple1 = ' ".s:mode."bg=".s:purple1 ."'"

  exe "let s:fg_purple3 = ' ".s:mode."fg=".s:purple3 ."'"
  exe "let s:bg_purple3 = ' ".s:mode."bg=".s:purple3 ."'"

  exe "let s:fg_purple4 = ' ".s:mode."fg=".s:purple4 ."'"
  exe "let s:bg_purple4 = ' ".s:mode."bg=".s:purple4 ."'"

  exe "let s:fg_purple5 = ' ".s:mode."fg=".s:purple5 ."'"
  exe "let s:bg_purple5 = ' ".s:mode."bg=".s:purple5 ."'"

  exe "let s:fg_purple6 = ' " s:mode."fg=".s:purple6 ."'"
  exe "let s:bg_purple6 = ' ".s:mode."bg=".s:purple6 ."'"
  "}}}

  "Warm {{{
  exe "let s:fg_warm0 = ' ".s:mode."fg=".s:warm0 ."'"
  exe "let s:bg_warm0 = ' ".s:mode."bg=".s:warm0 ."'"

  exe "let s:fg_warm1 = ' ".s:mode."fg=".s:warm1 ."'"
  exe "let s:bg_warm1 = ' ".s:mode."bg=".s:warm1 ."'"

  exe "let s:fg_warm2 = ' ".s:mode."fg=".s:warm2 ."'"
  exe "let s:bg_warm2 = ' ".s:mode."bg=".s:warm2 ."'"

  exe "let s:fg_warm3 = ' ".s:mode."fg=".s:warm3 ."'"
  exe "let s:bg_warm3 = ' ".s:mode."bg=".s:warm3 ."'"

  exe "let s:fg_warm4 = ' ".s:mode."fg=".s:warm4 ."'"
  exe "let s:bg_warm4 = ' ".s:mode."bg=".s:warm4 ."'"
  "}}}
"}}}
"SET Highlights {{{
  exe "hi Normal" .s:fg_norm .s:bg_norm
  exe "hi Visual" .s:fg_black .s:bg_ltBlue1
  exe "hi Type" .s:fg_purple4
  exe "hi Number" .s:fg_warm1
  exe "hi Boolean" .s:fg_warm2
  exe "hi Conditional" .s:green2 .s:sty_b
  exe "hi MatchParen" .s:fg_warm4 .s:bg_NONE .s:sty_b
  exe "hi Special" .s:fg_ltBlue0
  exe "hi TabLineFill" s:bg_norm
"
  "{{{ Folds
   exe "hi Folded" .s:bg_dkGray
  "}}}
  "{{{ Search
  exe "hi Search" .s:bg_warm1 .s:fg_dkBlue .s:sty_b
  exe "hi IncSearch" .s:bg_warm1 .s:fg_dkBlue .s:sty_b
  "}}}
  "{{{ StatusLine
  exe "hi StatusLineNC" .s:fg_gray2 .s:bg_statusLine_green .s:sty_su
  "}}}
  "{{{ Line Number & Cursor
  exe "hi LineNr" .s:fg_lineNR .s:bg_dkGray2
  exe "hi CursorLine" .s:bg_dkGray
  exe "hi CursorLineNr" .s:fg_ltBlue1 .s:bg_dkGray
  "}}}
  "{{{ Pmenu
  exe "hi Pmenu" .s:fg_white .s:bg_gray .s:sty_n
  exe "hi PmenuThumb" s:bg_norm
  exe "hi PmenuSel" .s:fg_ltBlue1 .s:bg_dkGray
  "}}}
  "{{{ Diff
  exe "hi DiffAdd" .s:fg_diff_add .s:bg_diff_add .s:sty_n
  exe "hi DiffDelete" .s:fg_diff_del .s:bg_diff_del .s:sty_n
  exe "hi DiffChange" .s:fg_NONE .s:bg_NONE .s:sty_n
  exe "hi difftext" .s:fg_difftxt .s:bg_difftxt .s:sty_u
  "}}}
  "{{{Spell
  if has("spell")
    exe "hi spellBad" .s:fg_spell_bad .s:bg_spell_bad .s:sty_n
    exe "hi spellCap" .s:fg_spell_cap .s:bg_spell_cap .s:sty_n
    exe "hi spelllocal" .s:fg_NONE .s:bg_spell_local .s:sty_n
    exe "hi spellRare" .s:fg_black .s:bg_spell_rare .s:sty_b
  endif
  "}}}
  "{{{ Statement
    exe "hi Statement" .s:fg_ltBlue1 .s:sty_b
    exe "hi Operator" .s:fg_green2

  "}}}
"{{{ Identifier
  exe "hi Identifier" .s:fg_green4
  exe "hi Function" .s:fg_green1 s:sty_b

"}}}
  "{{{ Constant
    exe "hi Constant" .s:fg_green1
    exe "hi String" .s:fg_purple0 .s:b
  "}}}
"{{{ Messaging
exe "hi Todo" .s:fg_warm2 .s:bg_purple_todo .s:sty_b
exe "hi Comment" .s:fg_purple_comment .s:sty_b
"}}}
  "{{{ Ruby
  exe "hi rubyDefine" .s:fg_green1 s:sty_b
  "}}}
"}}}
"Colorscheme Functions {{{
let s:luminosity = 0

function! ChangeBackground()

  let backgroundList = [s:norm_bg_dark, s:norm_bg_base, s:norm_bg_light]
  let background = get(backgroundList, s:luminosity, s:norm_bg_base)
  exe "let s:new_bg = ' ".s:mode."bg=".background ."'"

  exe "hi Normal" .s:new_bg

  if s:luminosity >= 3
    let s:luminosity = 0
  else
    let s:luminosity += 1
  endif


endfunction
nmap <Leader>[] :call ChangeBackground()<CR>
"}}}
"{{{ License
" Copyright (c) 2016 ChristopherMCA
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
"
" vim: fdm=marker foldlevelstart=0 foldlevel=0
"}}}
