if require('bootstrap')() then
  require('options')
  require('plugins')
  require('mappings')
end

-- Update gems for solargraph (still needs work)self:
-- - Running bundle with GEM_HOME/GEM_PATH on lockbox does not detect the correct bundler version and fails
-- GEM_HOME="~/.local/share/nvim/lsp_servers/solargraph" GEM_PATH="~/.local/share/nvim/lsp_servers/solargraph" bundle install

-- Debug log for LSP settings
-- To debug, run `nvimdb` from shell
-- vim.lsp.set_log_level("debug")

-- Logfile location:
-- :lua vim.cmd('e'..vim.lsp.get_log_path())
