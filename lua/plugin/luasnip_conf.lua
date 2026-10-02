return {
   'L3MON4D3/LuaSnip',
   build = 'make install_jsregexp',
   event = 'InsertEnter',
   opts = {
      enable_autosnippets = true,
      -- store_selection_keys = '<Tab>',
   },
   init = function()
      local ls = require("luasnip")

      vim.keymap.set({ "i", "s" }, "<C-i>", function() ls.jump(1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-h>", function() ls.jump(-1) end, { silent = true })
   end
}
