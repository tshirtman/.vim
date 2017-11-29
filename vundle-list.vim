" boilerplate
filetype off
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle' " automatically manage vundle itself

Plugin 'tmhedberg/matchit'
" Plugin 'Lokaltog/vim-easymotion'  "jump directly to multiples of your motion
Plugin 'MarcWeber/vim-addon-mw-utils' " utility lib for plugins
Plugin 'alfredodeza/khuno.vim' " pep8 and others checks, async
Plugin 'bsl/obviousmode' " show which mode you are in with colors
Plugin 'ledger/vim-ledger' " ledger (accounting) file synthax hl
" Plugin 'ervandew/supertab' " <tab> should always do the right thing
" Plugin 'fs111/pydoc.vim' " python documentation integration
" Plugin 'garbas/vim-snipmate' " snippets integration
" Plugin 'groenewege/vim-less' " synthax hl for less-css
Plugin 'kien/rainbow_parentheses.vim' " color-match ()[]{}<> and friends
Plugin 'majutsushi/tagbar' " display ctags in a side buffer
Plugin 'mattn/gist-vim' " purfect integration with gist.github.com
Plugin 'mattn/webapi-vim' " utility lib for plugins
Plugin 'mattn/emmet-vim' " implementation (expand tags shortcuts) html 'zen'
" Plugin 'mileszs/ack.vim' " better grep
" Plugin 'scrooloose/syntastic' " check synthax in a lot of languages, saves you time
" Plugin 'sjl/gundo.vim' " interface to undo tree (yes, history is a tree, not a line)
Plugin 'mbbill/undotree'
" Plugin 'spiiph/vim-space' " repeat moves
Plugin 'spolu/dwm.vim' " automatically manage splits like a tiling wm
Plugin 'tomtom/tlib_vim' " util lib for plugins
Plugin 'tpope/vim-fugitive' " git interface so good it should be illegal
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat' " fix . for complex actions
Plugin 'tpope/vim-surround' " add/remove/change [](){}<>/tags around text
Plugin 'shumphrey/fugitive-gitlab.vim'  " gitlab extension to fugitive
Plugin 'tshirtman/vim-cython' " cython hightlight and utils
" Plugin 'nathanaelkane/vim-indent-guides' " display indent guides in code, sometime useful in too long methods
Plugin 'YankRing.vim' " shared yank history
" Plugin 'TaskList.vim' " buffer to show #XXX #TODO and othres in project
" Plugin 'colorv.vim' " color preview/management
Plugin 'pep8' " python pep8 checks
" Plugin 'Glench/Vim-Jinja2-Syntax' " jinja synthax hl
Plugin 'davidhalter/jedi-vim'  " python completion/refactoring best python plugin out there
" Plugin 'thinca/vim-github' " github integration
" Plugin 'pangloss/vim-javascript' " js hl
Plugin 'vimwiki' " personnal wiki
" Plugin 'walm/jshint.vim.git' " js synthax/style checks
" Plugin 'sk1418/QFGrep' " quickfix improvements
Plugin 'gregsexton/MatchTag.git' " html tag matching
" Plugin 'dhruvasagar/vim-table-mode' " table edition
" Plugin 'Shougo/unite.vim' " general purpose interface to various functions
" Plugin 'tsukkee/unite-tag' " unite interface for ctags navigation
" Plugin 'Shougo/unite-outline' " unite interface to show titles/subtitels of your buffer
" Plugin 'ujihisa/unite-locate' " unite interface to find files
" Plugin 'thinca/vim-unite-history' " unite interface to history tree
" Plugin 't9md/vim-unite-ack' " unite interface to Ack (better grep)
Plugin 'Shougo/vimproc.vim' " async operations for plugins
" Plugin 'Shougo/neocomplete.vim' " completion for lots of languages
" Plugin 'lukerandall/haskellmode-vim' " good haskell integration
Plugin 'tpope/vim-abolish' " search/replace with variations
" Plugin 'kshenoy/vim-signature' " display marks
" Plugin 'ujihisa/unite-colorscheme' " manage colorscheme using unite
Plugin 'tpope/vim-speeddating' " quickly update dates using <c-a>/<c-x>
" Plugin 'gregsexton/gitv' " gitk clone in a vime buffer
" Plugin 'nvie/vim-rst-tables.git' " restructured text tables edition
Plugin 'tpope/vim-jdaddy.git' " json formatting/manipulation
" Plugin 'tpope/vim-vinegar.git' " file manager improved
Plugin 'tpope/vim-commentary.git' " simple comment/uncomment plugin
Plugin 'tpope/vim-eunuch.git' " unix helpers
Plugin 'vim-scripts/vim-auto-save.git' " Autosave toggle
Plugin 'airblade/vim-gitgutter.git' " display git state in the sign bar
" Plugin 'arecarn/crunch.git' " calculator
Plugin 'tpope/vim-unimpaired' " fast option switching
Plugin 'wellle/targets.vim' " more text objects
Plugin 'vim-scripts/CursorLineCurrentWindow' " fix for cursor line option
Plugin 'inside/vim-search-pulse' " better visualisation of current search
" Plugin 'dahu/VimLint' " find bad configurations in vim
Plugin 'ntpeters/vim-better-whitespace'  " show and strip eol whitespaces
" Plugin 'farseer90718/vim-taskwarrior'  " taskwarrior integration
" Plugin 'bling/vim-airline'  " a nice and lightweight bar
Plugin 'chriskempson/base16-vim'
" Plugin 'junegunn/goyo.vim' " distraction-free writting
" Plugin 'junegunn/limelight.vim' " focus on current paragraph
Plugin 'AndrewRadev/splitjoin.vim' " split/join lines on steroids
Plugin 'chrisbra/unicode.vim' " unicode/digraph manipulation
Plugin 'vim-pandoc/vim-pandoc'  " Pandoc integration
Plugin 'vim-pandoc/vim-pandoc-syntax' " Pandoc syntax integration
Plugin 'dietsche/vim-lastplace.git' " open buffer to last edition place
Plugin 'wincent/ferret' " async search/replace in multiple files (Ack)
Plugin 'chrisbra/vim-diff-enhanced'  " allow using git diff --patience for diffs
Plugin 'jamessan/vim-gnupg' " transparent edit of .gpg files
Plugin 'ludovicchabant/vim-gutentags'  " auto generate tags
Plugin 'romainl/vim-qf'  " tame the quickfix window
Plugin 'mrtazz/simplenote.vim'  " simple note sharing
Plugin 'ajh17/VimCompletesMe'  " lighter powerful completion
Plugin 'mgedmin/pytag.vim'
Plugin 'junegunn/fzf'     " fuzzy finder and a lot more (executable)
Plugin 'junegunn/fzf.vim' " vim plugin to go with it
Plugin 'w0rp/ale' " async linter
Plugin 'posva/vim-vue'
Plugin 'lilydjwg/colorizer'
Plugin 'tpope/vim-rsi'  " better readline-like keybinding support
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'romainl/vim-cool'
Plugin 'neomutt/neomutt.vim'

filetype plugin indent on
