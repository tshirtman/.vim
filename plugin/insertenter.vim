" use enter in normal mode to insert empty lines, not in cmd windows
noremap <CR> o<ESC>
autocmd CmdwinEnter * nnoremap <cr> <cr>
autocmd CmdwinLeave * nnoremap <cr> o<esc>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
