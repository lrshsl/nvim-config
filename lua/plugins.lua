-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      lazypath,
   })
end
vim.opt.rtp:prepend(lazypath)


-- Actual plugins
local plugins = {
   --> Base dependencies
   { 'nvim-lua/plenary.nvim',       lazy = false },
   { 'nvim-tree/nvim-web-devicons', lazy = false },

   --> Platformio
   -- { 'normen/vim-pio',              ft = { 'c', 'cpp' } },
   { 'benknoble/vim-racket',        ft = 'racket' },
   --{ 'rhysd/reply.vim',             ft = 'racket' },

   --> Text editing
   require 'treesitter_conf',
   'tpope/vim-fugitive',
   'tpope/vim-surround',
   'tpope/vim-repeat',
   'tpope/vim-commentary',
   { "smjonas/inc-rename.nvim", opts = { show_message = false, } },

   require 'autopairs_conf',

   --> Undotree
   { 'mbbill/undotree',         cmd = 'UndotreeToggle' },

   --> Sneak around in a file with s/S
   'justinmk/vim-sneak',

   --> LSP
   require 'lsp',
   require 'ouroboros_conf',

   --> Latex
   -- require 'latex',
   require 'typst_conf',

   --> AI helper
   { 'exafunction/codeium.nvim', opts = {},           cmd = 'Codeium' },

   --> Space(macs|vim)-like keybinding preview
   require 'which_key',
   require 'noice_conf',

   --> Session manager
   require 'session_manager_conf',

   --> Files
   require 'neotree',
   require 'harpoon_conf',
   { 'aohoyd/broot.nvim',        opts = {}, },
   { 'stevearc/oil.nvim',        opts = {},           cmd = 'Oil', },

   { 'jakemason/ouroboros',      ft = { 'c', 'cpp' }, dependencies = 'nvim-lua/plenary.nvim' },

   --> Fuzzy finders
   require 'telescope_conf',
   { 'junegunn/fzf',           lazy = false },

   --> Document Symbols
   {
      'liuchengxu/vista.vim',
      cmp = 'Vista',
      config = function()
         vim.g.vista_default_executive = 'nvim_lsp'
         vim.g.vista_sidebar_width = 40
         vim.g.close_on_jump = 1
      end
   },

   --> Zen mode
   { 'junegunn/goyo.vim',      cmd = 'Goyo' },
   { 'junegunn/limelight.vim', cmd = 'Limelight' },
   { 'EdenEast/nightfox.nvim', lazy = false },
   -- { 'sainnhe/sonokai',             lazy = true },
}

require 'lazy'.setup(plugins, {})
