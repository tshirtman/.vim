"This vim script can be used when editing xml files.
"
" source it, or runtime it from ftplugin/xml.vim.
"
" Usage:
"
"    when inserting type:
"
"    para,,,
"
"    This gets immediately translated to
"    <para>
"    </para>
"    If word is not alone on a line the xml element is kept on one line.
"	<para><emphasis>hello</emphasis></para>
"
"	version 1.1 works with xml elements of one character. 

" Bart van Deenen , www.vandeenensupport.com
function! Make_element()
	if match(getline('.'),'^\s*>\s*$') == -1
		"the deleted word was not alone on the line
		 let @w = "i<pla</pa>F<i"
	else
		"the deleted word was on it's own on the line
		 let @w = "i<po</pa>kA"
	endif
endfunction

"include colon(58) for namespaces in xsl for instance
setlocal iskeyword=@,48-57,_,192-255,58
inoremap <buffer>  ,,, ><Esc>db:call Make_element()<enter>@w


" These mappings and TagSelection function will allow you to place 
" an XML tag around either the current word, or the current selected 
" text. 
" If the visual select is on a single line, the tag is wrapped 
" around the text <this>way</this>.  If the visual select extends 
" over multiple lines, the tag is wrapped around the text 
"     <this> 
"     way 
"     </this> 
"     
" When you are prompted for the tag name, you can enter: 
"     Tag name?  p class="classname" attri="bute" 
" The select is wrapped with: 
"     <p class="classname" attri="bute"> 
"     Your selection 
"     </p> 
" Notice the attributes have been stripped from the closing tag. 
" 
" Use nmap, not nnoremap, since we do want to use an existing mapping 
nmap ,,, viw,,, 
vnoremap ,,, <Esc>:call TagSelection()<CR> 

function! TagSelection() 
  let tag = input("Tag name (include attributes)? ") 

  if strlen(tag) == 0 
      return 
  endif 

  " Save b register 
  let saveB = @b 
  let curl  = line(".") 
  let curc  = col(".") 

  " If the visual selection is over multiple lines, then place the 
  " data between the tags on newlines: 
  "    <tag> 
  "    data 
  "    </tag> 
  let newline = '' 
  if getline("'>") != getline("'<") 
      let newline = "\n" 
      let curl  = line("'>") 
  endif 

  " Strip off all but the first word in the tag for the end tag 
  let @b = newline . substitute( tag, '[ \t"]*\(\<\S*\>\).*', '<\/\1>\e', "" ) 
  let curc = curc + strlen(@b) 
  exec "normal `>a\<C-R>b" 

  let @b = substitute( tag, '[ \t"]*\(\<.*\)', '<\1>\e', "" ) . newline 
  let curc = curc + strlen(@b) 
  exec "normal `<i\<C-R>b" 

  " Restore b register 
  let @b = saveB 

  call cursor(curl, curc) 
endfunction
