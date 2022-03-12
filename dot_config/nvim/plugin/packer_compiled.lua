-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/matt.fritz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/matt.fritz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/matt.fritz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/matt.fritz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/matt.fritz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  ["cmp-under-comparator"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/cmp-under-comparator",
    url = "https://github.com/lukas-reineke/cmp-under-comparator"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "require('plugins.gitsigns')" },
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/glow.nvim",
    url = "https://github.com/npxbr/glow.nvim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/gv.vim",
    url = "https://github.com/junegunn/gv.vim"
  },
  kommentary = {
    config = { "require('plugins.kommentary')" },
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lexima.vim"] = {
    config = { "vim.cmd('autocmd FileType TelescopePrompt let b:lexima_disabled=1')" },
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/lexima.vim",
    url = "https://github.com/cohama/lexima.vim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('plugins.lualine')" },
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["luatab.nvim"] = {
    config = { "require('plugins.luatab')" },
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/luatab.nvim",
    url = "https://github.com/alvarosevilla95/luatab.nvim"
  },
  ["nvcode-color-schemes.vim"] = {
    config = { "require('plugins.colors')" },
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim",
    url = "https://github.com/ChristianChiarulli/nvcode-color-schemes.vim"
  },
  ["nvim-cmp"] = {
    config = { "require('plugins.cmp-new')" },
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require('colorizer').setup()" },
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "require('plugins.lspconfig')" },
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "require('plugins.treesitter')" },
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["sqls.nvim"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/sqls.nvim",
    url = "https://github.com/nanotee/sqls.nvim"
  },
  tabular = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('plugins.telescope')" },
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/vim-dadbod-completion",
    url = "https://github.com/kristijanhusak/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    needs_bufread = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/opt/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-dispatch"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/opt/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/vim-peekaboo",
    url = "https://github.com/junegunn/vim-peekaboo"
  },
  ["vim-projectionist"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/opt/vim-projectionist",
    url = "https://github.com/tpope/vim-projectionist"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/vim-rails",
    url = "https://github.com/tpope/vim-rails"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-ruby"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/vim-ruby",
    url = "https://github.com/vim-ruby/vim-ruby"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/vim-signature",
    url = "https://github.com/kshenoy/vim-signature"
  },
  ["vim-test"] = {
    config = { "require('plugins.vim-test')" },
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vista.vim"] = {
    config = { "      vim.g.vista_default_executive = 'nvim_lsp'\n      vim.g.vista_icon_indent = {'╰─▸ ', '├─▸ '}\n      vim.g.vista_fzf_preview = {'right:50%'}\n    " },
    loaded = true,
    path = "/Users/matt.fritz/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: vim-projectionist
time([[Setup for vim-projectionist]], true)
require('plugins.projectionist')
time([[Setup for vim-projectionist]], false)
time([[packadd for vim-projectionist]], true)
vim.cmd [[packadd vim-projectionist]]
time([[packadd for vim-projectionist]], false)
-- Setup for: vim-dispatch
time([[Setup for vim-dispatch]], true)
require('plugins.dispatch')
time([[Setup for vim-dispatch]], false)
time([[packadd for vim-dispatch]], true)
vim.cmd [[packadd vim-dispatch]]
time([[packadd for vim-dispatch]], false)
-- Setup for: vim-dadbod-ui
time([[Setup for vim-dadbod-ui]], true)
      vim.g.db_ui_win_position = 'right'
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_use_nerd_fonts = 1
    
time([[Setup for vim-dadbod-ui]], false)
time([[packadd for vim-dadbod-ui]], true)
vim.cmd [[packadd vim-dadbod-ui]]
time([[packadd for vim-dadbod-ui]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('plugins.gitsigns')
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require('colorizer').setup()
time([[Config for nvim-colorizer.lua]], false)
-- Config for: vista.vim
time([[Config for vista.vim]], true)
      vim.g.vista_default_executive = 'nvim_lsp'
      vim.g.vista_icon_indent = {'╰─▸ ', '├─▸ '}
      vim.g.vista_fzf_preview = {'right:50%'}
    
time([[Config for vista.vim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('plugins.lualine')
time([[Config for lualine.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('plugins.telescope')
time([[Config for telescope.nvim]], false)
-- Config for: luatab.nvim
time([[Config for luatab.nvim]], true)
require('plugins.luatab')
time([[Config for luatab.nvim]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
require('plugins.kommentary')
time([[Config for kommentary]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('plugins.treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: nvcode-color-schemes.vim
time([[Config for nvcode-color-schemes.vim]], true)
require('plugins.colors')
time([[Config for nvcode-color-schemes.vim]], false)
-- Config for: lexima.vim
time([[Config for lexima.vim]], true)
vim.cmd('autocmd FileType TelescopePrompt let b:lexima_disabled=1')
time([[Config for lexima.vim]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
require('plugins.vim-test')
time([[Config for vim-test]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('plugins.cmp-new')
time([[Config for nvim-cmp]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require('plugins.lspconfig')
time([[Config for nvim-lspconfig]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'packer.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
