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
   { 'normen/vim-pio',              ft = { 'c', 'cpp' } },
   { 'benknoble/vim-racket',        ft = 'racket' },

   --> Text editing
   require 'plugin.treesitter_conf',
   require 'plugin.fugitive_conf',
   'tpope/vim-surround',
   'tpope/vim-repeat',
   'tpope/vim-commentary',
   { "smjonas/inc-rename.nvim", opts = { show_message = false, } },

   require 'plugin.autopairs_conf',

   --> Undotree
   require 'plugin.undotree_conf',

   --> Sneak around in a file with s/S
   'justinmk/vim-sneak',

   --> LSP
   require 'plugin.lsp_zero_conf',
   require 'plugin.nvim_cmp_conf',
   require 'plugin.trouble_conf',
   require 'plugin.ouroboros_conf',

   --> Markup
   -- require 'latex',
   require 'typst_conf',

   --> AI helper
   require 'plugin.codeium_conf',
   require 'plugin.99_ai_conf',

   --> Space(macs|vim)-like keybinding preview
   require 'plugin.which_key_conf',
   require 'plugin.noice_conf',

   --> Session manager
   require 'plugin.session_manager_conf',

   --> Files
   require 'plugin.neotree_conf',
   require 'plugin.harpoon_conf',
   require 'plugin.broot_conf',
   require 'plugin.oil_conf',

   --> Fuzzy finders
   require 'plugin.telescope_conf',

   --> Document Symbols
   require 'plugin.vista_conf',

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
