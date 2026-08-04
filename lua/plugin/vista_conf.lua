return {
   'liuchengxu/vista.vim',
   cmd = 'Vista',
   init = function()
      -- vim.g.vista_default_executive = 'nvim_lsp'
      vim.g.vista_sidebar_width = 40
      vim.g.close_on_jump = 1
   end,
   keys = {
      { '<space>;v', '<cmd>Vista focus<cr>', desc = 'Focus / Open Vista' },
   }
}
