return {
   'tpope/vim-fugitive',
   cmd = 'Git',
   keys = {
      { '<space>g.', '<cmd>Git<CR>',    desc = 'Git' },
      { '<space>gd', ':Git diff<CR>',   desc = 'Git diff' },
      { '<space>gs', ':Git status<CR>', desc = 'Git status' },
      { '<space>gg', ':Git<space>',     desc = ':Git <CMD>' },
   }
}
