if has("win32")
	" fix pathogen
	let $VIMHOME=expand('<sfile>:p:h:h')
	so $VIMHOME\_vim\autoload\pathogen.vim
	call pathogen#infect('$VIMHOME\_vim\bundle')
	" fix backspace in insert mode, remember, we are on windows, we need twice the BS :P
	se bs=2
endif

syntax on
filetype plugin indent on

call pathogen#infect()

set encoding&		" terminal charset: follows current locale
set termencoding=
set fileencodings=	" charset auto-sensing: disabled
set fileencoding&	" auto-sensed charset of current buffer

set ruler
set wildmenu
set bg=dark
set syntax=auto
set number
set autoindent
set hlsearch
set scrolloff=2
set incsearch
set autowrite
set showtabline=2
set laststatus=2

" easier to type than \
let mapleader = ";"

map <F2> : <Up><CR>
imap <F3> <Esc> .i

" save session and all files and exit with f4, use vim -S in same directory to restore
map <F4> :wa <CR>:mksession!<CR>:xa<CR>

" dirty commenting/uncommenting functions with f5/F6, better to use
" nerdcommenter
map <F5> <leader>cc
map <F6> <leader>cu

" use tab to indent/unindent text or selected text
map <tab> >>
map <S-tab> <<
vmap <tab> >gv
vmap <S-tab> <gv

"use ctrl -> and ctrl <- to navigate between tabs
noremap <C-Left> gT
noremap <C-Right> gt

" same, but on hosts with weird keymap issues
noremap [1;5D gT
noremap [1;5C gt

" ctrl-t to open new tab
noremap  :tabnew 

" hide hl and signs on ctrl-l
nnoremap <silent> <C-l> :nohl<CR>:sign unplace *<CR><C-l>

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

" hey, don't forget to change my name for yours if you copy that :)
ab GPL_LICENSE #################################################################################<enter># copyright 2011 Gabriel Pettier <gabriel.pettier@gmail.com><enter>#<enter># This file is part of PROJECT<enter>#<enter># PROJECT is free software: you can redistribute it and/or modify<enter># it under the terms of the GNU General Public License as published by<enter># the Free Software Foundation, either version 3 of the License, or<enter># (at your option) any later version.<enter>#<enter># PROJECT is distributed in the hope that it will be useful,<enter># but WITHOUT ANY WARRANTY; without even the implied warranty of<enter># MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the<enter># GNU General Public License for more details.<enter>#<enter># You should have received a copy of the GNU General Public License<enter># along with PROJECT.  If not, see <http://www.gnu.org/licenses/>.<enter>##############################################################################<enter>

" mapping to Todo List pluggin toggle
nnoremap <silent> <F8> :TlistToggle<CR>

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" auto loading of template files for various programming language at file
" creation
" When editing a new file, load skeleton if any.
" If we find <+FILENAME+> in skeleton, replace it by the filename.
" If we find <+HEADERNAME+> in skeleton, replace it by the filename
" uppercase with . replaced by _ (foo.h become FOO_H).
autocmd BufNewFile *
	\ let skel = $HOME . "/.vim/skeletons/skel." . expand("%:e") |
	\ if filereadable(skel) |
	\   execute "silent! 0read " . skel |
	\   let fn = expand("%") |
	\   let hn = substitute(expand("%"), "\\w", "\\u\\0", "g") |
	\   let hn = substitute(hn, "\\.", "_", "g") |
	\   let hn = substitute(hn, "/", "_", "g") |
	\   let cn = expand("%:t:r") |
	\   %s/<+FILENAME+>/\=fn/Ige |
	\   %s/<+HEADERNAME+>/\=hn/Ige |
	\   %s/<+CLASSNAME+>/\=cn/Ige |
	\   unlet fn hn cn |
	\ endif |
	\ unlet skel |
	\ goto 

" this function will delete a swapfile without asking if the file was unchanged
" or newer than the swapfile, else, auto recover, either there are changes to
" recover, or it doesn't change anything
function! Check_swapfile()
python << endpython
import vim
import os
swapfilename = vim.eval('v:swapname')
filename = vim.eval('expand("<afile>")')
print swapfilename, filename
if os.stat(filename).st_ctime > os.stat(swapfilename).st_ctime:
    vim.command("let v:swapchoice='d'")
else:
    vim.command("let v:swapchoice='r'")

endpython
endfunction

" bind check_swapfile function to SwapExists
autocmd SwapExists * call Check_swapfile()

"hide passwords when editing (you can use select mode to see it), doesn't work
"with all terminal types, but useful
hi Password ctermfg=black ctermbg=black cterm=NONE guifg=black guibg=black 
match Password /pass.*\s*=\s*\k\{-}\zs[^ ]*\ze.\{-}/

" syntastic configuration
let g:syntastic_mode_map = { 'mode': 'active',
                            \'active_filetypes': ['ruby', 'php', 'python', 'c'],
                            \'passive_filetypes': ['puppet'] }

let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_jump=1
"let g:syntastic_auto_loc_list=0
let g:syntastic_auto_loc_list=1
"let g:syntastic_auto_loc_list=2

" statusline
set statusline=%F 	"full path to file
"set statusline+=%t       "tail of the filename
set statusline+=[
set statusline+=%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
"set statusline+=%h      "help file flag
"set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
"set statusline+=%y      "filetype
set statusline+=%{fugitive#statusline()} "fugitive
set statusline+=%=      "left/right separator
"set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}%*
set statusline+=%c,     "cursor column
set statusline+=%l/%L,   "cursor line/total lines
set statusline+=%p%%      "percent through file
"set statusline+=*

if has('gui_running')
	set guioptions=
	colorscheme pablo
else
        set t_Co=256
endif

