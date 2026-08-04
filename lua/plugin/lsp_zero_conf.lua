return {
   'VonHeikemen/lsp-zero.nvim',
   branch = 'v3.x',
   event = { 'BufReadPre', 'BufNewFile' },
   dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
   },
   config = function()
      local lsp_zero = require 'lsp-zero'

      lsp_zero.extend_lspconfig {
         float_border = 'rounded',
         capabilities = vim.tbl_deep_extend(
            'force',
            vim.lsp.protocol.make_client_capabilities(),
            -- Load cmp_nvim_lsp dynamically only when capabilities are evaluated
            setmetatable({}, {
               __index = function(_, key)
                  return require('cmp_nvim_lsp').default_capabilities()[key]
               end,
            })
         ),
      }

      lsp_zero.format_on_save {
         format_opts = {
            async = false,
            timeout_ms = 1000,
         },
         servers = {
            ['clangd-format'] = { 'c', 'cpp' },
            ['google-java-format'] = { 'java' },
            ['autopep8'] = { 'python' },
            ['typstyle'] = { 'typst' },
            ['nph'] = { 'nim' },
         },
      }

      -- Manual server configurations
      vim.lsp.config('mlir', { cmd = { 'mlir-lsp-server' } })
      vim.lsp.config('rust_analyzer', {
         settings = {
            ['rust-analyzer'] = {
               check = { command = 'clippy' },
            },
         },
      })

      -- Mason Setup
      require('mason').setup {}
      require('mason-lspconfig').setup {
         ensure_installed = { 'lua_ls', 'rust_analyzer', 'clangd' },
         handlers = {
            function(server_name)
               require('lspconfig')[server_name].setup({})
            end,
         },
      }
   end,
}
