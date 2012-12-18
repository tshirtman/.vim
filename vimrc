" cleanup autocommands to avoid slowdown on .vimrc reloads
autocmd!

" try to use jj instead of esc
inoremap jj <esc>

" noesc, use jj or <c-c>
inoremap <esc> <nop>

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

silent! call pathogen#infect()
silent! call pathogen#helptags()

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

" use a seperate file to store history, so it works cross-session
if exists('&undofile')
  set undofile
  set undodir=$HOME/.vim/undofiles
else
  echom "no undofiles"
endif

" ignore common non-editable files in projects
set wildignore+=*.so,*.swo,*.swp,*.pyc,*.pyo,~*.un

if exists('&relativenumber')
  set relativenumber
else
  echom "no relativenumbers"
endif

if executable("par")
    set formatprg=par
endif

" cool trick to insert dates
iab <expr> isodate strftime("%Y-%m-%d")
iab <expr> frdate strftime("%d/%m/%Y")

" use ack-grep
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" change ctrl-p shortcut because of conflict with replace paste
let g:ctrlp_map = '<c-b>'
let g:ctrlp_max_height = 100

" easier to type than \
let mapleader = ","

" I NEVER use U original behaviour, lets use it for c-r
noremap U <c-r>

" use bépo for lustyjuggler
let g:LustyJugglerKeyboardLayout = "bépo"

noremap é w
noremap è l
noremap È h

" easier mapping to za
nnoremap <space> za

" easier mapping to switch to alternate buffer (ctrl-^)
nnoremap _ <c-^>

" easier windows moves
nnoremap € <c-w><c-w>

" easy switch number/rel
noremap <silent> <leader>n :call NumbersToggle()<cr>

" use tab to indent/unindent text or selected text
nnoremap <tab> >>
nnoremap <S-tab> <<
vnoremap <tab> >gv
vnoremap <S-tab> <gv

" close buffer on leader-q
noremap <leader>q :bd<CR>

" hide hl and signs on ctrl-l
nnoremap <silent> <leader>l :nohl<CR>:sign unplace *<CR>:ccl<CR><C-l>

" use enter in normal mode to insert empty lines, not in cmd windows
noremap <CR> o<ESC>
au CmdwinEnter * nnoremap <cr> <cr>
au CmdwinLeave * nnoremap <cr> o<esc>

let g:xml_syntax_folding=1

" trigger french or english spell correction
nnoremap <leader>sf :setlocal spell spelllang=fr<CR>
nnoremap <leader>se :setlocal spell spelllang=en_US<CR>

nnoremap <leader>gg :GundoToggle<CR>

command! Gpush Git push
command! Gcp Git commit -m "bump" | Git push

if has('gui_running')
	set guioptions=
	colorscheme pablo
else
        set t_Co=256
endif

let g:multiedit_nomappings=1


noremap <Leader>T <Plug>TaskList

noremap æ :SidewaysLeft<cr>
noremap ù :SidewaysRight<cr>

" :diffupdate is too long to type
noremap <leader>u :diffupdate<cr>

noremap \ :<up><cr>

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

" auto reload .vimrc when i exit it
au BufWritePost $MYVIMRC silen so $MYVIMRC | syn on

" auto relead a .vim file when i exit it
au BufWritePost *.vim source % | syn on

" easy opening of .vimrc
noremap <leader>ev :split $MYVIMRC<cr>

function! MouseToggle()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunction

noremap <leader>m :call MouseToggle()<cr>

" yankring mappings
let g:yankring_replace_n_nkey = '<c-é>'

" hl occorence of word under cursor, without moving
nnoremap <silent> - :let @/='\<'.expand('<cword>').'\>'<bar>set hlsearch<cr>
