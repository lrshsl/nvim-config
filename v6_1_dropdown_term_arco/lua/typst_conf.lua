return {
   'arne314/typstar',
   dependencies = {
      {
         'MrPicklePinosaur/typst-conceal.vim',
         ft = 'typst',
         config = function()
            vim.o.conceallevel = 2
         end,
      },
   },
   ft = { 'typst' },
   keys = {
      {
         '<M-n>',
         '<Cmd>TypstarSmartJump<CR>',
         mode = { 's', 'i' },
      },
      {
         '<M-e>',
         '<Cmd>TypstarSmartJumpBack<CR>',
         mode = { 's', 'i' },
      },
   },
   config = function()
      local typstar = require 'typstar'
      require 'lsp'
      typstar.setup {
         enable_autosnippets = true,
         store_selection_keys = '<Tab>',
         add_undo_breakpoints = true,
         snippets = {
            enable = true,
         },
      }
   end,
}
