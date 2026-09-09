-- Custom filetypes
vim.filetype.add {
   extension = {
      pest = 'pest',
      exr = 'exr',
      xpr = 'exr',
      xdr = 'exr',
      ucad = 'microcad',
      c2 = 'c2',
      c2t = 'c2',
      c2i = 'c2',
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


-- Expandr
vim.lsp.config.expandr = {
   cmd = { 'expandr-lsp' },
   filetypes = { 'exr' },
}
vim.treesitter.language.add('exr', {
   path = vim.fn.stdpath('config') .. '/parser/exr.so'
})
vim.lsp.enable 'expandr'
