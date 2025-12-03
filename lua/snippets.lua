local ls = require 'luasnip'

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

local tex_snippets = {
   s("begin", {
      t '\\begin{', i(1), t '}',
      t '\t', i(0),
      t '\\end{', i(1), t '}',
   })
}

ls.add_snippets('tex', tex_snippets)

vim.cmd [[
augroup typst_maps
   au!
   "au BufEnter,BufRead,BufNewFile *.typ        inoremap cnt continuous
   "au BufEnter,BufRead,BufNewFile *.typ        inoremap disc discontinuous
   "au BufEnter,BufRead,BufNewFile *.typ        inoremap fn function
   "au BufEnter,BufRead,BufNewFile *.typ        inoremap <S-CR> <CR><CR><up><tab>
   au BufEnter,BufRead,BufNewFIle *.rs          inoremap ;str &'static str
   au BufEnter,BufRead,BufNewFIle *.rs          inoremap ;l '

augroup END
]]


local tp = require 'typstar.autosnippets'

ls.add_snippets('typst', {
   tp.snip('imp', '==>>', {}, tp.in_math),
   tp.snip('st', [["s.t"]], {}, tp.in_math),
   tp.snip('fn', 'function', {}, tp.in_markup),
   tp.snip('cnt', 'continuous', {}, tp.in_markup),
   tp.snip('disc', 'discontinuous', {}, tp.in_markup),
   tp.snip('sqrt', 'square root', {}, tp.in_markup),
   tp.snip('lg', 'logarithm', {}, tp.in_markup),
   tp.snip('eva', 'eigenvalue', {}, tp.in_markup),
   tp.snip('evv', 'eigenvector', {}, tp.in_markup),
   tp.snip('inv', '^(-1)', {}, tp.in_math),
})
