return {
   "nvim-treesitter/nvim-treesitter",
   branch = "main",
   lazy = false,
   build = ":TSUpdate",
   config = function()
      local ts = require("nvim-treesitter")

      ts.install({
         -- Neovim
         "lua", "luadoc", "vim", "vimdoc", "regex",

         -- Shell
         "fish", "bash", "elvish",

         -- Programming
         "rust", "c", "cpp",
         "zig", "nim", "c3",
         "python",
         "haskell",

         -- Web
         "javascript", "html", "css",

         -- Build
         "make", "dockerfile", "just",
         "nix",

         -- Config
         "toml", "json", "ini", "ron",

         -- Docs
         "latex", "typst", "markdown", "markdown_inline", "mermaid",

         -- Misc
         "wgsl", "mlir",
      })

      vim.api.nvim_create_autocmd("FileType", {
         callback = function()
            local ok, _ = pcall(vim.treesitter.start)

            -- Enable indentation (experimental) and foldmethod
            if ok then
               vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
               vim.wo.foldmethod = 'expr'
            end
         end,
      })
   end,
}
