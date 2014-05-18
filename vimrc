" I try to keep the vimrc short, so most config is in small plugins
" some of these small plugins have pretty strong effects, so you may want to
" check them if you are using my conf and you are not me (if you are me, you
" may disregard that and question your sanity because you are talking to
" yourself)

" load vundle config, this is better left at the top
source ~/.vim/vundle-list.vim
set shell=/bin/sh

" cleanup autocommands to avoid slowdown on .vimrc reloads
autocmd!

syntax on
filetype plugin indent on

" easier to type than \
let mapleader = ","

" plugin specific configs that can't go into plugins

" use ack-grep
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" change ctrl-p shortcut because of conflict with replace paste
let g:ctrlp_map = '<c-b>'
let g:ctrlp_max_height = 100

" easier call to emmet
let g:user_emmet_leader_key = '<leader>e'

" yankring mappings
let g:yankring_replace_n_nkey = '<c-é>'

" unite replace yankring
let g:unite_source_history_yank_enable = 1

" rst table, change mappings
let no_rst_table_maps = 1
noremap <leader>tc :call ReformatTable()<CR>
noremap <leader>tf :call ReflowTable()<CR>
