" Author: 'Christopher MCA'
" Site: https:/github.com/christophermca/maui92/
" Version:      0.0.2

" Note: A theme built with aloha

highlight clear
if exists("syntax_on")
  syntax reset
endif

set background=dark
let colors_name = "maui92"

" IMPORT color-dictionary
if !exists('g:Maui92Colors')
  let g:Maui92Colors = 0
endif

hi Normal ctermbg=233 ctermfg=254


" " Vim >= 7.0 specific colors
" if version >= 700
"   hi iCursor      guifg=#000000 guibg=#d0d0d0 ctermfg=0 ctermbg=252
"   hi CursorLine   guibg=#262626 gui=NONE ctermbg=234 cterm=NONE
"   hi CursorColumn guifg=#ffffff guibg=#303030 ctermbg=238
"   hi MatchParen   guifg=#ffaf00 guibg=NONE gui=bold ctermfg=214 ctermbg=NONE cterm=bold
"   hi Pmenu        guifg=#eeeeee guibg=#444444 ctermfg=255 ctermbg=238
"   hi PmenuSel     guifg=#000000 guibg=#df8700 ctermfg=0 ctermbg=172
"   hi search       guifg=#ff00ff guibg=NONE gui=underline ctermfg=201 ctermbg=NONE cterm=underline
"   hi Incsearch    guifg=#ff00ff guibg=NONE gui=underline ctermfg=201 ctermbg=NONE cterm=underline
" endif

" General colors

" Syntax highlighting
" hi Comment        guifg=#808080 ctermfg=244
" hi Todo           guifg=#00ffff guibg=#606060 gui=bold ctermfg=6 ctermbg=239 cterm=bold
" hi Boolean        guifg=#87ff5f gui=bold ctermfg=119 cterm=bold
" hi Conditional    guifg=#5fdfff ctermfg=81
" hi String         guifg=#0087df ctermfg=32
" hi Character      guifg=#0087ff ctermfg=33
" hi Identifier     guifg=#00afff ctermfg=39 cterm=NONE
" hi Function       guifg=#df8700 ctermfg=172
" hi Type           guifg=#87dfff gui=NONE ctermfg=117
" hi Typedef        guifg=#87dfff gui=bold ctermfg=117 cterm=bold
" hi StorageClass   guifg=#87ff5f ctermfg=119
" hi Structure      guifg=#01dfdf ctermfg=44
" hi Label          guifg=#5f87ff ctermfg=69
" hi Statement      guifg=#5fdfff gui=NONE ctermfg=81
" hi Repeat         guifg=#afdfff gui=bold ctermfg=153 cterm=bold
" hi Exception      guifg=#afdfff gui=bold ctermfg=153 cterm=bold
" hi Operator       guifg=#8787ff ctermfg=105
" hi Keyword        guifg=#dfffff guibg=NONE gui=bold ctermfg=195 ctermbg=NONE  cterm=bold
" hi Constant       guifg=#af5fff ctermfg=195
" hi Number         guifg=#5fdf5f ctermfg=77
" hi Special        guifg=#5fdf5f gui=bold ctermfg=77 cterm=bold
" hi PreCondit      guifg=#005faf ctermfg=25
" hi PreProc        guifg=#00afff ctermfg=39
" hi Define         guifg=#ff8700 ctermfg=208

"Diff

"Spell




