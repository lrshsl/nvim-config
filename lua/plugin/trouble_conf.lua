return {
   'folke/trouble.nvim',
   dependencies = {
      'nvim-tree/nvim-web-devicons'
   },
   focus = true,
   opts = {
      -- Autofocus on open
      focus = true,

      win = {
         position = "bottom",
      },
      modes = {
         lsp_errors = {
            mode = 'diagnostics',
            filter = {
               severity = vim.diagnostic.severity.ERROR
            }
         }
      },
   },
   cmd = "Trouble",
   keys = {
      {
         "<leader>od",
         "<cmd>Trouble diagnostics toggle<CR>",
         desc = "Diagnostics (Trouble)",
      },
      {
         '<space>oD',
         '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',
         desc = 'Diagnostics',
      },
      {
         "<leader>os",
         "<cmd>Trouble symbols toggle focus=false<CR>",
         desc = "Symbols (Trouble)",
      },
      {
         "<leader>ol",
         "<cmd>Trouble lsp toggle<CR>",
         desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
         "<leader>oL",
         "<cmd>Trouble loclist toggle<CR>",
         desc = "Location List (Trouble)",
      },
      {
         "<leader>oq",
         "<cmd>Trouble qflist toggle<CR>",
         desc = "Quickfix List (Trouble)",
      },
      {
         '<space>oe',
         '<cmd>Trouble lsp_errors toggle<CR>',
         desc = 'Errors',
      },
   },
}
