return {
   'mbbill/undotree',
   cmd = { 'UndotreeToggle', 'UndoTreeFocus' },
   init = function()
      -- Automatically focus Undotree when opened
      vim.g.undotree_SetFocusWhenToggle = 1
   end,
   keys = {
      { '<space>;u', '<cmd>UndotreeToggle<CR>', desc = 'Undo Tree' },
   }
}
