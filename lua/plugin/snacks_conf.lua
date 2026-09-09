return {
   "folke/snacks.nvim",
   priority = 1000,
   lazy = false,
   ---@type snacks.Config
   opts = {
      bigfile = { enable = true },
      explorer = { enabled = true },
      -- dashboard = require 'plugin.dashboard_conf',
      image = { enabled = true },
      input = { enabled = true },
      indent = {
         enabled = true,
         only_scope = false,
         indent = {
            only_scope = false,
         },
      },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      lazygit = {
         configure = true,
      },
      zen = {
         toggles = {
            dim = true,
            git_signs = false,
            mini_diff_signs = false,
            -- diagnostics = false,
            inlay_hints = false,
         },
         center = true,
         show = {
            statusline = false,
            tabline = false,
         },
         win = { style = "zen" },
         -- on_open = function(win) end,
         -- on_close = function(win) end,
      },

      scope = { enabled = false },
      scroll = {
         enabled = false,
         animate = {
            duration = { step = 5, total = 50 },
            easing = "linear",
         },
      },
      picker = {
         enabled = false,
         sources = {
            explorer = {
            }
         }
      },
   },
   keys = {
      { '<space>of', function() require 'snacks'.explorer() end, desc = 'File explorer' },
      { '<space>og', function() require 'snacks'.lazygit() end,  desc = '[Lazy]Git' },

      { '<space>,z', function() require 'snacks'.zen() end,      desc = 'Toggle zen mode' },
   }
}
