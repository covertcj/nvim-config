local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- automatically call packer sync when plugins.lua is saved
vim.cmd [[
  augroup PackerAutoResync
    autocmd!
    autocmd! BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- quit early when packer isnt installed yet
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { }
    end
  }
}

return require('packer').startup(function(use)
  use "wbthomason/packer.nvim"

  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  use {
    'bluz71/vim-moonfly-colors',
    config = function ()
      vim.g.moonflyItalics = 0
      vim.cmd[[ colorscheme moonfly ]]
    end
  }

  -- key mapping
  use 'folke/which-key.nvim'

  -- tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  
  use 'p00f/nvim-ts-rainbow'

  -- fuzzy finding
  use 'nvim-telescope/telescope.nvim'

  -- text editing
  use 'tpope/vim-surround'

  -- "tabs"
  use 'moll/vim-bbye'
  use {
    'akinsho/bufferline.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function ()
      require("bufferline").setup{}
    end
  }

  -- file tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function()
      require'nvim-tree'.setup {
        view = {
          side = 'right',
        },
        update_focused_file = {
          enable = true,
        },
      }
    end
  }

  -- git integration
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function () require'neogit'.setup() end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('gitsigns').setup() end
  }

  -- completion / snippets / LSP
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-nvim-lua'

  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
