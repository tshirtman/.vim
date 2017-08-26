" ~/.vim/after/syntax/kivy.vim
"
" Vim syntax file
" Language:	Kivy
" Maintainer:	Gabriel Pettier <gabriel.pettier@gmail.com>
" Last Change:	2017 august 26 

syntax clear

syn include @pyth $VIMRUNTIME/syntax/python.vim

syn match kivyComment       /#.*\n/ display contains=pythonTodo,Spell
syn match kivyPreProc       /^#:.*/
syn match kivyAttribute     /\I\i*/ nextgroup=kivyValue
syn match kivyBind          /on_\I\i*:/ nextgroup=kivyValue
syn match kivyRule          /<-*\I\i*\([,@]s*\I\i*\)*>:/
syn match kivyRootRule      /^\I\i*:$/
"
syn region kivyAttribute start=/^\z(\s\+\)\l\+:\n\1\s\{4}/ skip=/^\z1\s\{4}.*$/ end=/^$/ contains=@pyth
"
syn region kivyBind start=/^\z(\s\+\)on_\i\+:\n\1\s\{4}/ skip=/^\z1\s\{4}.*$/ end=/^$/ contains=@pyth
syn region kivyBind start=/on_\i\+:\s/ end=/$/ contains=@pyth

syn match kivyValue /\(id\s*\)\@<!:\s*.*$/ contains=@pyth skipwhite
syn match kivyId   /\(id:\s*\)\@<=\w\+/  

syn match kivyCanvas         /^\s*canvas.*:$/
 
hi def link kivyPreproc      PreProc
hi def link kivyComment      Comment
hi def link kivyRule         Function
hi def link kivyRootRule     Function
hi def link kivyIdent        Statement
hi def link kivyAttribute    Label
hi def link kivyBind         Function
hi def link kivyCanvas       special
hi KivyId cterm=underline
hi KivyPreproc cterm=bold
