" boilerplate
filetype off
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle' 					" automatically manage vundle itself

"Bundle 'AndrewRadev/sideways.vim'
"Bundle 'honza/snipmate-snippets'
Bundle 'Lokaltog/vim-easymotion' 			" jump directly to multiples of your motion
Bundle 'MarcWeber/vim-addon-mw-utils' 			" utility lib for plugins
Bundle 'alfredodeza/khuno.vim' 				" pep8 and others checks, async
Bundle 'bsl/obviousmode' 				" show which mode you are in with colors
Bundle 'cypok/vim-ledger' 				" ledger (accounting) file synthax hl
Bundle 'ervandew/supertab' 				" <tab> should always do the right thing
Bundle 'fs111/pydoc.vim' 				" python documentation integration
Bundle 'garbas/vim-snipmate' 				" snippets integration
Bundle 'groenewege/vim-less' 				" synthax hl for less-css
"Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim' 			" color-match ()[]{}<> and friends
Bundle 'majutsushi/tagbar' 				" display ctags in a side buffer
Bundle 'mattn/gist-vim' 				" purfect integration with gist.github.com
Bundle 'mattn/webapi-vim' 				" utility lib for plugins
Bundle 'mattn/emmet-vim' 				" html 'zen' implementation (expand tags shortcuts)
Bundle 'mileszs/ack.vim' 				" better grep
Bundle 'scrooloose/nerdcommenter' 			" get clever comment/uncomment in a lot of languages
Bundle 'scrooloose/syntastic' 				" check synthax in a lot of languages, saves you time
Bundle 'sjl/gundo.vim' 					" interface to undo tree (yes, history is a tree, not a line)
Bundle 'sontek/rope-vim' 				" python introspection + refactoring
Bundle 'spiiph/vim-space' 				" repeat moves
Bundle 'spolu/dwm.vim' 					" automatically manage splits like a tiling wm
Bundle 'tomtom/tlib_vim' 				" util lib for plugins
Bundle 'tpope/vim-fugitive' 				" git interface so good it should be illegal
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat' 				" fix . for complex actions
Bundle 'tpope/vim-surround' 				" add/remove/change [](){}<>/tags around text
Bundle 'tshirtman/vim-cython' 				" cython hightlight and utils
Bundle 'nathanaelkane/vim-indent-guides' 		" display indent guides in code, sometime useful in too long methods
Bundle 'YankRing.vim' 					" shared yank history
Bundle 'TaskList.vim' 					" buffer to show #XXX #TODO and othres in project
Bundle 'colorv.vim' 					" color preview/management
Bundle 'pep8' 						" python pep8 checks
Bundle 'Glench/Vim-Jinja2-Syntax' 			" jinja synthax hl
"Bundle 'hallettj/jslint.vim'
Bundle 'davidhalter/jedi-vim' 				" best python plugin out there
Bundle 'thinca/vim-github' 				" github integration
Bundle 'pangloss/vim-javascript' 			" js hl
Bundle 'vimwiki' 					" personnal wiki
Bundle 'walm/jshint.vim.git' 				" js synthax/style checks
Bundle 'sk1418/QFGrep' 					" quickfix improvements
Bundle 'https://github.com/gregsexton/MatchTag' 	" html tag matching
Bundle 'dhruvasagar/vim-table-mode' 			" table edition
Bundle 'Shougo/unite.vim' 				" general purpose interface to various functions
Bundle 'tsukkee/unite-tag' 				" unite interface for ctags navigation
Bundle 'Shougo/unite-outline' 				" unite interface to show titles/subtitels of your buffer
Bundle 'ujihisa/unite-locate' 				" unite interface to find files
Bundle 'thinca/vim-unite-history' 			" unite interface to history tree
Bundle 't9md/vim-unite-ack' 				" unite interface to Ack (better grep)
Bundle 'Shougo/vimproc.vim' 				" async operations for plugins
Bundle 'Shougo/neocomplcache' 				" completion for lots of languages
Bundle 'lukerandall/haskellmode-vim' 			" good haskell integration
Bundle 'tpope/vim-abolish' 				" search/replace with variations
Bundle 'kshenoy/vim-signature' 				" display marks
Bundle 'ujihisa/unite-colorscheme' 			" manage colorscheme using unite
Bundle 'tpope/vim-speeddating' 				" quickly update dates using <c-a>/<c-x>
Bundle 'gregsexton/gitv' 				" gitk clone in a vime buffer
Bundle 'nvie/vim-rst-tables.git' 			" restructured text tables edition

filetype plugin indent on
