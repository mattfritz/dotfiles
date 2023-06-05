local cmp = require('cmp')
local compare = cmp.config.compare
local luasnip = require('luasnip')
local lspkind = require('lspkind')

local has_words_before = function ()
  if table.unpack == nil then return false end -- Workaround until neovim updates Lua version
  local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
  if col == 0 then return false end

  return vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('^%s*$') == nil
end

-- Highlight pop-up menu
-- TODO: add class, module, snippet, field and other highlight types
-- vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', {bg='NONE', fg='#808080'})
-- vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', {bg='NONE', fg='#569CD6'})
-- vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', {bg='NONE', fg='#569CD6'})
-- vim.api.nvim_set_hl(0, 'CmpItemKindVariable', {bg='NONE', fg='#9CDCFE'})
-- vim.api.nvim_set_hl(0, 'CmpItemKindInterface', {bg='NONE', fg='#9CDCFE'})
-- vim.api.nvim_set_hl(0, 'CmpItemKindText', {bg='NONE', fg='#9CDCFE'})
-- vim.api.nvim_set_hl(0, 'CmpItemKindFunction', {bg='NONE', fg='#C586C0'})
-- vim.api.nvim_set_hl(0, 'CmpItemKindMethod', {bg='NONE', fg='#C586C0'})
-- vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', {bg='NONE', fg='#D4D4D4'})
-- vim.api.nvim_set_hl(0, 'CmpItemKindProperty', {bg='NONE', fg='#D4D4D4'})
-- vim.api.nvim_set_hl(0, 'CmpItemKindUnit', {bg='NONE', fg='#D4D4D4'})

local highlights = {
  PmenuSel = { bg = "#282C34", fg = "NONE" },
  -- Pmenu = { fg = "#C5CDD9", bg = "#22252A" }, -- Old value from cmp wiki
  Pmenu = { fg = "#C5CDD9", bg = "#2F2F2F" },

  CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", strikethrough = true },
  CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", bold = true },
  CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", bold = true },
  CmpItemMenu = { fg = "#C792EA", bg = "NONE", italic = true },

  CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },

  CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },

  CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },

  CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },

  CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
  CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },

  CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },

  CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },

  CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },

  CmpItemKindCopilot = { fg = "#6CC644" },
}

for group, style in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, style)
end

cmp.setup({
  enabled = function ()
    return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt' -- Disable in lspsaga and telescope
    -- local context = require('cmp.config.context')
    -- if vim.api.nvim_get_mode().mode == 'c' then
    --   return true
    -- else
    --   return not context.in_treesitter_capture('comment') -- Disable in comments
    --     and not context.in_syntax_group('comment') -- Disable in comments
    --     and vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt' -- Disable in lspsaga and telescope
    -- end
  end,

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. strings[1] .. " "
      if strings[2] ~= nil then
        kind.menu = "    (" .. strings[2] .. ")"
      end

      return kind
    end,
  },

  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then -- and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
      -- elseif luasnip.expand_or_jumpable() then
      elseif luasnip.jumpable() then
        luasnip.jump()
        -- luasnip.expand_or_jump()
      -- elseif has_words_before() then
      --   cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then -- and has_words_before() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
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

    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
  },

  sorting = {
    priority_weight = 2,
    comparators = {
      require('copilot_cmp.comparators').prioritize,
      compare.offset,
      compare.exact,
      compare.score,
      require('cmp-under-comparator').under,
      compare.recently_used,
      compare.locality,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },

  sources = cmp.config.sources({
    { name = 'copilot' },
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

  window = {
    documentation = cmp.config.window.bordered({ border = 'rounded' }),
    completion = {
      border = 'shadow',
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  },
  view = {
    entries = 'wildmenu'
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  view = {
    entries = 'wildmenu'
  }
})

-- TODO: move this to its own setup file if necessary
require('luasnip').config.setup({ history = true })
require('luasnip.loaders.from_vscode').load()
