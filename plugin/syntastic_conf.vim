" syntastic configuration
let g:syntastic_mode_map = { 'mode': 'active',
                            \'active_filetypes': ['ruby', 'php', 'python', 'c'],
                            \'passive_filetypes': ['puppet'] }

let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_jump=0
"let g:syntastic_auto_loc_list=0
let g:syntastic_auto_loc_ist=0
"let g:syntastic_auto_loc_list=2
