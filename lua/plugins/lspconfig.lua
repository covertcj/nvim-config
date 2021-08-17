function config()
  local lsp = require'lsp'
  vim.schedule(lsp.setup_lsp)
end

return {
  'neovim/nvim-lspconfig',
  opt = false,
  requires = {'ms-jpq/coq_nvim'},
  config = config,
}

