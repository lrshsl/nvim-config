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
   require 'plugin.treesitter_conf',
   'tpope/vim-fugitive',
   'tpope/vim-surround',
   'tpope/vim-repeat',
   'tpope/vim-commentary',
   { "smjonas/inc-rename.nvim", opts = { show_message = false, } },

   require 'plugin.autopairs_conf',

   --> Undotree
   { 'mbbill/undotree',         cmd = 'UndotreeToggle' },

   --> Sneak around in a file with s/S
   'justinmk/vim-sneak',

   --> LSP
   require 'lsp',
   require 'plugin.ouroboros_conf',

   --> Latex
   -- require 'latex',
   require 'typst_conf',

   --> AI helper
   require 'plugin.codeium',
   require 'plugin.99_ai',

   --> Space(macs|vim)-like keybinding preview
   require 'plugin.which_key',
   require 'plugin.noice_conf',

   --> Session manager
   require 'plugin.session_manager_conf',

   --> Files
   require 'plugin.neotree',
   require 'plugin.harpoon_conf',
   { 'aohoyd/broot.nvim', opts = {}, },
   { 'stevearc/oil.nvim', opts = {}, cmd = 'Oil', },

   --> Fuzzy finders
   require 'plugin.telescope_conf',
   { 'junegunn/fzf',      lazy = false },

   --> Document Symbols
   {
      'liuchengxu/vista.vim',
      cmp = 'Vista',
      init = function()
         vim.g.vista_default_executive = 'nvim_lsp'
         vim.g.vista_sidebar_width = 40
         vim.g.close_on_jump = 1
      end,
   },

   --> Zen mode
   { 'junegunn/goyo.vim', cmd = 'Goyo' },
   {
      'junegunn/limelight.vim',
      cmd = 'Limelight',
      init = function()
         vim.g.limelight_bop = '^\\n\\n'
         vim.g.limelight_eop = '^\\n\\n'
      end
   },
   { 'EdenEast/nightfox.nvim', lazy = false },
   -- { 'sainnhe/sonokai',             lazy = true },
}

require 'lazy'.setup(plugins, {})
