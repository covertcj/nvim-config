return require('packer').startup(function ()
  use 'wbthomason/packer.nvim'

  use {
    'bluz71/vim-moonfly-colors',
    config = [[vim.cmd "colorscheme moonfly"]]
  }

  use 'b3nj5m1n/kommentary'

  use 'ms-jpq/coq.artifacts'
  use 'ms-jpq/coq_nvim'

  use {
    'neovim/nvim-lspconfig',
    opt = false,
    --requires = {'ms-jpq/coq_nvim'}, TODO: see above
    config = function ()
      vim.schedule(function ()
        local lsp = require'lspconfig'
        require('packer').loader('coq_nvim coq.artifacts')
        local coq = require'coq'()

        lsp.tsserver.setup(coq.lsp_ensure_capabilities{})
      end)
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)

