return {
   'nvim-telescope/telescope.nvim',
   tag = '0.1.5',
   dependencies = {
      'nvim-lua/plenary.nvim',

      -- Extentions
      'nvim-telescope/telescope-ui-select.nvim',
      'andrew-george/telescope-themes',
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
      ts.load_extension('ui-select')
      ts.load_extension('themes')
   end,
}
