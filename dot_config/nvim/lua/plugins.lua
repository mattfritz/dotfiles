-- Plugin specification docs: https://github.com/wbthomason/packer.nvim#specifying-plugins
vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]

return require('packer').startup(function(use, use_rocks)
  use_rocks 'penlight'
  use {
    'wbthomason/packer.nvim',
    event = 'VimEnter'
  }

  local config = function(name)
      return string.format("require('plugins.%s')", name)
  end

  local use_with_config = function(path, name)
      use({ path, config = config(name) })
  end

  -- use 'github/copilot.vim'
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          prompt = false,
        }
      })
    end,
  }
  use {
    'zbirenbaum/copilot-cmp',
    -- after = { 'copilot.lua' },
    -- before = { 'nvim-cmp' },
    config = function ()
      require('copilot_cmp').setup({
        -- formatters = {
        --   insert_text = require('copilot_cmp.format').remove_existing
        -- },
      })
    end
  }
  use {
    'folke/trouble.nvim',
    config = [[require('trouble').setup()]],
    requires = 'kyazdani42/nvim-web-devicons'
  }
  -- use { -- TODO: add additional functionality: https://github.com/ibhagwan/nvim-lua/tree/main/lua/plugins/fzf-lua
  --   'ibhagwan/fzf-lua',
  --   config = [[require('plugins.fzf-lua')]],
  --   requires = 'kyazdani42/nvim-web-devicons'
  -- }
  use {
    'nvim-telescope/telescope.nvim',
    config = [[require('plugins.telescope')]],
    requires = {
      {
        'nvim-lua/plenary.nvim',
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          run = 'make'
        },
        'nvim-telescope/telescope-file-browser.nvim',
        'cljoly/telescope-repo.nvim'
      }
    }
  }
  use {
    'neovim/nvim-lspconfig',
    config = [[require('plugins.lspconfig')]],
    requires = {
      'nanotee/sqls.nvim'
    }
  }
  use {
    'hrsh7th/nvim-cmp',
    config = [[require('plugins.cmp')]],
    requires = {
      'rafamadriz/friendly-snippets',
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'kristijanhusak/vim-dadbod-completion',
      'onsails/lspkind-nvim',
      'saadparwaiz1/cmp_luasnip',
      'ray-x/cmp-treesitter',
      'lukas-reineke/cmp-under-comparator',
      'zbirenbaum/copilot-cmp'
    }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    config = [[require('plugins.treesitter')]],
    run = ':TSUpdate',
  }
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = [[require('octo').setup()]]
  }
  use {
    'andymass/vim-matchup',
    after = 'nvim-treesitter'
  }
  use {
    'RRethy/nvim-treesitter-endwise',
    config = [[require('plugins.nvim-treesitter-endwise')]],
    after = 'nvim-treesitter'
  }
  use {
    'ChristianChiarulli/nvcode-color-schemes.vim',
    config = [[require('plugins.colors')]]
  }
  use 'junegunn/vim-easy-align'
  use 'godlygeek/tabular' -- LEARN: shortcuts
  use {
    'cohama/lexima.vim',
    config = [[vim.cmd('autocmd FileType TelescopePrompt let b:lexima_disabled=1')]]
  }
  use {
    'hoob3rt/lualine.nvim',
    config = [[require('plugins.lualine')]],
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'alvarosevilla95/luatab.nvim',
    config = [[require('plugins.luatab')]],
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use 'machakann/vim-sandwich' -- LEARN: shortcuts
  use 'tpope/vim-fugitive' -- LEARN: compare with gitsigns/neogit
  use 'tpope/vim-unimpaired' -- LEARN: shortcuts
  use {
    'tpope/vim-projectionist',
    setup = [[require('plugins.projectionist')]]
  } -- LEARN: mappings
  use 'tpope/vim-abolish'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-sleuth'
  use 'nathom/filetype.nvim'
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
      vim.g.db_ui_winwidth = 60
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_use_nerd_fonts = 1
    ]]
  }
  use 'kristijanhusak/vim-dadbod-completion'
  use 'tpope/vim-rails'
  use 'kshenoy/vim-signature' -- LEARN: marks
  use 'junegunn/vim-peekaboo' -- LEARN: registers
  use 'junegunn/gv.vim' -- LEARN: shortcuts
  use {
    'vim-test/vim-test',
    config = [[require('plugins.vim-test')]]
  }
  use {
    'b3nj5m1n/kommentary',
    config = [[require('plugins.kommentary')]]
  }
  use {
    'gaoDean/autolist.nvim',
    config = [[require('autolist').setup({})]]
  }
  use {
    'glepnir/hlsearch.nvim',
    event = 'BufRead',
    config = [[require('hlsearch').setup({})]]
  }
  use {
    'lewis6991/gitsigns.nvim', -- LEARN: compare with vim-fugitive/neogit
    config = [[require('plugins.gitsigns')]],
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use 'christoomey/vim-tmux-navigator'
  use {
    'norcalli/nvim-colorizer.lua',
    config = [[require('colorizer').setup()]]
  }
  use {
    'liuchengxu/vista.vim',
    config = [[
      vim.g.vista_default_executive = 'nvim_lsp'
      vim.g.vista_icon_indent = {'╰─▸ ', '├─▸ '}
      vim.g.vista_fzf_preview = {'right:50%'}
    ]],
  }
end)

