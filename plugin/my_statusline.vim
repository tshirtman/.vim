" statusline
set statusline=%F 	"full path to file
"set statusline+=%t       "tail of the filename
set statusline+=[
set statusline+=%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
"set statusline+=%h      "help file flag
"set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
"set statusline+=%y      "filetype
set statusline+=%{fugitive#statusline()} "fugitive
set statusline+=%=      "left/right separator
"set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}%*
set statusline+=%c,     "cursor column
set statusline+=%l/%L,   "cursor line/total lines
set statusline+=%p%%      "percent through file
"set statusline+=*
