return {
   'exafunction/codeium.nvim',
   opts = {
      enable_cmp_source = false,
      virtual_text = {
         enabled = true,
         map_keys = true,
         key_bindings = {
            accept = '<C-S-y>',
         }
      }
   },
   init = function()
      vim.cmd 'hi CodeiumSuggestion guifg=#b0b0b0'
   end,
   cmd = 'Codeium'
}
