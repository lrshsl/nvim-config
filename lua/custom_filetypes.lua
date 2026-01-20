local expandr_project_root = "/code/parsing/expandr"

vim.filetype.add {
   extension = {
      exr = 'exr',
   }
}

vim.lsp.config.expandr = {
   cmd = { os.getenv('HOME') .. expandr_project_root .. "/target/debug/expandr-lsp" },
   filetypes = { "exr" },
}
vim.lsp.enable "expandr"
