" use a seperate file to store history, so it works cross-session
if exists('&undofile')
  set undofile
  set undodir=$HOME/.vim/undofiles
else
  echom "no undofiles"
endif
