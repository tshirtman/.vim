function! s:FGforBG(bg)
   " takes a 6hex color code and returns a matching color that is visible
   let pure = substitute(a:bg,'^#','','')
   let r = eval('0x'.pure[0].pure[1])
   let g = eval('0x'.pure[2].pure[3])
   let b = eval('0x'.pure[4].pure[5])
   if r*30 + g*59 + b*11 > 12000
      return '#000000'
   else
      return '#ffffff'
   end
endfunction

function! s:PreviewCSSColorInLine(where)
   " TODO use cssColor matchdata
   let foundcolor = matchstr( getline(a:where), '#[0-9A-Fa-f]\{3,6\}\>' )
   let color = ''
   let wosharp = ''
   let group = ''
   if foundcolor != ''
      if foundcolor =~ '#\x\{6}$'
         let color = foundcolor
      elseif foundcolor =~ '#\x\{3}$'
         let color = substitute(foundcolor, '\(\x\)\(\x\)\(\x\)', '\1\1\2\2\3\3', '')
      else
         let color = ''
      endif
      if color != ''
         let wosharp = substitute(color,'^#','','')
         let group = 'cssColor'.wosharp
         exe 'syn match '.group.' /'.foundcolor.'/ contained'
         exe 'syn cluster cssColors add='.group
         exe 'hi '.group.' guifg='.s:FGforBG(color)
         exe 'hi '.group.' guibg='.color
         return 1
      else
         return 0
      endif
   else
      return 0
   endif
endfunction

if has("gui_running")
   let i = 1
   while i <= line("$")
      call s:PreviewCSSColorInLine(i)
      let i = i+1
   endwhile
   unlet i

   autocmd CursorHold * silent call s:PreviewCSSColorInLine('.')
   autocmd CursorHoldI * silent call s:PreviewCSSColorInLine('.')
   set ut=100
endif		" has("gui_running")
