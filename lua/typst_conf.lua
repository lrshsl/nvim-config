return {
   'arne314/typstar',
   dependencies = {
      {
         'pxwg/math-conceal.nvim',
         build = "make lua51",
         main = "math-conceal",
         --- @type LaTeXConcealOptions
         opts = {
            enabled = true,
            conceal = {
               "greek",
               "script",
               "math",
               "font",
               "delim",
               "phy",
            },
            ft = { "*.tex", "*.md", "*.typ" },
         },
         ft = 'typst'
      },
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
                   'vv', 'st', 'ip', 'ib', 'el', 'ep', 'iv',
                },
             },
          }
   end,
}
