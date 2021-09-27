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
local package_path_str = "/Users/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
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
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["blamer.nvim"] = {
    config = { "require('plugins.blamer')" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/blamer.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/cmp-treesitter"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "require('plugins.gitsigns')" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/glow.nvim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  kommentary = {
    config = { "require('plugins.kommentary')" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lexima.vim"] = {
    config = { "vim.cmd('call lexima#set_default_rules()')" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/lexima.vim"
  },
  ["lspkind-nvim"] = {
    config = { "require('plugins.lspkind')" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "require('plugins.lspsaga')" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('plugins.lualine')" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  neon = {
    config = { "require('plugins.colors')" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/neon"
  },
  ["nvim-cmp"] = {
    config = { "require('plugins.cmp')" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require('colorizer').setup()" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    after = { "lspsaga.nvim", "lspkind-nvim" },
    loaded = true,
    only_config = true
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-treesitter"] = {
    config = { "require('plugins.treesitter')" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  tabular = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('plugins.telescope')" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui"
  },
  ["vim-dispatch"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-fubitive"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-fubitive"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-peekaboo"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-rails"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-ruby"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-ruby"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    config = { "require('plugins.vim-test')" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  vimwiki = {
    config = { "require('plugins.vimwiki')" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vimwiki"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: lexima.vim
time([[Setup for lexima.vim]], true)
require('plugins.lexima')
time([[Setup for lexima.vim]], false)
time([[packadd for lexima.vim]], true)
vim.cmd [[packadd lexima.vim]]
time([[packadd for lexima.vim]], false)
-- Setup for: vim-dispatch
time([[Setup for vim-dispatch]], true)
require('plugins.dispatch')
time([[Setup for vim-dispatch]], false)
time([[packadd for vim-dispatch]], true)
vim.cmd [[packadd vim-dispatch]]
time([[packadd for vim-dispatch]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('plugins.treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: vimwiki
time([[Config for vimwiki]], true)
require('plugins.vimwiki')
time([[Config for vimwiki]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('plugins.lualine')
time([[Config for lualine.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('plugins.gitsigns')
time([[Config for gitsigns.nvim]], false)
-- Config for: neon
time([[Config for neon]], true)
require('plugins.colors')
time([[Config for neon]], false)
-- Config for: blamer.nvim
time([[Config for blamer.nvim]], true)
require('plugins.blamer')
time([[Config for blamer.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('plugins.cmp')
time([[Config for nvim-cmp]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require('colorizer').setup()
time([[Config for nvim-colorizer.lua]], false)
-- Config for: lexima.vim
time([[Config for lexima.vim]], true)
vim.cmd('call lexima#set_default_rules()')
time([[Config for lexima.vim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require('plugins.lspconfig')
time([[Config for nvim-lspconfig]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
require('plugins.vim-test')
time([[Config for vim-test]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('plugins.telescope')
time([[Config for telescope.nvim]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
require('plugins.kommentary')
time([[Config for kommentary]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd lspsaga.nvim ]]

-- Config for: lspsaga.nvim
require('plugins.lspsaga')

vim.cmd [[ packadd lspkind-nvim ]]

-- Config for: lspkind-nvim
require('plugins.lspkind')

time([[Sequenced loading]], false)
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
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
