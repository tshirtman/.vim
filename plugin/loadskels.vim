" auto loading of template files for various programming language at file
" creation
" When editing a new file, load skeleton if any.
" If we find <+FILENAME+> in skeleton, replace it by the filename.
" If we find <+HEADERNAME+> in skeleton, replace it by the filename
" uppercase with . replaced by _ (foo.h become FOO_H).
autocmd BufNewFile *
        \ let ext = expand("%:e") |
        \ if !ext |
        \   let ext = expand("%") |
        \ endif |
        \ let skel = $HOME . "/.vim/skeletons/skel." . ext |
        \ if filereadable(skel) |
        \   execute "silent! 0read " . skel |
        \   let fn = expand("%") |
        \   let hn = substitute(expand("%"), "\\w", "\\u\\0", "g") |
        \   let hn = substitute(hn, "\\.", "_", "g") |
        \   let hn = substitute(hn, "/", "_", "g") |
        \   let cn = expand("%:t:r") |
        \   %s/<+FILENAME+>/\=fn/Ige |
        \   %s/<+HEADERNAME+>/\=hn/Ige |
        \   %s/<+CLASSNAME+>/\=cn/Ige |
        \   unlet fn hn cn |
        \ endif |
        \ unlet skel |
        \ goto
