if has('gui_running')
	set guioptions=
else
        set t_Co=256
endif

let base16colorspace=256
colorscheme base16-default-dark

" error colors
highlight SpellBad ctermfg=220 ctermbg=1
