" I NEVER use U original behaviour, lets use it for c-r
nnoremap U <c-r>

noremap é w
noremap è l
noremap È h

" easier mapping to za
nnoremap <space> za

" easier mapping to switch to alternate buffer (ctrl-^)
nnoremap _ <c-^>

" close buffer on leader-q
noremap <leader>q :bd<CR>

" hide hl and signs on ctrl-l
nnoremap <silent> <leader>l :nohl<CR>:sign unplace *<CR>:ccl<CR><C-l>

nnoremap <leader>gg :GundoToggle<CR>

noremap <Leader>T <Plug>TaskList

" :diffupdate is too long to type
noremap <leader>u :diffupdate<cr>

noremap \ :<up><cr>

" hl occurence of word under cursor, without moving
nnoremap <silent> - :let @/='\<'.expand('<cword>').'\>'<bar>set hlsearch<cr>

nnoremap <leader>f :QFGrep<CR>

" these keys are free to map, think about them if needed
" noremap ç
" noremap þ
" noremap ß
" noremap ð
" noremap ə
" noremap ¿
" noremap µ
" noremap †
" noremap —
" noremap ±
" noremap −
" noremap ÷
" noremap ×
" noremap ≠
