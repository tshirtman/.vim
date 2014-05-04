" boilerplate
filetype off
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" automatically manage vundle itself
Bundle 'gmarik/vundle'

"Bundle 'AndrewRadev/sideways.vim'
"Bundle 'honza/snipmate-snippets'
" jump directly to multiples of your motion
Bundle 'Lokaltog/vim-easymotion'
" utility lib for plugins
Bundle 'MarcWeber/vim-addon-mw-utils'
" pep8 and others checks, async
Bundle 'alfredodeza/khuno.vim'
" show which mode you are in with colors
Bundle 'bsl/obviousmode'
" ledger (accounting) file synthax hl
Bundle 'cypok/vim-ledger'
" <tab> should always do the right thing
Bundle 'ervandew/supertab'
" python documentation integration
Bundle 'fs111/pydoc.vim'
" snippets integration
Bundle 'garbas/vim-snipmate'
" synthax hl for less-css
Bundle 'groenewege/vim-less'
"Bundle 'kien/ctrlp.vim'
" color-match ()[]{}<> and friends
Bundle 'kien/rainbow_parentheses.vim'
" display ctags in a side buffer
Bundle 'majutsushi/tagbar'
" purfect integration with gist.github.com
Bundle 'mattn/gist-vim'
" utility lib for plugins
Bundle 'mattn/webapi-vim'
" implementation (expand tags shortcuts)
" html 'zen'
Bundle 'mattn/emmet-vim'
" better grep
Bundle 'mileszs/ack.vim'
" get clever comment/uncomment in a lot of languages
Bundle 'scrooloose/nerdcommenter'
" check synthax in a lot of languages, saves you time
Bundle 'scrooloose/syntastic'
" interface to undo tree (yes, history is a tree, not a line)
Bundle 'sjl/gundo.vim'
" python introspection + refactoring
Bundle 'sontek/rope-vim'
" repeat moves
Bundle 'spiiph/vim-space'
" automatically manage splits like a tiling wm
Bundle 'spolu/dwm.vim'
" util lib for plugins
Bundle 'tomtom/tlib_vim'
" git interface so good it should be illegal
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
" fix . for complex actions
Bundle 'tpope/vim-repeat'
" add/remove/change [](){}<>/tags around text
Bundle 'tpope/vim-surround'
" cython hightlight and utils
Bundle 'tshirtman/vim-cython'
" display indent guides in code, sometime useful in too long methods
Bundle 'nathanaelkane/vim-indent-guides'
" shared yank history
Bundle 'YankRing.vim'
" buffer to show #XXX #TODO and othres in project
Bundle 'TaskList.vim'
" color preview/management
Bundle 'colorv.vim'
" python pep8 checks
Bundle 'pep8'
" jinja synthax hl
Bundle 'Glench/Vim-Jinja2-Syntax'
"Bundle 'hallettj/jslint.vim'
" best python plugin out there
Bundle 'davidhalter/jedi-vim'
" github integration
Bundle 'thinca/vim-github'
" js hl
Bundle 'pangloss/vim-javascript'
" personnal wiki
Bundle 'vimwiki'
" js synthax/style checks
Bundle 'walm/jshint.vim.git'
" quickfix improvements
Bundle 'sk1418/QFGrep'
" html tag matching
Bundle 'https://github.com/gregsexton/MatchTag'
" table edition
Bundle 'dhruvasagar/vim-table-mode'
" general purpose interface to various functions
Bundle 'Shougo/unite.vim'
" unite interface for ctags navigation
Bundle 'tsukkee/unite-tag'
" unite interface to show titles/subtitels of your buffer
Bundle 'Shougo/unite-outline'
" unite interface to find files
Bundle 'ujihisa/unite-locate'
" unite interface to history tree
Bundle 'thinca/vim-unite-history'
" unite interface to Ack (better grep)
Bundle 't9md/vim-unite-ack'
" async operations for plugins
Bundle 'Shougo/vimproc.vim'
" completion for lots of languages
Bundle 'Shougo/neocomplcache'
" good haskell integration
Bundle 'lukerandall/haskellmode-vim'
" search/replace with variations
Bundle 'tpope/vim-abolish'
" display marks
Bundle 'kshenoy/vim-signature'
" manage colorscheme using unite
Bundle 'ujihisa/unite-colorscheme'
" quickly update dates using <c-a>/<c-x>
Bundle 'tpope/vim-speeddating'
" gitk clone in a vime buffer
Bundle 'gregsexton/gitv'
" restructured text tables edition
Bundle 'nvie/vim-rst-tables.git'
Bundle 'tpope/vim-jdaddy.git'
Bundle 'tpope/vim-vinegar.git'
" unix helpers
Bundle 'tpope/vim-eunuch.git'

filetype plugin indent on
