return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local cmp = require('cmp')
    local mappings = {
      ['<C-Space>'] = cmp.mapping(function() cmp.complete() end),
      ['<C-y>'] = cmp.mapping(function()
        cmp.confirm { select = true, behavior = cmp.ConfirmBehavior.Insert }
      end),
      ['<right>'] = cmp.mapping(function()
        cmp.confirm { select = true, behavior = cmp.ConfirmBehavior.Insert }
      end),
      ['<C-c>'] = cmp.mapping(cmp.abort, { 'i', 'c', 's' }),
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
      keyword_length = 3,
      sources = {
        { name = 'luasnip', keyword_length = 1, option = { show_condition = false, show_autosnippets = false } },
        { name = 'codeium', keyword_length = 2, max_item_count = 3 },
        { name = 'path', keyword_length = 2 },
        { name = 'nvim_lsp', keyword_length = 2 },
        { name = 'buffer', keyword_length = 5, max_item_count = 3 },
      },
      mapping = mappings,
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    }
  end,
}
