" auto reload .vimrc when i save it
au BufWritePost $MYVIMRC silen so $MYVIMRC | syn on

" auto relead a .vim file when i save it
au BufWritePost *.vim source % | syn on

" easy opening of .vimrc
noremap <leader>ev :split $MYVIMRC<cr>
