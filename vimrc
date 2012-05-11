" MASOCHIST anti-arrows experiment
" see http://jeetworks.org/node/89
inoremap <right> <nop>
inoremap <left> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
noremap <right> <nop>
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
" /MASOCHIST

inoremap jj <ESC>

if has("win32")
	" fix pathogen
	let $VIMHOME=expand('<sfile>:p:h:h')
	so $VIMHOME\_vim\autoload\pathogen.vim
	call pathogen#infect('$VIMHOME\_vim\bundle')
	call pathogen#helptags()
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
" use a seperate file to store history, so it works cross-sessionistory, so it works cross-sessions
set undofile

" cool trick to insert dates
iab <expr> isodate strftime("%Y-%m-%d")
iab <expr> frdate strftime("%d/%m/%Y")

" easier to type than \
let mapleader = ";"

" save session and all files and exit with f4, use vim -S in same directory to restore
map <F4> :tabdo lcl<CR>:wa <CR>:mksession!<CR>:xa<CR>

" dirty commenting/uncommenting functions with f5/F6, better to use
" nerdcommenter
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

" ctrl-t to open new tab
noremap  <leader>t

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

" hey, don't forget to change my name for yours if you copy that :)
ab GPL_LICENSE #################################################################################<enter># copyright 2012 Gabriel Pettier <gabriel.pettier@gmail.com><enter>#<enter># This file is part of PROJECT<enter>#<enter># PROJECT is free software: you can redistribute it and/or modify<enter># it under the terms of the GNU General Public License as published by<enter># the Free Software Foundation, either version 3 of the License, or<enter># (at your option) any later version.<enter>#<enter># PROJECT is distributed in the hope that it will be useful,<enter># but WITHOUT ANY WARRANTY; without even the implied warranty of<enter># MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the<enter># GNU General Public License for more details.<enter>#<enter># You should have received a copy of the GNU General Public License<enter># along with PROJECT.  If not, see <http://www.gnu.org/licenses/>.<enter>##############################################################################<enter>

" mapping to Todo List pluggin toggle
nnoremap <silent> <F8> :TlistToggle<CR>

" this function will delete a swapfile without asking if the file is newer
" than the swapfile, else, auto recover, either there are changes to recover,
" or it doesn't change anything (and it will be deleted next start)
function! CheckSwapfile()
python << endpython
import vim
import os

swapfilename = vim.eval('v:swapname')
filename = vim.eval('expand("<afile>")')

if os.stat(filename).st_ctime > os.stat(swapfilename).st_ctime:
    vim.command("let v:swapchoice='d'")

else:
    vim.command("let v:swapchoice='r'")

endpython
endfunction

" bind CheckSwapfile function to SwapExists
autocmd SwapExists * call CheckSwapfile()

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

" indent guide conf
noremap <F12> :IndentGuidesToggle<CR>
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" pep8 mapping, putting this in ftplugin/python.vim doesn't seem to work
let g:pep8_map='<F3>'

" Load show documentation plugin
let g:pymode_doc = 1

" Key for show python documentation
let g:pymode_doc_key = 'K'

" Executable command for documentation search
let g:pydoc = 'pydoc'

" Load run code plugin
let g:pymode_run = 1

" Key for run python code
let g:pymode_run_key = '<leader>r'

" Load pylint code plugin
let g:pymode_lint = 0

" Switch pylint or pyflakes code checker
" values (pylint, pyflakes)
let g:pymode_lint_checker = "pylint"

" Pylint configuration file
" If file not found use 'pylintrc' from python-mode plugin directory
let g:pymode_lint_config = "$HOME/.pylintrc"

" Check code every save
let g:pymode_lint_write = 1

" Auto open cwindow if errors be finded
let g:pymode_lint_cwindow = 1

" Auto jump on first error
let g:pymode_lint_jump = 0

" Place error signs
let g:pymode_lint_signs = 1

" Minimal height of pylint error window
let g:pymode_lint_minheight = 3

" Maximal height of pylint error window
let g:pymode_lint_maxheight = 6

" Load rope plugin
let g:pymode_rope = 1

" Auto create and open ropeproject
let g:pymode_rope_auto_project = 1

" Enable autoimport
let g:pymode_rope_enable_autoimport = 1

" Auto generate global cache
let g:pymode_rope_autoimport_generate = 1

let g:pymode_rope_autoimport_underlineds = 0

let g:pymode_rope_codeassist_maxfixes = 10

let g:pymode_rope_sorted_completions = 1

let g:pymode_rope_extended_complete = 1

let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]

let g:pymode_rope_confirm_saving = 1

let g:pymode_rope_global_prefix = "<C-x>p"

let g:pymode_rope_local_prefix = "<C-c>r"

let g:pymode_rope_vim_completion = 1

let g:pymode_rope_guess_project = 1

let g:pymode_rope_goto_def_newwin = 0

let g:pymode_rope_always_show_complete_menu = 0

" Load python objects and motion
let g:pymode_motion = 1

" Load breakpoints plugin
let g:pymode_breakpoint = 1

" Key for set/unset breakpoint
let g:pymode_breakpoint_key = '<leader>b'

" Autoremove unused whitespaces
let g:pymode_utils_whitespaces = 1

" Auto fix vim python paths if virtualenv enabled
let g:pymode_virtualenv = 1

" Set default pymode python indent options
let g:pymode_options_indent = 1

" Set default pymode python fold options
let g:pymode_options_fold = 1

" Set default pymode python other options
let g:pymode_options_other = 1

" Enable pymode's custom syntax highlighting
let g:pymode_syntax = 1

" Enable all python highlightings
let g:pymode_syntax_all = 1

" Highlight "print" as function
let g:pymode_syntax_print_as_function = 0

" Highlight indentation errors
let g:pymode_syntax_indent_errors = g:pymode_syntax_all

" Highlight trailing spaces
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Highlight string formatting
let g:pymode_syntax_string_formatting = g:pymode_syntax_all

" Highlight str.format syntax
let g:pymode_syntax_string_format = g:pymode_syntax_all

" Highlight string.Template syntax
let g:pymode_syntax_string_templates = g:pymode_syntax_all

" Highlight doc-tests
let g:pymode_syntax_doctests = g:pymode_syntax_all

" Highlight builtin objects (__doc__, self, etc)
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all

" Highlight builtin functions
let g:pymode_syntax_builtin_funcs = g:pymode_syntax_all

" Highlight exceptions
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all

" For fast machines
let g:pymode_syntax_slow_sync = 0

" don't use tab for snippets since it's the autocomplete key
"let g:snips_trigger_key = ""
"let g:snips_trigger_key_backwards = "::"
