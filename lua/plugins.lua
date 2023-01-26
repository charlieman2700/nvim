require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-surround'

  use {
    'Shatur/neovim-session-manager',
    -- event = "BufWritePost",
    config = function()
      require 'configs.sessionManager'
    end,
  }
  use {
    'folke/which-key.nvim',
    config = function()
      vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]
      require('which-key').setup()
    end,
  }

  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  }
  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'configs.alpha'
    end,
  }

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  -- Fancier statusline
  use {
    'nvim-lualine/lualine.nvim',
  }

  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  } -- "gc" to comment visual regions/lines
  -- use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end

  -- LATEX
  use { 'lervag/vimtex' }

  -- FUNCIONALITY
  use 'airblade/vim-rooter'

  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      require('hop').setup()
      vim.api.nvim_set_keymap('n', 's', ':HopChar2<cr>', { silent = true })
      vim.api.nvim_set_keymap('n', 'S', ':HopWord<cr>', { silent = true })
    end,
  }

  use 'nvim-telescope/telescope-ui-select.nvim'

  -- use {
  -- 	"mfussenegger/nvim-dap-python",
  -- 	config = function()
  -- 		require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
  -- 	end,
  -- }

  use { 'catppuccin/nvim', as = 'catppuccin' }

  -- FORMATTING

  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require 'configs.formatter'
    end,
  }
  use {
    'windwp/nvim-ts-autotag',
  }
  use {
    'rafamadriz/friendly-snippets',
    config = function()
      -- require('luasnip').filetype_extend('ruby', { 'rails' })
    end,
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  }

  use 'savq/melange'
  use 'andersevenrud/nordic.nvim'
  use 'shaunsingh/moonlight.nvim'
  use 'frenzyexists/aquarium-vim'
  use 'folke/tokyonight.nvim'
  use 'ishan9299/nvim-solarized-lua'

  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require 'configs.commentTS'
    end,
  }
  use { 'luisiacc/gruvbox-baby', branch = 'main' }

  use 'hood/popui.nvim'

  use { 'thosakwe/vim-flutter' }

  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup {}
    end,
  }
  use { 'romgrk/barbar.nvim', wants = 'nvim-web-devicons' }

  -- React
  use {
    'napmn/react-extract.nvim',
    config = function()
      require 'configs.react-extract'
    end,
  }
  use {
    'folke/lsp-colors.nvim',
    config = function()
      require 'configs.lsp-colors'
    end,
  }
  use 'olimorris/onedarkpro.nvim'

  --Experimentig
  use 'Rigellute/shades-of-purple.vim'
end)
