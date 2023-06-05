local options     = {
  autoindent    = true,
  autoread      = true,
  backupdir     = '/tmp/nvim/backup//',
  clipboard     = 'unnamedplus',
  cmdheight     = 1,
  completeopt   = 'menuone,noselect',
  directory     = vim.opt.directory:prepend('/tmp/nvim/swap//'),
  expandtab     = true,
  hidden        = true,
  ignorecase    = true,
  magic         = true, -- Use magic regex helpers
  mouse         = 'a',
  number        = true,
  numberwidth   = 2,
  pumheight     = 20,
  shiftwidth    = 2,
  showtabline   = 2, -- always show tabline
  signcolumn    = 'yes',
  smartcase     = true,
  smartindent   = true,
  splitbelow    = true,
  splitright    = true,
  switchbuf     = vim.opt.switchbuf + 'uselast,usetab,newtab',
  tabstop       = 4,
  termguicolors = true,
  timeoutlen    = 400,
  undodir       = '/tmp/nvim/undo//',
  undofile      = true,
  updatetime    = 250,
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

local globals = {
  auto_save = false,
  mapleader = ' ',
}

for option, value in pairs(globals) do
  vim.g[option] = value
end

-- TODO: Review all of these. May need netrw still
local disabled_built_ins = {
  -- "netrw",
  -- "netrwPlugin",
  -- "netrwSettings",
  -- "netrwFileHandlers",
  -- "gzip",
  -- "zip",
  -- "zipPlugin",
  -- "tar",
  -- "tarPlugin",
  "getscript",
  "getscriptPlugin",
  -- "vimball",
  -- "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, builtin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. builtin] = 1
end

-- Disable comment insertion on CR and `o` newline
-- TODO: change this to use nvim_create_autocmd after 0.7.0 upgrade
vim.cmd[[autocmd FileType * setlocal formatoptions-=ro]]
