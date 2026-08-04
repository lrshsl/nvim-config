return {
   'exafunction/codeium.nvim',
   cmd = 'Codeium',
   opts = {
      enable_cmp_source = false,
      virtual_text = {
         enabled = true,
         map_keys = true,
         key_bindings = {
            accept = '<C-S-y>',
            accept_word = '<C-S-;>',
            next = '<C-S-n>',
            prev = '<C-S-e>',
            clear = '<C-;>',
         }
      }
   },
   init = function()
      vim.cmd 'hi CodeiumSuggestion guifg=#b0b0b0'
   end,
}
