return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- or 'nvim-tree/nvim-web-devicons'
  opts = {
    pipe_table = {
      preset = 'round', -- styles: 'none', 'round', 'double', 'heavy'
      style = 'full',  -- draws top, bottom, and inner borders
      cell = 'padded', -- pads cells cleanly
    },
  },
  ft = { 'markdown' },
}
