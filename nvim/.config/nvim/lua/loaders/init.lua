local use = require("packer").use

require("packer").startup(function()
  use "wbthomason/packer.nvim" -- Package manager
  use "tpope/vim-fugitive" -- Git commands in nvim
  use 'lewis6991/impatient.nvim'
  use "tpope/vim-rhubarb" -- Fugitive-companion to interact with github
  use "numToStr/Comment.nvim" -- "gc" to comment visual regions/lines
  -- UI to select things (files, grep results, open buffers...)
  use {
    "nvim-telescope/telescope.nvim",
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require'telescope'.setup(require'prefs.telescope')
    end,
  }
  use {"nvim-telescope/telescope-fzf-native.nvim", run = 'make' }
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require'lualine'.setup(require'prefs.lualine')
    end,
  } -- Fancier statusline
  -- Add indentation guides even on blank lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require'prefs.blankline'.setup()
    end,
  }
  -- Add git related info in the signs columns and popups
  use { "lewis6991/gitsigns.nvim", requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use "nvim-treesitter/nvim-treesitter"
  -- Additional textobjects for treesitter
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client
  use "hrsh7th/nvim-cmp" -- Autocompletion plugin
  use {
    "hrsh7th/cmp-nvim-lsp",
    requires = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer"
    }
  }
  use {
    "saadparwaiz1/cmp_luasnip",
    requires = {
      "rafamadriz/friendly-snippets"
    }
  }
  use {
    "ray-x/lsp_signature.nvim",
    config = function() require"lsp_signature".setup({}) end,
  }
  use "L3MON4D3/LuaSnip" -- Snippets plugin
  use "williamboman/nvim-lsp-installer"
  use "caenrique/nvim-toggle-terminal"
  use "windwp/nvim-autopairs"

  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons"
    },
    config = function() require "nvim-tree".setup {} end,
  }

  use {
    "akinsho/bufferline.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons"
    },
    config = function() require "prefs.bufferline" end,
  }

  use {
    'nmac427/guess-indent.nvim',
    config = function() require('guess-indent').setup {} end,
  }

  use {
    "phaazon/hop.nvim",
    branch = "v1", -- optional but recommended
    config = function()
      require"hop".setup { keys = 'asdfjklewio' }
    end
  }
  
  use {
    "tpope/vim-surround",
  }

  -- Markdown
  use {
    "dhruvasagar/vim-table-mode",
    ft = {
      "markdown",
    },
  }

  use {
    'iamcco/markdown-preview.nvim',
    ft = {
      'markdown',
    },
    run = 'cd app && npm install',
    cmd = 'MarkdownPreview',
  }

  use {
    'lervag/vimtex',
    ft = {
      'latex',
      'tex'
    }
  }
end)
