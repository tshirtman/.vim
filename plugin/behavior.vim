" behavior settings

set bs=2
set hidden
set autoread
set clipboard+=unnamed,autoselect " system clipboard as default register.
set formatoptions+=j

" ignore common non-editable files in projects
set wildignore+=**.so,**.swo,**.swn,**.swp,**.swm,**.swk,**.swl,**.pyc,**.pyo,~**.un,.buildozer*,build,doc,.git

autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
autocmd BufLeave * silent call CleanNoNameEmptyBuffers()
autocmd BufEnter Merginal:branchList nmap <buffer> <c-d> Dyes<cr><space>

" tweak comment highlight at least in python files
autocmd BufReadPost * highlight Comment cterm=italic ctermfg=grey
