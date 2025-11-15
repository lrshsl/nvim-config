return {

   -- Lsp Zero
   {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      lazy = false,
      dependencies = {
         'williamboman/mason.nvim',
         'williamboman/mason-lspconfig.nvim',
         'neovim/nvim-lspconfig',

         -- Autocompletion
         'hrsh7th/nvim-cmp',
         'hrsh7th/cmp-nvim-lsp',
         'hrsh7th/cmp-path',
         'hrsh7th/cmp-buffer',

         -- Snippets
         {
            'L3MON4D3/LuaSnip',
            build = "make install_jsregexp",
            opts = {
               enable_autosnippets = true,
               store_selection_keys = '<Tab>',
            }
         },
         'saadparwaiz1/cmp_luasnip',

         -- Telescope
         'nvim-telescope/telescope.nvim',
      },

      -- Configure Lsp Zero, Mason and Autocompletion directly after each other
      -- (order matters!)
      config = function()
         local lsp_zero = require 'lsp-zero'

         lsp_zero.extend_lspconfig {
            float_border = 'rounded',
            capabilities = require 'cmp_nvim_lsp'.default_capabilities(),
         }

         lsp_zero.on_attach(function(_, bufnr)
            lsp_zero.default_keymaps { buffer = bufnr, _ }

            require 'which-key'.add {
               mode = { 'n' },
               { 'g',  group = 'goto' },
               { 'gd', vim.lsp.buf.definition,     desc = 'Goto definition' },
               { 'gD', vim.lsp.buf.declaration,    desc = 'Goto declaration' },
               { 'gi', vim.lsp.buf.implementation, desc = 'Goto implementation' },
               { 'gr', vim.lsp.buf.definition,     desc = 'Goto references' },
               -- Telescope handles other goto stuff
            }
            -- Navigate snippets
            -- vim.keymap.set({ 'i', 's' }, '<Tab>', function()
            -- 	if vim.snippet.active({ direction = 1 }) then
            -- 		vim.snippet.jump(1)
            -- 		return ''
            -- 	else
            -- 		return '<Tab>'
            -- 	end
            -- end, { expr = true })
         end)

         lsp_zero.format_on_save {
            format_opts = {
               async = false,
               timeout_ms = 1000,
            },
            servers = {
               ['lua_ls'] = { 'lua' },
               ['vimls'] = { 'vim' },
               ['rust_analyzer'] = { 'rust' },
               ['clangd-format'] = { 'c', 'cpp' },
               ['autopep8'] = { 'python' },
               ['typstyle'] = { 'typst' },
               ['nimls'] = { 'nim' },
               ['zls'] = { 'zig' },
            }
         }

         -- Mason
         require 'mason'.setup {}
         require 'mason-lspconfig'.setup {
            ensure_installed = { 'lua_ls', 'rust_analyzer', 'clangd', },
            handlers = {
               function(server_name)
                  vim.lsp.config(server_name).setup {}
               end,
            }
         }

         -- Autocompletion
         local cmp = require 'cmp'
         -- vim.keymap.set({ 'i', 's' }, '<Tab>', function()
         --    if vim.snippet.active({ direction = 1 }) then
         --       vim.snippet.jump(1)
         --       return ''
         --    elseif cmp.visible() then
         --       cmp.mapping.confirm { select = true }
         --       return ''
         --    else
         --       return '<Tab>'
         --    end
         -- end, { expr = true })
         local mappings = {
            ['<C-Space>'] = cmp.mapping(cmp.complete, { 'i', 'c', 's' }),
            ['<C-y>'] = cmp.mapping(function()
               cmp.confirm { select = true }
            end, { 'i', 'c', 's' }),
            -- ['<Tab>'] = cmp.mapping.confirm { select = true },
            ['<C-c>'] = cmp.mapping(cmp.abort, { 'i', 'c', 's' }),
            -- Backup for <C-e>
            ['<C-e>'] = cmp.mapping(function()
               if cmp.visible() then
                  cmp.select_prev_item { behavior = 'insert' }
               else
                  cmp.complete()
               end
            end, { 'i', 'c', 's' }),
            ['<C-n>'] = cmp.mapping(function()
               if cmp.visible() then
                  cmp.select_next_item { behavior = 'insert' }
               else
                  cmp.complete()
               end
            end, { 'i', 'c', 's' }),
         }
         cmp.setup {
            experimental = {
               ghost_text = true,
            },
            keyword_length = 3,
            sources = {
               { name = 'luasnip', keyword_length = 1, option = {
                  show_condition = false, show_autosnippets = false } },
               { name = 'codeium',  keyword_length = 2, max_item_count = 3 },
               { name = 'path',     keyword_length = 2 },
               { name = 'nvim_lsp', keyword_length = 2 },
               { name = 'buffer',   keyword_length = 5, max_item_count = 3 },
            },
            mapping = mappings,
            -- formatting = lsp_zero.cmp_format { details = true },
            snippet = {
               expand = function(args)
                  -- You need Neovim v0.10 to use vim.snippet
                  vim.snippet.expand(args.body)
                  -- require 'luasnip'.lsp_expand(args.body)
               end,
            },
            window = {
               completion = cmp.config.window.bordered(),
               documentation = cmp.config.window.bordered(),
            },
         }

         -- `/` search setup.
         cmp.setup.cmdline('/', {
            mapping = mappings,
            -- mapping = cmp.mapping.preset.cmdline(),
            sources = {
               { name = 'nvim_lsp', keyword_length = 2 },
               { name = 'buffer',   keyword_length = 2, max_item_count = 3 },
            }
         })

         -- `:` cmdline setup.
         -- cmp.setup.cmdline(':', {
         --    mapping = mappings,
         --    -- mapping = cmp.mapping.preset.cmdline(),
         --    sources = cmp.config.sources {
         --       { name = 'path',     keyword_length = 5 },
         --       { name = 'nvim_lsp', keyword_length = 5 },
         --       { name = 'buffer',   keyword_length = 5, max_item_count = 3 },
         --    },
         --    matching = { disallow_symbol_nonprefix_matching = false }
         -- })
      end
   },

   {
      "folke/trouble.nvim",
      focus = true,
      opts = {
         modes = {
            lsp_errors = {
               mode = 'diagnostics',
               filter = {
                  severity = vim.diagnostic.severity.ERROR
               }
            }
         },
      },
      cmd = "Trouble",
      keys = {
         {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
         },
         {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
         },
         {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=true<cr>",
            desc = "Symbols (Trouble)",
         },
         {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=true win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
         },
         {
            "<leader>xL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
         },
         {
            "<leader>xQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
         },
      },
   },
}
