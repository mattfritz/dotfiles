if require('bootstrap')() then
  require('options')
  require('plugins')
  require('mappings')
end

-- Debug log for LSP settings
-- vim.lsp.set_log_level("debug")
--
-- Logfile location:
-- :lua vim.cmd('e'..vim.lsp.get_log_path())
