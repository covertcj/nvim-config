return require('packer').startup(function ()
  use 'wbthomason/packer.nvim'

  use {
    'bluz71/vim-moonfly-colors',
    config = [[vim.cmd "colorscheme moonfly"]]
  }

  use 'b3nj5m1n/kommentary'

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

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)

