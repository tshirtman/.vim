function! MouseToggle()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunction

noremap <leader>m :call MouseToggle()<cr>
