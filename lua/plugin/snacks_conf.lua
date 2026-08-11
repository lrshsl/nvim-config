return {
   "folke/snacks.nvim",
   priority = 1000,
   lazy = false,
   ---@type snacks.Config
   opts = {
      bigfile = { enable = true },
      dashboard = {
         autokeys = "arstneio1234567890",
         preset = {
            keys = {
               { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
               { icon = " ", key = "s", desc = "Select Project", section = "session" },
               { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
               { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
               { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
               { icon = " ", key = "q", desc = "Quit", action = ":qa" },
            }
         },
         sections = {
            { section = "header" },
            { section = "keys",  gap = 1, padding = 2 },
            {
               pane = 2,
               icon = " ",
               title = "Recent Files",
               section = "recent_files",
               indent = 2,
               padding = 2,
            },
            {
               pane = 2,
               icon = " ",
               title = "Projects",
               section = "projects",
               indent = 2,
               padding = 2,
            },
            {
               pane = 2,
               icon = " ",
               title = "Git Status",
               cmd = "git --no-pager diff --stat -B -M -C",
               height = 10,
               padding = 2,
            },
            { section = "startup" },
         },
      },
      explorer = { enabled = true },
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
      scope = { enabled = true },
      scroll = {
         enabled = false,
         animate = {
            duration = { step = 5, total = 50 },
            easing = "linear",
         },
      },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      picker = {
         enabled = false,
         sources = {
            explorer = {
            }
         }
      },
      lazygit = {
         configure = true,
      }
   },
   keys = {
      { '<space>of', function() require 'snacks'.explorer() end, desc = 'File explorer' },
      { '<space>og', function() require 'snacks'.lazygit() end,  desc = '[Lazy]Git' },
   }
}
