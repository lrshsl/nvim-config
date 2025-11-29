local mark = function() return require 'harpoon.mark' end
local ui = function() return require 'harpoon.ui' end

return {
   "ThePrimeagen/harpoon",

   keys = {
      { '<leader>aa', function() ui().toggle_quick_menu() end, desc = "Quick Menu" },
      { '<leader>af', function() mark().add_file() end,        desc = "Add file" },
      { '<leader>an', function() ui().nav_file(1) end,         desc = "File <n>" },
      { '<leader>ae', function() ui().nav_file(2) end,         desc = "File <e>" },
      { '<leader>ai', function() ui().nav_file(3) end,         desc = "File <i>" },
      { '<leader>ao', function() ui().nav_file(4) end,         desc = "File <o>" },
   }
}
