-- Note: More LSP specific mappings are in the 'lspconfig' module
local function set_keymap(mode, key, action, opts)
  local options = vim.tbl_extend(
    'force',
    {noremap = true, silent = true},
    opts or {}
  )

  vim.api.nvim_set_keymap(mode, key, action, options)
end

-- Recopy pasted visual selection instead of overwriting buffer
set_keymap('v', 'p', 'pgvy')

-- Config shortcuts
set_keymap('n', '<Leader>cc', [[<Cmd>luafile %<CR> | <Cmd>echo "Sourced file"<CR>]])

-- Telescope
set_keymap('n', '<Leader>ff', [[<Cmd>Telescope find_files<CR>]])
set_keymap('n', '<Leader>fd', [[<Cmd>Telescope file_browser<CR>]])
set_keymap('n', '<Leader>fs', [[<Cmd>Telescope grep_string<CR>]])

-- TODO: Workaround until Telescope implements fuzzy live_grep: https://github.com/nvim-telescope/telescope.nvim/issues/564
-- set_keymap('n', '<Leader>fg', [[<Cmd>Telescope live_grep<CR>]])
set_keymap('n', '<Leader>fg', [[:lua vim.ui.input({prompt = 'Enter search term: '}, function(input) require('telescope.builtin').grep_string({search = input}) end)<CR>]])
-- ENDTODO

set_keymap('n', '<Leader>fb', [[<Cmd>Telescope buffers<CR>]])
set_keymap('n', '<Leader>fh', [[<Cmd>Telescope help_tags<CR>]])
set_keymap('n', '<Leader>fo', [[<Cmd>Telescope oldfiles<CR>]])
set_keymap('n', '<Leader>fv', [[<Cmd>Telescope treesitter<CR>]])
set_keymap('n', '<Leader>fp', [[:lua require'telescope'.extensions.project.project{}<CR>]])
set_keymap('n', '<Leader>fgb', [[<Cmd>Telescope git_branches<CR>]])
set_keymap('n', '<Leader>fgc', [[<Cmd>Telescope git_commits<CR>]])
set_keymap('n', '<Leader>fgs', [[<Cmd>Telescope git_status<CR>]])

-- Neogit (reevaluate)
-- set_keymap('n', '<Leader>gg', [[<Cmd>Neogit<CR>]])

-- Pane switching
set_keymap('n', '<C-h>', [[<C-w>h]])
set_keymap('n', '<C-j>', [[<C-w>j]])
set_keymap('n', '<C-k>', [[<C-w>k]])
set_keymap('n', '<C-l>', [[<C-w>l]])

-- Toggles
set_keymap('n', '<Leader>sh', [[<Cmd>nohl<CR>]])
set_keymap('n', '<Leader>sn', [[<Cmd>set number!<CR>]])
set_keymap('n', '<Leader>sr', [[<Cmd>set relativenumber!<CR>]])

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
