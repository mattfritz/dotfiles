-- local os = require('os')
local lspconfig = require('lspconfig')
-- local configs = require('lspconfig.configs')
-- local util = require('lspconfig.util')
local saga = require('lspsaga')

local servers = {
  'ansiblels',
  'bashls',
  'cssls',
  'diagnosticls',
  'dockerls',
  'ember',
  'emmet_ls',
  'eslint',
  'gopls',
  'graphql',
  'html',
  'jedi_language_server',
  'jsonls',
  'pyright',
  'rust_analyzer',
  -- 'snyk_ls',
  'solargraph',
  'sqls',
  'sumneko_lua',
  'svelte',
  'tailwindcss',
  'terraformls',
  'tflint',
  'tsserver',
  'vimls',
  'yamlls',
}

-- if not configs.snyk_ls then
--   configs.snyk_ls = {
--     default_config = {
--       cmd = {'snyk-ls'},
--       filetypes = { '*' },
--       init_options = {
--         activateSnykOpenSource = 'true',
--         activateSnykCode = 'true',
--         activateSnykIac = 'true',
--         additionalParams = '--all-projects',
--         enableTelemetry = 'false',
--         organization = os.getenv('SNYK_ORG'),
--         token = os.getenv('SNYK_TOKEN'),
--       },
--       root_dir = util.find_git_ancestor,
--       single_file_support = true,
--       settings = {}
--     },
--     docs = {
--       description = [[
-- Custom LSP server definition for Snyk

-- Make sure snyk-ls and the Snyk CLI are in your PATH
-- https://github.com/snyk/snyk-ls
-- npm i snyk -g
-- ]],
--       default_config = {
--         root_dir = [[util.find_git_ancestor]]
--       }
--     }
--   }
-- end

for _, name in pairs(servers) do
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local opts = {
    capabilities = capabilities,
    -- on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }

  if name == 'sumneko_lua' then
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
  elseif name == 'sqls' then
    opts.on_attach = function(client, bufnr)
      client.resolved_capabilities.execute_command = true
      client.commands = require('sqls').commands

      require('sqls').on_attach(client, bufnr)
    end
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  lspconfig[name].setup(opts)

  saga.init_lsp_saga()
end
