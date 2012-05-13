"hide passwords when editing (you can use select mode to see it), doesn't work
"with all terminal types, but useful
hi Password ctermfg=black ctermbg=black cterm=NONE guifg=black guibg=black 
match Password /pass.*\s*=\s*\k\{-}\zs[^ ]*\ze.\{-}/

