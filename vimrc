" load vundle config
source ~/.vim/vundle-list.vim

" cleanup autocommands to avoid slowdown on .vimrc reloads
autocmd!

syntax on
filetype plugin indent on

" easier to type than \
let mapleader = ","

set ruler
set wildmenu
set bg=dark
set syntax=auto
set number
set autoindent
set hlsearch
set scrolloff=999
set incsearch
set ignorecase
set smartcase
set laststatus=2
set showcmd
set hidden
set autoread
set clipboard+=unnamed " system clipboard as default register.

" ignore common non-editable files in projects
set wildignore+=*.so,*.swo,*.swp,*.pyc,*.pyo,~*.un

" use ack-grep
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

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

" plugin specific configs that can't go into plugins
" change ctrl-p shortcut because of conflict with replace paste
let g:ctrlp_map = '<c-b>'
let g:ctrlp_max_height = 100

let g:multiedit_nomappings=1

" easier call to zencoding
let g:user_zen_leader_key = '<leader>e'
