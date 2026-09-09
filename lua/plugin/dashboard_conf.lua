return {
   autokeys = "arstneio1234567890",
   preset = {
      keys = {
         { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
         { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
      }
   },
   sections = {
      { section = "header" },
      { section = "keys",  gap = 1, padding = 2 },
      {
         icon = " ",
         title = "Projects",
         section = "projects",
         indent = 2,
         padding = 2,
      },
      {
         icon = " ",
         title = "Git Status",
         cmd = "git --no-pager diff --stat -B -M -C",
         height = 10,
         padding = 2,
      },
      { section = "startup" },
   },
}
