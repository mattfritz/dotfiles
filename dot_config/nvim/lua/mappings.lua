-- Note: More LSP specific mappings are in the 'lspconfig' module
local function set_keymap(mode, key, action, opts)
  local options = vim.tbl_extend(
    'force',
    {noremap = true, silent = true},
    opts or {}
  )

  vim.api.nvim_set_keymap(mode, key, action, options)
end

-- Open LSP debug logs (requires running in debug mode, aliased to `nvimdb`
set_keymap('n', '<Leader>dbg', [[<Cmd>lua vim.cmd('tabe'..vim.lsp.get_log_path())<CR>]])

-- Install gems for solargraph from bundler source
set_keymap('n', '<Leader>bi', [[<Cmd>!GEM_HOME="~/.local/share/nvim/lsp_servers/solargraph" GEM_PATH="~/.local/share/nvim/lsp_servers/solargraph" bundle install<CR>]])

-- Recopy pasted visual selection instead of overwriting buffer
set_keymap('v', 'p', 'pgvy')

-- Config shortcuts
set_keymap('n', '<Leader>cc', [[<Cmd>luafile %<CR> | <Cmd>echo "Sourced file"<CR>]])

-- ############## FZF ###############
set_keymap('n', '<Leader>fk', [[<Cmd>lua require('fzf-lua').resume()<CR>]])
set_keymap('n', '<Leader>ff', [[<Cmd>lua require('fzf-lua').files()<CR>]])
set_keymap('n', '<Leader>fo', [[<Cmd>lua require('fzf-lua').oldfiles()<CR>]])
set_keymap('n', '<Leader>fb', [[<Cmd>lua require('fzf-lua').buffers()<CR>]])
set_keymap('n', '<Leader>fs', [[<Cmd>lua require('fzf-lua').grep_cword()<CR>]])
set_keymap('n', '<Leader>fg', [[<Cmd>lua require('fzf-lua').live_grep_native()<CR>]])
set_keymap('n', '<Leader>fl', [[<Cmd>lua require('fzf-lua').grep_last()<CR>]])
set_keymap('n', '<Leader>ft', [[<Cmd>lua require('fzf-lua').tabs()<CR>]])
set_keymap('n', '<Leader>fr', [[<Cmd>lua require('fzf-lua').registers()<CR>]])

set_keymap('n', '<Leader>fd', [[<Cmd>lua require('fzf-lua').lsp_definitions()<CR>]])
set_keymap('n', '<Leader>fw', [[<Cmd>lua require('fzf-lua').lsp_references()<CR>]])
set_keymap('n', '<Leader>fa', [[<Cmd>lua require('fzf-lua').lsp_code_actions()<CR>]])
set_keymap('n', '<Leader>f:', [[<Cmd>lua require('fzf-lua').lsp_document_symbols()<CR>]])

set_keymap('n', '<Leader>fh', [[<Cmd>lua require('fzf-lua').help_tags()<CR>]])
set_keymap('n', '<Leader>fgb', [[<Cmd>lua require('fzf-lua').git_branches()<CR>]])

-- ############## LspSaga

set_keymap('n', 'gh', [[<Cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]])
set_keymap('n', 'gr', [[<Cmd>lua require('lspsaga.rename').rename()<CR>]])
set_keymap('n', 'gx', [[<Cmd>lua require('lspsaga.codeaction').code_action()<CR>]])
set_keymap('x', 'gx', [[:<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>]])

-- scrollable)
set_keymap('n', 'K', [[<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]])
set_keymap('n', 'gs', [[<Cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]])
set_keymap('n', 'gd', [[<Cmd>lua require('lspsaga.provider').preview_definition()<CR>]])
set_keymap('n', '<C-u>', [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<CR>]])
set_keymap('n', '<C-d>', [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<CR>]])

set_keymap('n', 'go', [[<Cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]])
set_keymap('n', 'gj', [[<Cmd>Lspsaga diagnostic_jump_next<CR>]])
set_keymap('n', 'gk', [[<Cmd>Lspsaga diagnostic_jump_prev<CR>]])

-- Trouble
set_keymap('n', 'ge', [[<Cmd>TroubleToggle<CR>]])

-- Neogit (reevaluate)
-- set_keymap('n', '<Leader>gg', [[<Cmd>Neogit<CR>]])

-- Pane switching
set_keymap('n', '<C-h>', [[<C-w>h]])
set_keymap('n', '<C-j>', [[<C-w>j]])
set_keymap('n', '<C-k>', [[<C-w>k]])
set_keymap('n', '<C-l>', [[<C-w>l]])

-- Git
set_keymap('n', '<Leader>gl', [[<Cmd>GV<CR>]])
set_keymap('n', '<Leader>gL', [[<Cmd>GV!<CR>]])
set_keymap('n', '<Leader>gb', [[<Cmd>Git blame<CR>]])
set_keymap('n', '<Leader>gg', [[<Cmd>Git<CR>]])

-- Test
set_keymap('n', '<Leader>tn', [[<Cmd>TestNearest<CR>]])
set_keymap('n', '<Leader>tf', [[<Cmd>TestFile<CR>]])
set_keymap('n', '<Leader>ta', [[<Cmd>TestSuite<CR>]])
set_keymap('n', '<Leader>tl', [[<Cmd>TestLast<CR>]])
