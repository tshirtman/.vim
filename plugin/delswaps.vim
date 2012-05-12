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
    return 'd'
    #vim.command("let v:swapchoice='d'")

    #else:
    #    vim.command("let v:swapchoice='r'")

endpython
endfunction

" bind CheckSwapfile function to SwapExists
autocmd SwapExists * let v:swapchoice = CheckSwapfile()

