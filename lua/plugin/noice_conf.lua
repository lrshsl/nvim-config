return {
   "folke/noice.nvim",
   event = "VeryLazy",
   opts = {
      lsp = {
         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
         override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
         },
      },
      messages = {
         view = "mini"
      },
      redirect = {
         view = "popup",
         filter = { event = "msg_show" },
      },
      presets = {
         bottom_search = false,        -- use a classic bottom cmdline for search
         command_palette = true,       -- position the cmdline and popupmenu together
         long_message_to_split = true, -- long messages will be sent to a split
         inc_rename = true,            -- enables an input dialog for inc-rename.nvim
         lsp_doc_border = true,        -- add a border to hover docs and signature help
      },
      views = {
         vsplit = {
            enter = true,
            size = "80%",
         },
      },
      routes = {
         {
            view = "vsplit",
            filter = {
               event = "msg_show",
               kind = { "shell_out", "shell_err" }, -- show :! command output in split
            },
         },
      },
      health = { checker = false },
   },
   dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",

      {
         "rcarriga/nvim-notify",
         opts = {
            timeout = 0,
            stages = "fade_in_slide_out",
         }
      },
   },
}
