return {
   'nvim-telescope/telescope.nvim',
   tag = 'v0.2.1',
   dependencies = {
      'nvim-lua/plenary.nvim',

      -- Extentions
      'nvim-telescope/telescope-ui-select.nvim',
   },
   event = 'VeryLazy',
   config = function()
      local ts = require 'telescope'
      ts.setup {
         extensions = {
            themes = {
               layout_config = {
                  horizontal = {
                     width = 0.8,
                     height = 0.7,
                  },
               },
               ignore = {},
               light_themes = { ignore = true },
            },
         },
      }
      ts.load_extension 'ui-select'
      local status, _ = pcall(require, 'noice')
      if status then
         ts.load_extension 'noice'
      end
   end,
   keys = {
      --> Find
      { '<space>ft', '<cmd>Telescope builtin<CR>',                               desc = 'Find Telescope commands' },

      { '<space>fd', '<cmd>Telescope diagnostics<CR>',                           desc = 'Find diagnostics' },
      { '<space>fr', '<cmd>Telescope lsp_references<CR>',                        desc = 'Find References' },
      { '<space>fi', '<cmd>Telescope lsp_implementations<CR>',                   desc = 'Find Implementations' },
      { '<space>fh', '<cmd>Telescope help_tags<CR>',                             desc = 'Find Help' },

      { '<space>fg', '<cmd>Telescope live_grep<CR>',                             desc = 'Live grep' },

      { '<space>fa', '<cmd>Telescope find_files hidden=true<CR>',                desc = 'Find All Files (also hidden)' },
      { '<space>fA', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>', desc = 'Find All Files (hidden & ignored)' },
      { '<space>fb', '<cmd>Telescope buffers<CR>',                               desc = 'Find Buffers' },
      { '<space>fo', '<cmd>Telescope oldfiles<CR>',                              desc = 'Open Recent File' },

      { '<space>fm', '<cmd>Telescope marks<CR>',                              desc = 'Open Recent File' },

      { '<space>fs', '<cmd>Telescope lsp_document_symbols<CR>',                  desc = 'Find Symbols' },
      { '<space>fS', '<cmd>Telescope lsp_workspace_symbols<CR>',                 desc = 'Workspace Symbols' },
      { '<space>fw', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>',         desc = 'Dyn Workspace Symbols' },
      -- + Broot commands
   }
}
