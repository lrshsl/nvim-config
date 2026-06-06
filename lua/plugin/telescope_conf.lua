return {
   'nvim-telescope/telescope.nvim',
   tag = 'v0.2.1',
   dependencies = {
      'nvim-lua/plenary.nvim',

      -- Extentions
      'nvim-telescope/telescope-ui-select.nvim',
   },
   lazy = false,
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
}
