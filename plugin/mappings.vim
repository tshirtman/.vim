" I NEVER use U original behaviour, lets use it for c-r
nnoremap U <c-r>

" easier mapping to switch to alternate buffer (ctrl-^)
nnoremap _ <c-^>

" hide hl and signs on ctrl-l
" fromstart<cr><c-l>[201~
nnoremap <silent> <leader>l :nohl<cr>:sign unplace *<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>1000+
" nnoremap <silent> <leader>l :nohl<CR>:sign unplace *<CR>:ccl<CR><C-l>

nnoremap <leader>gg :GundoToggle<CR>

map gs :Gstatus<cr>

nnoremap <leader>v :Gitv<cr>
nnoremap <leader>V :Gitv!<cr>
nnoremap <leader>a :Ack 

nnoremap <leader>gn :GitGutterNextHunk<cr>
nnoremap <leader>gp :GitGutterPrevHunk<cr>
nnoremap <leader>ga :GitGutterStageHunk<cr>
nnoremap <leader>gu :GitGutterUndoHunk<cr>
nnoremap <leader>gS :Magit<cr>
nnoremap <leader>gb :Gblame<cr>

nnoremap <leader>gg :UndotreeToggle<cr>

" fix <c-p> and <c-n> to filter history in command mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <m-o> :copen<cr>
nnoremap <m-n> :cn<cr>
nnoremap <m-p> :cp<cr>
nnoremap <m-q> :ccl<cr>

nnoremap <leader>/ :Ag<cr>
nnoremap <leader>q :bd<cr>
nnoremap <leader>Q :silent call CleanNoNameEmptyBuffers()<cr>

nnoremap <leader>N :NERDTreeToggle<cr>
nnoremap <leader>R :NERDTreeFind<cr>
nnoremap <leader>: :BLines<cr>
