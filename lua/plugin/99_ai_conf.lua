return {
   'ThePrimeagen/99',
   opts = {
      completion = {
         custom_rules = {
            "scratch/custom_rules/",
         },
         source = "cmp",
      },

      md_files = {
         "AGENT.md",
      },
   },

   keys = {
      { "<space>9f", function() require '99'.fill_in_function() end, mode = "n" },
      { "<space>9f", function() require '99'.visual() end,           mode = "v" },
      { "<space>9v", function() require '99'.visual_prompt() end,    mode = "v" },
      { "<space>9s", function() require '99'.stop_all_requests() end },
   }
}
