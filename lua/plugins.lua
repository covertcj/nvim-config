local util = require'util'

local USE_MOD_OPTS = {
  windows = true
}

return require('packer').startup(function ()
  use 'wbthomason/packer.nvim'

  local function use_mod(module, opts)
    opts = util.merge_tables(USE_MOD_OPTS, (opts or {}))
    if opts.windows == false and util.is_windows() then
      return
    end

    use(require('plugins.' .. module))
  end

  --[[ Theming / UI ]]--
  use_mod 'moonfly'
  use 'rakr/vim-one'
  use_mod 'lualine'
  use_mod 'which-key'

  use_mod('treesitter', { windows = false })


  --[[ General Editing ]]--
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-surround'


  --[[ git ]]--
  use 'tpope/vim-fugitive'
  use_mod 'gitsigns'


  --[[ completion / LSP ]]--
  use 'ms-jpq/coq.artifacts'
  use 'ms-jpq/coq_nvim'

  use 'ray-x/lsp_signature.nvim'
  use_mod 'lspconfig'

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
  use_mod 'telescope'


  --[[ Notes ]]--
  use_mod 'vimwiki'
end)

