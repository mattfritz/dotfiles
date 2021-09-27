--local jellybeans = vim.api.nvim_eval([[getcompletion('jellybeans', 'color')]])[1]
--
--if jellybeans then
--  vim.cmd([[ colorscheme jellybeans ]])
--end

local options     = {
  autoindent    = true,
  autoread      = true,
  clipboard     = 'unnamedplus',
  cmdheight     = 1,
  completeopt   = 'menuone,noselect',
  directory     = vim.opt.directory:prepend('$HOME/.local/share/nvim/swap//'),
  expandtab     = true,
  hidden        = true,
  ignorecase    = true,
  mouse         = 'a',
  number        = true,
  numberwidth   = 2,
  shiftwidth    = 2,
  signcolumn    = 'yes',
  smartindent   = true,
  splitbelow    = true,
  splitright    = true,
  switchbuf     = vim.opt.switchbuf + 'usetab,newtab',
  termguicolors = true,
  timeoutlen    = 400,
  undodir       = '.local/share/nvim/swap',
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
  --"netrw",
  --"netrwPlugin",
  --"netrwSettings",
  --"netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, builtin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. builtin] = 1
end
