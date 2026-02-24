return {
   'arne314/typstar',
   dependencies = {
      -- {
      --    "pxwg/math-conceal.nvim",
      --    event = "VeryLazy",
      --    main = "math-conceal",
      --    --- @type LaTeXConcealOptions
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
      {
         '<Tab>',
         '<Cmd>TypstarSmartJump<CR>',
         mode = { 's', 'i' },
      },
      {
         '<S-Tab>',
         '<Cmd>TypstarSmartJumpBack<CR>',
         mode = { 's', 'i' },
      },
   },
   config = function()
      require 'lsp' -- Make sure it loads first
      require 'typstar'
          .setup {
             add_undo_breakpoints = true,
             snippets = {
                enable = true,
                exclude = {
                   'vv', 'st', 'ip', 'ib', 'el', 'ep', 'iv', 'sq', 'rt', 'ub', 'and', 'or'
                },
             },
          }
   end,
}
