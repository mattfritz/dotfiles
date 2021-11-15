if require('bootstrap')() then
  require('options')
  require('plugins')
  require('mappings')
end

-- Debug log for LSP settings
-- vim.lsp.set_log_level("debug")
