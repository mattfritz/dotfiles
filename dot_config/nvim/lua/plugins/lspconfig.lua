local lsp_installer = require('nvim-lsp-installer')
local saga = require('lspsaga')

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
    -- on_attach = on_attach,
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

      -- on_attach(client, bufnr)

      -- This is janky, but is required to load commands
      require('sqls').setup()
    end
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)

  saga.init_lsp_saga()
end)
