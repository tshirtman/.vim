" behavior settings

set bs=2
set hidden
set autoread
set clipboard+=unnamed,autoselect " system clipboard as default register.

" ignore common non-editable files in projects
set wildignore+=**.so,**.swo,**.swn,**.swp,**.swm,**.swk,**.swl,**.pyc,**.pyo,~**.un,.buildozer*,build,doc,.git

autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
autocmd BufLeave * silent call CleanNoNameEmptyBuffers()
