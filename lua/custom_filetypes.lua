local expandr_project_root = '/code/parsing/expandr'

-- Custom filetypes
vim.filetype.add {
   extension = {
      exr = 'exr',
      ucad = 'microcad',
   }
}

-- MicroCad
vim.lsp.config.racket = {
   cmd = { 'microcad-lsp' },
   filetypes = { 'microcad' },
}
vim.lsp.enable 'microcad'

-- Racket
vim.lsp.config.racket = {
   cmd = { 'racket', '-l', 'racket-langserver' },
   filetypes = { 'racket' },
}
vim.lsp.enable 'racket'

-- Only enable
vim.lsp.enable 'gdscript'
vim.lsp.enable 'c3_lsp'

vim.lsp.config.expandr = {
   cmd = { os.getenv('HOME') .. expandr_project_root .. '/target/debug/expandr-lsp' },
   filetypes = { 'exr' },
}
vim.lsp.enable 'expandr'
