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

    use(require('plugins.' .. module).plugin)
  end

  --[[ Theming / UI ]]--
  use_mod 'moonfly'
  use 'rakr/vim-one'
  use_mod 'lualine'
  use_mod 'which-key'
  use_mod('treesitter', { windows = false })
  use_mod 'chadtree'
  use_mod 'floaterm'
  use_mod 'indent-blankline'
  use_mod 'neoscroll'
  use_mod 'barbar'


  --[[ General Editing ]]--
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'ggandor/lightspeed.nvim'
  use_mod 'neoformat'

  --[[ git ]]--
  use 'tpope/vim-fugitive'
  use_mod 'gitsigns'


  --[[ completion / LSP ]]--
  use 'ms-jpq/coq.artifacts'
  use_mod 'coq'

  use 'ray-x/lsp_signature.nvim'
  use_mod 'lspconfig'
  use 'glepnir/lspsaga.nvim'

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
  use_mod 'vim-zettel'
  -- TODO: checkout https://github.com/alok/notational-fzf-vim
  -- TODO: checkout https://github.com/michal-h21/vimwiki-sync
end)

