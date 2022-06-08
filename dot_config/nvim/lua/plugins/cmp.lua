local cmp = require('cmp')
local compare = cmp.config.compare
local luasnip = require('luasnip')
local lspkind = require('lspkind')

local has_words_before = function ()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  if col == 0 then return false end

  return vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

-- Highlight pop-up menu
-- TODO: add class, module, snippet, field and other highlight types
vim.highlight.create('CmpItemAbbrDeprecated', {guibg='NONE', guifg='#808080'})
vim.highlight.create('CmpItemAbbrMatch', {guibg='NONE', guifg='#569CD6'})
vim.highlight.create('CmpItemAbbrMatchFuzzy', {guibg='NONE', guifg='#569CD6'})
vim.highlight.create('CmpItemKindVariable', {guibg='NONE', guifg='#9CDCFE'})
vim.highlight.create('CmpItemKindInterface', {guibg='NONE', guifg='#9CDCFE'})
vim.highlight.create('CmpItemKindText', {guibg='NONE', guifg='#9CDCFE'})
vim.highlight.create('CmpItemKindFunction', {guibg='NONE', guifg='#C586C0'})
vim.highlight.create('CmpItemKindMethod', {guibg='NONE', guifg='#C586C0'})
vim.highlight.create('CmpItemKindKeyword', {guibg='NONE', guifg='#D4D4D4'})
vim.highlight.create('CmpItemKindProperty', {guibg='NONE', guifg='#D4D4D4'})
vim.highlight.create('CmpItemKindUnit', {guibg='NONE', guifg='#D4D4D4'})

cmp.setup({
  enabled = function ()
    local context = require('cmp.config.context')
    if vim.api.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture('comment')
        and not context.in_syntax_group('comment')
    end
  end,

  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text'
    })
  },

  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<C-d>'] = cmp.mapping(
      cmp.mapping.scroll_docs(-4),
      { 'i', 'c' }
    ),

    ['<C-f>'] = cmp.mapping(
      cmp.mapping.scroll_docs(4),
      { 'i', 'c' }
    ),

    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),

    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },

  sorting = {
    priority_weight = 2,
    comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      require('cmp-under-comparator').under,
      compare.recently_used,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vim-dadbod-completion' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'treesitter' }
  }, {
    { name = 'buffer' },
  }),

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- TODO: move this to its own setup file if necessary
require('luasnip').config.setup({ history = true })
require('luasnip.loaders.from_vscode').load()
