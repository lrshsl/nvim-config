return {
   'jakemason/ouroboros',
   ft = { "c", "cpp", "h", "hh", "hpp", "pyx", "pxd" },
   config = function()
      require 'ouroboros'.setup {
         extension_preferences_table = {
            c = { h = 1 },
            cpp = { hpp = 3, hh = 2, h = 1 },

            h = { c = 2, cpp = 1 },
            hh = { cpp = 2, c = 1 },
            hpp = { cpp = 2, c = 1 },

            pyx = { pxd = 1 },
            pxd = { pyx = 1 },
         }
      }

      vim.cmd [[
         command! -nargs=0 Ouroboros lua require'ouroboros'.switch()
      ]]
   end
}
