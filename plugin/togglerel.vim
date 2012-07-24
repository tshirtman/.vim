function! Togglerel()
    if &number
	se relativenumber
    else
	se number
    endif
endf

noremap <leader>n :call Togglerel()<cr>
