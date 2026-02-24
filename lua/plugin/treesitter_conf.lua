return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
         ensure_installed = {
            "lua", "vim", "vimdoc", "regex", "markdown", "markdown_inline",
            "c", "rust",
            "bash", "fish",
            "html" },
         sync_install = false,
         highlight = { enable = true },
         indent = { enable = false }, -- Had trouble with it
      })
   end
}
