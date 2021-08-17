local M = {}

function config()
  local lsp = require'lsp'
  vim.schedule(lsp.setup_lsp)
end

M.plugin = {
  'neovim/nvim-lspconfig',
  opt = false,
  requires = {'ms-jpq/coq_nvim'},
  config = config,
}

return M

