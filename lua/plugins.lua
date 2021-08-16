return require('packer').startup(function ()
  use 'wbthomason/packer.nvim'

  --[[ Theming / UI ]]--
  use {
    'bluz71/vim-moonfly-colors',
    config = [[vim.cmd "colorscheme moonfly"]],
  }

  use {
    'hoob3rt/lualine.nvim',
    requires = "kyazdani42/nvim-web-devicons",
    config = function () require'plugins.lualine'.config() end,
  }


  --[[ General Editing ]]--
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-surround'


  --[[ git ]]--
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require'gitsigns'.setup() end
  }


  --[[ completion / LSP ]]--
  use 'ms-jpq/coq.artifacts'
  use 'ms-jpq/coq_nvim'

  use 'ray-x/lsp_signature.nvim'
  use {
    'neovim/nvim-lspconfig',
    opt = false,
    requires = {'ms-jpq/coq_nvim'},
    config = function ()
      local lsp = require'lsp'
      vim.schedule(lsp.setup_lsp)
    end,
  }

  -- use {
  --   "folke/trouble.nvim",
  --   requires = "kyazdani42/nvim-web-devicons",
  --   config = function()
  --     require("trouble").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --     }
  --   end
  -- }


  --[[ Fuzzy / Search ]]--
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
  }

  
  --[[ Notes ]]--
  use {
    'vimwiki/vimwiki',
    setup = function ()
      vim.g.vimwiki_folding = 'expr'
      vim.g.vimwiki_list = {{
        path = '~/notes/',
        syntax = 'markdown',
        ext = '.md',
      }}
    end,
  }
end)

