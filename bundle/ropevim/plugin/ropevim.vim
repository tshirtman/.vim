function! LoadRope(current_path)
python << EOF
import sys
import os
import vim
sys.path.append(os.path.dirname(vim.eval("a:current_path")))
import ropevim
EOF
endfunction

let current_path = expand("<sfile>")
call LoadRope(current_path)
