local fn = vim.fn
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

local function tab(fallback)
  if fn.pumvisible() == 1 then
    fn.feedkeys(t '<C-n>', 'n')
  elseif luasnip.expand_or_jumpable() then
    fn.feedkeys(t '<Plug>luasnip-expand-or-jump', '')
  elseif check_back_space() then
    fn.feedkeys(t '<tab>', 'n')
  else
    fallback()
  end
end

local function shift_tab(fallback)
  if fn.pumvisible() == 1 then
    fn.feedkeys(t '<C-p>', 'n')
  elseif luasnip.jumpable(-1) then
    fn.feedkeys(t '<Plug>luasnip-jump-prev', '')
  else
    fallback()
  end
end

cmp.setup({
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = require('lspkind').presets.default[vim_item.kind] .. " " .. vim_item.kind

      vim_item.menu = ({
        buffer = '[Buffer]',
        luasnip = '[LuaSnip]',
        nvim_lsp = '[LSP]',
        nvim_lua = '[Lua]',
        path = '[Path]',
        treesitter = '[Tree]',
      })[entry.source.name]
      return vim_item
    end
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(tab, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(shift_tab, { 'i', 's' }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- TODO: find out if this complete() is necessary
    --['<C-Space>'] = cmp.mapping.complete(),
    -- TODO: Also exit to normal mode here if possible
    --['<Esc>'] = cmp.mapping.close(), -- TODO: change this to abort() once it forwards ESC
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
  },
  sources = {
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'treesitter' },
  },
})

-- TODO: move this to its own setup file if necessary
require('luasnip').config.setup({ history = true })
require('luasnip.loaders.from_vscode').load()
