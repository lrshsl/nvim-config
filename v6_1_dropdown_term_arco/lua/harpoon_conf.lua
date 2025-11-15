local mark = function() return require 'harpoon.mark' end
local ui = function() return require 'harpoon.ui' end

return {
   "ThePrimeagen/harpoon",

   keys = {
      { '<leader>aa', function() ui().toggle_quick_menu() end },
      { '<leader>af', function() mark().add_file() end },
      { '<leader>an', function() ui().nav_file(1) end },
      { '<leader>ae', function() ui().nav_file(2) end },
      { '<leader>ai', function() ui().nav_file(3) end },
      { '<leader>ao', function() ui().nav_file(4) end },
   }
}
