local ls = require 'luasnip'

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

local mdtex_snippets = {
   s("begin", {
      t '\\begin{', i(1), t '}',
      t '\t', i(0),
      t '\\end{', i(1), t '}',
   })
}

ls.add_snippets('md', mdtex_snippets)
ls.add_snippets('tex', mdtex_snippets)

vim.cmd [[
augroup typst_maps
   au!
   "au BufEnter,BufRead,BufNewFile *.typ        inoremap $ $$<left>
   au BufEnter,BufRead,BufNewFile *.typ        inoremap <S-CR> <CR><CR><up><tab>
augroup END
]]


local tp = require 'typstar.autosnippets'
local typ_snippets = {
   tp.snip('imp', '==>>', {}, tp.in_math),
   tp.snip('st', [["s.t"]], {}, tp.in_math),
}

ls.add_snippets('typ', typ_snippets)
