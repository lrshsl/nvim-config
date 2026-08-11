vim = vim


-- TODO:
--> Store settings! (local? Session?)
--> Telescope themes?
--> get good with vim-surround
--> snacks.nvim!
--
--> ditch nvim-cmp for <C-x><C-o> omnifunc?

-- Required before plugins
vim.g.mapleader = ' '

Nmap = function(key, command) vim.keymap.set('n', key, command, { noremap = true, silent = true }) end
Vmap = function(key, command) vim.keymap.set('v', key, command, { noremap = true, silent = true }) end
Imap = function(key, command) vim.keymap.set('i', key, command, { noremap = true, silent = true }) end
Tmap = function(key, command) vim.keymap.set('t', key, command, { noremap = true, silent = true }) end

require 'plugins'
require 'mappings'

require 'settings'
require 'snippets'
require 'custom_filetypes'

if vim.g.neovide ~= nil then
   require 'neovide'
end

Imap('<tab>', '<tab>')
