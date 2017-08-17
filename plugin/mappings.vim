" I NEVER use U original behaviour, lets use it for c-r
nnoremap U <c-r>

" easier mapping to switch to alternate buffer (ctrl-^)
nnoremap _ <c-^>

" hide hl and signs on ctrl-l
nnoremap <silent> <leader>l :nohl<CR>:sign unplace *<CR>:ccl<CR><C-l>

nnoremap <leader>gg :GundoToggle<CR>

map gs :Gstatus<cr>

nnoremap <leader>v :Gitv<cr>
nnoremap <leader>V :Gitv!<cr>
nnoremap <leader>a :Ack 

nnoremap <leader>gg :UndotreeToggle<cr>

" fix <c-p> and <c-n> to filter history in command mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
