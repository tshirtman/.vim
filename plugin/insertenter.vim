" use enter in normal mode to insert empty lines, not in cmd windows
noremap <CR> o<ESC>
au CmdwinEnter * nnoremap <cr> <cr>
au CmdwinLeave * nnoremap <cr> o<esc>
