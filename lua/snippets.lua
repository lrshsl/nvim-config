vim.cmd [[
augroup typst_maps
   au!
   au BufEnter,BufRead,BufNewFile *.rs          inoremap <buffer> ;str &'static str
   au BufEnter,BufRead,BufNewFile *.rs          inoremap <buffer> ;l '
   au BufEnter,BufRead,BufNewFile *.rs          inoremap <buffer> ;ve vec![]<left>
   au BufEnter,BufRead,BufNewFile *.rs          inoremap <buffer> ;print println!("");<c-o>2<left>

   au BufEnter,BufRead,BufNewFile *.typ          inoremap <buffer> ;ep epsilon
   au BufEnter,BufRead,BufNewFile *.typ          inoremap <buffer> hh1 #h(1em)
   au BufEnter,BufRead,BufNewFile *.typ          inoremap <buffer> hh2 #h(2em)
   au BufEnter,BufRead,BufNewFile *.typ          inoremap <buffer> hh3 #h(3em)
augroup END
]]
