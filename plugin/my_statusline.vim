" statuslines
"set statusline=
"set statusline=%{tagbar#currenttag('[%s]','')}  "tagbar current tag
"set statusline+=%F 	"full path to file
""set statusline+=%t       "tail of the filename
""set statusline+=[
""set statusline+=%{strlen(&fenc)?&fenc:'none'}, "file encoding
""set statusline+=%{&ff}] "file format
""set statusline+=%h      "help file flag
""set statusline+=%m      "modified flag
"set statusline+=%r      "read only flag
""set statusline+=%y      "filetype
"set statusline+=%{fugitive#statusline()} "fugitive
"set statusline+=%=      "left/right separator
"set statusline+=%#warningmsg#
"" set statusline+=%{SyntasticStatuslineFlag()}%*

"set statusline+=%#ErrorMsg#
"set statusline+=%{khuno#Status()}%*
"set statusline+=%*

"set statusline+=%c,     "cursor column
"set statusline+=%l/%L,   "cursor line/total lines
"set statusline+=%p%%      "percent through file
""set statusline+=*

function! StatusLine(current, width)
  return (a:current ? crystalline#mode() . '%#Crystalline#' : '%#CrystallineInactive#')
        \ . ' %f%h%w%m%r '
        \ . (a:current ? '%#CrystallineFill# %{fugitive#head()} ' : '')
        \ . '%=' . (a:current ? '%#Crystalline# %{&paste?"PASTE ":""}%{&spell?"SPELL ":""}' . crystalline#mode_color() : '')
        \ . (a:width > 80 ? ' %{&ft}[%{&enc}][%{&ffs}] %l/%L %c%V %P ' : ' ')
endfunction

function! TabLine()
  let l:vimlabel = has("nvim") ?  " NVIM " : " VIM "
  return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction

let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
" let g:crystalline_theme = 'default'

set showtabline=1
set laststatus=2
