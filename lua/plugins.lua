return require('packer').startup(function ()
  use 'wbthomason/packer.nvim'

  --[[ Theming ]]--
  use {
    'bluz71/vim-moonfly-colors',
    config = [[vim.cmd "colorscheme moonfly"]]
  }


  --[[ General Editing ]]--
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-surround'


  --[[ git ]]--
  use 'tpope/vim-fugitive'
  use {'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim'}


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
    end
  }

  --[[ Fuzzy / Search ]]--
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)

