function StartConceal()
end

return {
   'arne314/typstar',
   dependencies = {
      require 'plugin.luasnip_conf',
      -- {
      --    "pxwg/math-conceal.nvim",
      --    cmd = StartConceal,
      --    main = "math-conceal",
      --    opts = {
      --       conceal = {
      --          "greek",
      --          "script",
      --          "math",
      --          "font",
      --          "delim",
      --          "phy",
      --       },
      --       ft = { "plaintex", "tex", "context", "bibtex", "markdown", "typst" },
      --    },
      -- }
   },
   ft = { 'typst' },
   keys = {
      -- { '<Tab>',   '<Cmd>TypstarSmartJump<CR>',     mode = { 's', 'i' }, ft = 'typst' },
      -- { '<S-Tab>', '<Cmd>TypstarSmartJumpBack<CR>', mode = { 's', 'i' }, ft = 'typst' },
   },
   config = function()

      require 'typstar'
          .setup {
             add_undo_breakpoints = true,
             snippets = {
                enable = true,
                exclude = {
                   'vv', 'st', 'ip', 'ib', 'el', 'ep', 'iv', 'sq', 'rt', 'ub', 'and', 'or', 'vi'
                },
             },
          }

      local ls = require 'luasnip'
      local tp = require 'typstar.autosnippets'

      ls.add_snippets('typst', {
         tp.snip('IMP', '==>>', {}, tp.in_math),
         tp.snip('st', [["s.t"]], {}, tp.in_math),
         tp.snip('fn', 'function', {}, tp.in_markup),
         tp.snip('cnt', 'continuous', {}, tp.in_markup),
         tp.snip('dcnt', 'discontinuous', {}, tp.in_markup),
         tp.snip('sqrt', 'square root', {}, tp.in_markup),
         tp.snip('lg', 'logarithm', {}, tp.in_markup),
         tp.snip('egva', 'eigenvalue', {}, tp.in_markup),
         tp.snip('egve', 'eigenvector', {}, tp.in_markup),
         tp.snip('inv', '^(-1)', {}, tp.in_math),
         tp.snip('dd', 'dot.double', {}, tp.in_math),
         tp.snip('exrc', '#exercise', {}, tp.in_markup),
      })
   end,
}
