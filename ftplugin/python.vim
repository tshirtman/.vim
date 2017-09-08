" trying to put all python-specific configuration here

" pep8 style
set softtabstop=4
set textwidth=79
set shiftwidth=4
set expandtab
set tabstop=8
set list
set listchars=tab:__,trail:.

" More syntax highlighting.
let python_highlight_all = 1

" Smart indenting
set cinwords=if,elif,else,for,while,try,except,finally,def,class

" Auto completion via ctrl-space (instead of the nasty ctrl-x ctrl-o)
"set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
inoremap <Nul> <C-x><C-o>

" Wrap at 72 chars for comments.
set formatoptions=cq textwidth=72 foldignore= wildignore+=*.py[co]

" usable folding?
set foldmethod=indent
set foldminlines=5
set foldnestmax=2
set foldlevelstart=99
set foldlevel=99

" `gf` jumps to the filename under the cursor.  Point at an import statement
" and jump to it!
"    python << EOF
"    import os
"    import sys
"    import vim
"    for p in sys.path:
"        if os.path.isdir(p):
"            vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
"    EOF

set makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p
set errorformat=%f:%l:\ %m

"" fix completion for virtualenv modules!
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUAL_ENV' in os.environ:
    "project_base_dir = os.environ['VIRTUAL_ENV']
    "sys.path.insert(0, project_base_dir)
    "activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    "execfile(activate_this, dict(__file__=activate_this))
"EOF

" pudb auto insert
iabbr pudb import pudb; pudb.set_trace()
nnoremap <leader>u oimport pudb; pudb.set_trace()<esc>
iabbr ifname if __name__ == '__main__':
