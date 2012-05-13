inoremap jj <ESC>

if has("win32")
	" fix pathogen
	let $VIMHOME=expand('<sfile>:p:h:h')
	so $VIMHOME\_vim\autoload\pathogen.vim
	call pathogen#infect('$VIMHOME\_vim\bundle')
	" fix backspace in insert mode, remember, we are on windows, we need
	" twice the BS :P
	se bs=2
endif

syntax on
filetype plugin indent on

call pathogen#infect()
call pathogen#helptags()

set ruler
set wildmenu
set bg=dark
set syntax=auto
set number
set autoindent
set hlsearch
set scrolloff=2
set incsearch
set ignorecase
set smartcase
"set autowrite
"set showtabline=2
set laststatus=2
set showcmd
"set nohidden
set hidden
set autoread
set clipboard+=unnamed " system clipboard as default register.
" use a seperate file to store history, so it works cross-session
set undofile

" ignore common non-editable files in projects
set wildignore+=*.so,*.swo,*.swp,*.pyc,*.pyo

" cool trick to insert dates
iab <expr> isodate strftime("%Y-%m-%d")
iab <expr> frdate strftime("%d/%m/%Y")

" use ack-grep
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" change ctrl-p shortcut because of conflict with replace paste
let g:ctrlp_map = '<c-b>'

" easier to type than \
let mapleader = ";"

" use bépo for lustyjuggler
let g:LustyJugglerKeyboardLayout = "bépo"

" f5/F6, better to use nerdcommenter
map <F5> <leader>cc
map <F6> <leader>cu

" use tab to indent/unindent text or selected text
map <tab> >>
map <S-tab> <<
vmap <tab> >gv
vmap <S-tab> <gv

""use ctrl -> and ctrl <- to navigate between tabs
"noremap <C-Left> gT
"noremap <C-Right> gt
"use ctrl -> and ctrl <- to navigate between buffers
noremap <C-Left> :bp!<CR>
noremap <C-Right> :bn!<CR>

" same, but on hosts with weird keymap issues
noremap [1;5D :bp!<CR>
noremap [1;5C :bn!<CR>

" close buffer on leader-q
noremap <leader>q :bd<CR>

" hide hl and signs on ctrl-l, hide quickfixes
nnoremap <silent> <C-l> :nohl<CR>:sign unplace *<CR>:lcl<CR><C-l>

" reverse two words (the one under cursor with the next one) with gw in normal
" mode
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr>:nohl<cr><c-o>

" use enter in normal mode to insert empty lines
nmap <CR> o<ESC>

let g:xml_syntax_folding=1

" trigger french or english spell correction
map <leader>sf :setlocal spell spelllang=fr<CR>
map <leader>se :setlocal spell spelllang=en_US<CR>

nnoremap <F9> :GundoToggle<CR>

" mapping to Tag List pluggin toggle
nnoremap <silent> <F8> :TlistToggle<CR>

if has('gui_running')
	set guioptions=
	colorscheme pablo
else
        set t_Co=256
endif

