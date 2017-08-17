" use enter in normal mode to insert empty lines, not in cmd windows
noremap <CR> o<ESC>
augroup insertenter
    autocmd!
    autocmd CmdwinEnter * nnoremap <cr> <cr>
    autocmd CmdwinLeave * nnoremap <cr> o<esc>
    autocmd FileType qf nnoremap <buffer> <CR> <CR>
augroup END
