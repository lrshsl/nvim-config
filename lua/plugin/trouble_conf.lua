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
         "<cmd>Trouble symbols toggle focus=true<CR>",
         desc = "Symbols (Trouble)",
      },
      {
         "<leader>oS",
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
      --
      -- Modes:
      --
      -- * diagnostics: diagnostics
      -- * fzf: FzfLua results previously opened with `require('trouble.sources.fzf').open()`.
      -- * fzf_files: FzfLua results previously opened with `require('trouble.sources.fzf').open()`.
      -- * loclist: Location List
      -- * lsp: LSP definitions, references, implementations, type definitions, and declarations
      -- * lsp_command: command
      -- * lsp_declarations: declarations
      -- * lsp_definitions: definitions
      -- * lsp_document_symbols: document symbols
      -- * lsp_implementations: implementations
      -- * lsp_incoming_calls: Incoming Calls
      -- * lsp_outgoing_calls: Outgoing Calls
      -- * lsp_references: references
      -- * lsp_type_definitions: type definitions
      -- * qflist: Quickfix List
      -- * quickfix: Quickfix List
      -- * snacks: Snacks results previously opened with `require('trouble.sources.snacks').open()`.
      -- * snacks_files: Snacks results previously opened with `require('trouble.sources.snacks').open()`.
      -- * symbols: document symbols
      -- * telescope: Telescope results previously opened with `require('trouble.sources.telescope').open()`.
      -- * telescope_files: Telescope results previously opened with `require('trouble.sources.telescope').open()`.
   },
}
