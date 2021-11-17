local lsp_installer = require('nvim-lsp-installer')
local saga = require('lspsaga')

local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- TODO: determine if any of these are needed, otherwise just use lspsaga
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap("n", "<space>f", "<Cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- Lspsaga
  buf_set_keymap('n', 'gh', [[<Cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]], opts)
  buf_set_keymap('n', 'gr', [[<Cmd>lua require('lspsaga.rename').rename()<CR>]], opts)
  buf_set_keymap('n', 'gx', [[<Cmd>lua require('lspsaga.codeaction').code_action()<CR>]], opts)
  buf_set_keymap('x', 'gx', [[:<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>]], opts)

  -- Lspsaga (scrollable)
  buf_set_keymap('n', 'K', [[<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], opts)
  buf_set_keymap('n', 'gs', [[<Cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]], opts)
  buf_set_keymap('n', 'gd', [[<Cmd>lua require('lspsaga.provider').preview_definition()<CR>]], opts)
  buf_set_keymap('n', '<C-f>', [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], opts)
  buf_set_keymap('n', '<C-b>', [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], opts)

  buf_set_keymap('n', 'go', [[<Cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]], opts)
  -- TODO: conflict with config reload
  -- buf_set_keymap('n', '<silent><Leader>cc', [[<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>]], opts)
  buf_set_keymap('n', 'gj', [[<Cmd>Lspsaga diagnostic_jump_next<CR>]], opts)
  buf_set_keymap('n', 'gk', [[<Cmd>Lspsaga diagnostic_jump_prev<CR>]], opts)
end

-- LSP Installer
lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

lsp_installer.on_server_ready(function(server)
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }

  if server.name == 'sumneko_lua' then
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      }
    }
  elseif server.name == 'sqls' then
    opts.on_attach = function(client, bufnr)
      client.resolved_capabilities.execute_command = true
      client.commands = require('sqls').commands

      on_attach(client, bufnr)

      -- This is janky, but is required to load commands
      require('sqls').setup({ picker = 'telescope' })
    end
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)

  saga.init_lsp_saga()
end)
