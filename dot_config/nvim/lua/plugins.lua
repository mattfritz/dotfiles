vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]

return require('packer').startup(function(use, use_rocks)
  use_rocks 'penlight'
  use {
    'wbthomason/packer.nvim',
    event = 'VimEnter'
  }
  use {
    'nvim-telescope/telescope.nvim',
    config = [[require('plugins.telescope')]],
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
      {'nvim-telescope/telescope-project.nvim'}
    }
  }
  use {
    'neovim/nvim-lspconfig',
    config = [[require('plugins.lspconfig')]],
    requires = {
      'williamboman/nvim-lsp-installer',
      -- TODO: using forked lspsaga until neovim 0.6.0+ is supported
      -- 'glepnir/lspsaga.nvim'
      'tami5/lspsaga.nvim',
      'nanotee/sqls.nvim'
    }
  }
  use {
    'onsails/lspkind-nvim',
    config = [[require('plugins.lspkind')]],
    after = 'nvim-lspconfig'
  }
  use {
    'hrsh7th/nvim-cmp',
    config = [[require('plugins.cmp-new')]],
    requires = {
      'rafamadriz/friendly-snippets',
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'ray-x/cmp-treesitter'
    }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    config = [[require('plugins.treesitter')]],
    run = ':TSUpdate'
  }
  use {
    'rafamadriz/neon',
    config = [[require('plugins.colors')]]
  }
  use 'godlygeek/tabular'
  use {
    'cohama/lexima.vim',
    config = [[vim.cmd('call lexima#set_default_rules()')]],
    setup = [[require('plugins.lexima')]]
  }
  use 'machakann/vim-sandwich'
  use {
    'hoob3rt/lualine.nvim',
    config = [[require('plugins.lualine')]],
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-abolish'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
  use 'tommcdo/vim-fubitive'
  use 'vim-ruby/vim-ruby'
  use {
    'tpope/vim-dispatch',
    setup = [[require('plugins.dispatch')]]
  }
  use 'tpope/vim-dadbod'
  use {
    'kristijanhusak/vim-dadbod-ui',
    setup = [[
      vim.g.db_ui_win_position = 'right'
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_use_nerd_fonts = 1
    ]]
  }
  use 'kristijanhusak/vim-dadbod-completion'
  use 'tpope/vim-rails'
  use 'mhinz/vim-signify'
  use 'kshenoy/vim-signature'
  use 'junegunn/vim-peekaboo'
  use 'junegunn/gv.vim'
  use {
    'vim-test/vim-test',
    config = [[require('plugins.vim-test')]]
  }
  use {
    'b3nj5m1n/kommentary',
    config = [[require('plugins.kommentary')]]
  }
  use "npxbr/glow.nvim"
  use {
    'lewis6991/gitsigns.nvim',
    config = [[require('plugins.gitsigns')]],
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use 'christoomey/vim-tmux-navigator'
  use {
    'APZelos/blamer.nvim',
    config = [[require('plugins.blamer')]]
  }
  use {
    -- TODO: Refine this if color codes get annoying
    'norcalli/nvim-colorizer.lua',
    config = [[require('colorizer').setup()]]
  }
  use {
    'vimwiki/vimwiki',
    config = [[require('plugins.vimwiki')]]
  }
end)
