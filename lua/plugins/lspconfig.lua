local M = {}

M.plugin = {
  'neovim/nvim-lspconfig',
  opt = false,
  requires = {'ms-jpq/coq_nvim'},
  config = [[require'lsp'.setup_lsp()]],
}

return M

